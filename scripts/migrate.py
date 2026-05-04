#!/usr/bin/env python3
"""
migrate.py — 一次性遷移腳本

對每個題目資料夾：
  1. 將 solution.py/dart/swift（完整實作）複製為 solution_optimal.*
  2. 將 solution.py/dart/swift 改寫為「保留正確方法簽名、清空 body」的空白骨架

用法：
    python scripts/migrate.py           # 初次遷移（solution.* → solution_optimal.*）
    python scripts/migrate.py --regen   # 重新生成骨架（從 solution_optimal.* 覆寫 solution.*）
"""

import ast
import re
import shutil
import sys
from pathlib import Path

PROBLEMS_DIR = Path(__file__).parent.parent / "problems"

# Python: 這些類別保留完整實作（標準資料結構，非解答本身）
PY_KEEP_CLASSES = {"TreeNode", "ListNode"}

# Dart / Swift: 同上
DS_KEEP_CLASSES = {"TreeNode", "ListNode"}

# Dart 骨架中不保留的純測試輔助函式名稱前綴（這些僅在完整解答中需要）
_DART_TEST_HELPER_PREFIXES = ("_expect", "_norm", "_check", "_verify", "_assert", "_eq")


def _is_dart_test_helper(func_name: str) -> bool:
    """判斷 `_`-前綴的頂層函式是否為純測試輔助（不應放入空白骨架）。"""
    lower = func_name.lower()
    return any(lower.startswith(p) for p in _DART_TEST_HELPER_PREFIXES)


# ════════════════════════════════════════════════════════════════════════════
# 通用工具：平衡括號搜尋（Dart / Swift 用）
# ════════════════════════════════════════════════════════════════════════════

def find_closing_brace(text: str, open_pos: int) -> int:
    """回傳 text[open_pos] = '{' 對應的 '}' 位置，找不到回傳 -1。"""
    depth = 0
    i = open_pos
    n = len(text)
    while i < n:
        ch = text[i]
        if text[i:i + 2] == "//":
            while i < n and text[i] != "\n":
                i += 1
        elif text[i:i + 2] == "/*":
            end = text.find("*/", i + 2)
            i = end + 2 if end != -1 else n
        elif ch in ('"', "'"):
            # 多行字串 (""" 或 ''') 也以同樣 quote 開始
            triple = text[i:i + 3]
            if triple in ('"""', "'''"):
                end = text.find(triple, i + 3)
                i = end + 3 if end != -1 else n
            else:
                quote = ch
                i += 1
                while i < n and text[i] != quote:
                    if text[i] == "\\":
                        i += 1
                    i += 1
                i += 1
        elif ch == "{":
            depth += 1
            i += 1
        elif ch == "}":
            depth -= 1
            if depth == 0:
                return i
            i += 1
        else:
            i += 1
    return -1


# ════════════════════════════════════════════════════════════════════════════
# Python 骨架（AST-based）
# ════════════════════════════════════════════════════════════════════════════

def _node_src(lines: list[str], node) -> str:
    return "\n".join(lines[node.lineno - 1: node.end_lineno])


def _blank_py_func(lines: list[str], func) -> str:
    """回傳函式定義，body 替換為 pass。"""
    body_line_idx = func.body[0].lineno - 1
    sig_lines = lines[func.lineno - 1: body_line_idx]
    body_line = lines[body_line_idx]
    indent = len(body_line) - len(body_line.lstrip())
    return "\n".join(sig_lines) + "\n" + " " * indent + "pass"


def _blank_py_class(lines: list[str], cls: ast.ClassDef) -> str:
    """回傳類別定義，所有方法 body 替換為 pass，其餘（__slots__ 等）保留。"""
    body_header_end = cls.body[0].lineno - 1
    parts = ["\n".join(lines[cls.lineno - 1: body_header_end])]
    for item in cls.body:
        if isinstance(item, (ast.FunctionDef, ast.AsyncFunctionDef)):
            parts.append(_blank_py_func(lines, item))
            parts.append("")
        else:
            # __slots__、型別標注、class docstring 等 → 原樣保留
            parts.append(_node_src(lines, item))
    return "\n".join(parts)


def _is_main_guard(node) -> bool:
    return (
        isinstance(node, ast.If)
        and isinstance(node.test, ast.Compare)
        and len(node.test.ops) == 1
        and isinstance(node.test.ops[0], ast.Eq)
        and isinstance(node.test.left, ast.Name)
        and node.test.left.id == "__name__"
    )


def _py_main_scaffold(main_class: str) -> str:
    var = main_class[0].lower() + main_class[1:]
    return (
        'if __name__ == "__main__":\n'
        f"    {var} = {main_class}()\n\n"
        "    # Test 1\n"
        f"    # result = {var}.solve(...)\n"
        "    # assert result == expected\n\n"
        '    print("All tests passed!")'
    )


def make_python_skeleton(source: str) -> str:
    """將完整 Python 解答轉換為空白骨架（保留方法簽名）。"""
    tree = ast.parse(source)
    lines = source.splitlines()
    blocks: list[str] = []
    start = 0

    # 模組 docstring
    if (
        tree.body
        and isinstance(tree.body[0], ast.Expr)
        and isinstance(tree.body[0].value, ast.Constant)
        and isinstance(tree.body[0].value.value, str)
    ):
        blocks.append(_node_src(lines, tree.body[0]))
        start = 1

    # 找出主要類別名稱（用於 scaffold）
    # 優先找 Solution，其次找非私有（不以 _ 開頭）的解答類別
    main_class = "Solution"
    for node in tree.body[start:]:
        if (
            isinstance(node, ast.ClassDef)
            and node.name not in PY_KEEP_CLASSES
            and not node.name.startswith("_")
        ):
            main_class = node.name
            break

    for node in tree.body[start:]:
        if isinstance(node, (ast.Import, ast.ImportFrom)):
            blocks.append(_node_src(lines, node))

        elif isinstance(node, ast.ClassDef):
            if node.name in PY_KEEP_CLASSES:
                blocks.append(_node_src(lines, node))
            else:
                blocks.append(_blank_py_class(lines, node))

        elif isinstance(node, (ast.FunctionDef, ast.AsyncFunctionDef)):
            # 模組層級函式都是測試輔助工具 → 原樣保留
            blocks.append(_node_src(lines, node))

        elif _is_main_guard(node):
            blocks.append(_py_main_scaffold(main_class))

        else:
            blocks.append(_node_src(lines, node))

    return "\n\n".join(b for b in blocks if b.strip()) + "\n"


# ════════════════════════════════════════════════════════════════════════════
# Dart 骨架（Regex + 平衡括號）
# ════════════════════════════════════════════════════════════════════════════

def _dart_default_return(ret_type: str) -> str:
    rt = ret_type.strip()
    nullable = rt.endswith("?")
    base = rt.rstrip("?").strip()
    if not base or base == "void":
        return ""
    if nullable:
        return "return null;"
    if "List" in base:
        return "return [];"
    if "Map" in base or "Set" in base:
        return "return {};"
    if base == "bool":
        return "return false;"
    if base in ("int", "double", "num"):
        return "return 0;"
    if base == "String":
        return 'return "";'
    # 非可空自訂型別（如 TreeNode）無法 return null，改用 throw
    return "throw UnimplementedError();"


# 匹配 Dart 類別定義（頂層，行首）
DART_CLASS_RE = re.compile(
    r"^((?:(?:final|abstract|sealed)\s+)*class\s+(\w+)[^{]*)\{",
    re.MULTILINE,
)

# 匹配 Dart 頂層函式（行首，非空白開頭）
DART_FUNC_RE = re.compile(
    r"^((?:[\w<>\[\]?,]+(?:\?)?)\s+(\w+)\s*\([^)]*\))\s*\{",
    re.MULTILINE,
)

# 匹配 Dart 類別內的方法（含建構子，{ body } 形式）
# 注意：return type 群組使用 [ \t]+ 和 + 量詞，防止跨行或純空白匹配
DART_METHOD_RE = re.compile(
    r"((?:(?:static|@\w+\s*)\s+)*(?:[\w<>\[\]?,]+\??[ \t]+)?(\w+)\s*\([^)]*\))\s*\{",
    re.MULTILINE,
)

# 匹配 Dart 類別內的 arrow 方法（=> expr; 形式）
DART_ARROW_METHOD_RE = re.compile(
    r"^([ \t]*)((?:(?:static|@\w+\s*)\s+)*(?:[\w<>\[\]?,]*\??\s+)?(\w+)\s*\([^)]*\))\s*=>[^;]+;",
    re.MULTILINE,
)


def _dart_blank_class_body(body: str, method_indent: int = 2) -> str:
    """清空 Dart 類別 body 中所有方法的實作（保留欄位宣告）。"""
    result = []
    pos = 0

    # 先將 arrow 方法轉為 { body } 形式
    def _expand_arrow(m: re.Match) -> str:
        indent = m.group(1)
        sig = m.group(2)
        name = m.group(3)
        ret_match = re.match(r"^(.*?)\s+" + re.escape(name) + r"\s*\(", sig, re.DOTALL)
        raw_ret = ret_match.group(1).strip() if ret_match else ""
        clean_ret = re.sub(r"^\s*(?:static|@\w+)\s+", "", raw_ret).strip()
        default_ret = _dart_default_return(clean_ret)
        expanded = f"{indent}{sig} {{\n"
        expanded += f"{indent}  // TODO: implement\n"
        if default_ret:
            expanded += f"{indent}  {default_ret}\n"
        expanded += f"{indent}}}"
        return expanded

    body = DART_ARROW_METHOD_RE.sub(_expand_arrow, body)

    for m in DART_METHOD_RE.finditer(body):
        brace_start = body.find("{", m.start())
        if brace_start == -1 or brace_start > m.end() + 5:
            continue
        close_pos = find_closing_brace(body, brace_start)
        if close_pos == -1:
            continue

        # 確保是類別直接成員（縮排 == method_indent），過濾方法體內的 local function
        line_start = body.rfind("\n", 0, m.start()) + 1
        line_prefix = body[line_start: m.start()]
        cur_indent_here = len(line_prefix) - len(line_prefix.lstrip())
        if cur_indent_here > method_indent:
            continue  # 巢狀 local function，跳過

        # 確保這不是巢狀宣告（例如 Map 初始化值 {} 不是方法）
        sig_text = line_prefix.strip()
        if sig_text and not sig_text.startswith("//"):
            if any(c in sig_text for c in ("=", ";")):
                continue

        result.append(body[pos: m.start()])

        # 取得縮排
        line_start = body.rfind("\n", 0, m.start()) + 1
        line = body[line_start: m.start()]
        cur_indent = len(line) - len(line.lstrip())
        body_indent_str = " " * (cur_indent + 2)
        indent_str = " " * cur_indent

        # 取得回傳型別
        sig = m.group(1)
        name = m.group(2)
        ret_match = re.match(
            r"^(.*?)\s+" + re.escape(name) + r"\s*\(", sig, re.DOTALL
        )
        raw_ret = ret_match.group(1).strip() if ret_match else ""
        # 去掉修飾詞
        clean_ret = re.sub(r"^\s*(?:static|@\w+)\s+", "", raw_ret).strip()
        default_ret = _dart_default_return(clean_ret)

        blanked = m.group(0) + "\n"  # signature + {
        blanked += body_indent_str + "// TODO: implement\n"
        if default_ret:
            blanked += body_indent_str + default_ret + "\n"
        blanked += indent_str + "}"

        result.append(blanked)
        pos = close_pos + 1

    result.append(body[pos:])
    return "".join(result)


def _dart_main_scaffold() -> str:
    return (
        "void main() {\n"
        "  // Test 1\n"
        "  // final result = solve(...);\n"
        "  print('All tests passed!');\n"
        "}"
    )


def make_dart_skeleton(source: str) -> str:
    """將完整 Dart 解答轉換為空白骨架（保留方法簽名）。"""
    lines = source.splitlines()

    # 擷取標頭註解
    header_end = 0
    while header_end < len(lines) and (
        lines[header_end].startswith("//") or lines[header_end].strip() == ""
    ):
        header_end += 1
    while header_end > 0 and lines[header_end - 1].strip() == "":
        header_end -= 1
    header = "\n".join(lines[:header_end])

    body_text = "\n".join(lines[header_end:]).lstrip("\n")

    # 擷取 import 陳述式（class/func 宣告之前）
    import_lines: list[str] = []
    for line in body_text.splitlines():
        if line.startswith("import "):
            import_lines.append(line.rstrip())
    imports_text = "\n".join(import_lines)

    # 收集所有頂層宣告（class / function）
    declarations: list[tuple] = []

    for m in DART_CLASS_RE.finditer(body_text):
        # 確保是頂層（行首無縮排）
        line_start = body_text.rfind("\n", 0, m.start()) + 1
        if body_text[line_start: m.start()].strip():
            continue
        brace_pos = m.end() - 1
        close_pos = find_closing_brace(body_text, brace_pos)
        if close_pos != -1:
            declarations.append(("class", m, brace_pos, close_pos))

    for m in DART_FUNC_RE.finditer(body_text):
        # 確保是頂層
        line_start = body_text.rfind("\n", 0, m.start()) + 1
        if body_text[line_start: m.start()].strip():
            continue
        brace_pos = m.end() - 1
        close_pos = find_closing_brace(body_text, brace_pos)
        if close_pos != -1:
            declarations.append(("func", m, brace_pos, close_pos))

    declarations.sort(key=lambda x: x[1].start())

    result_parts: list[str] = []
    has_main = False

    for decl_type, m, brace_pos, close_pos in declarations:
        full_decl = body_text[m.start(): close_pos + 1]

        if decl_type == "class":
            class_name = m.group(2)
            if class_name in DS_KEEP_CLASSES:
                result_parts.append(full_decl)
            else:
                class_header = m.group(0)  # class Foo ... {
                class_body = body_text[m.end(): close_pos]
                blanked = _dart_blank_class_body(class_body)
                result_parts.append(class_header + blanked + "}")

        elif decl_type == "func":
            func_name = m.group(2)
            sig = m.group(1)

            if func_name == "main":
                result_parts.append(_dart_main_scaffold())
                has_main = True
            elif func_name.startswith("_") and _is_dart_test_helper(func_name):
                # 純測試輔助（_expect、_norm 等）→ 移除，在 solution_optimal.dart 仍可參考
                pass
            elif func_name.startswith("_"):
                # 解答工具函式（_isAlnum、_toLower、_merge2 等）→ 保留
                result_parts.append(full_decl)
            elif func_name in ("fromLevel", "toList", "from_level", "to_list"):
                result_parts.append(full_decl)
            else:
                # 解答函式 → 清空 body
                ret_match = re.match(
                    r"^(.*?)\s+" + re.escape(func_name) + r"\s*\(", sig, re.DOTALL
                )
                ret_type = ret_match.group(1).strip() if ret_match else ""
                default_ret = _dart_default_return(ret_type)

                # m.group(0) 已含結尾的 {，直接換行
                blanked = m.group(0) + "\n"
                blanked += "  // TODO: implement\n"
                if default_ret:
                    blanked += "  " + default_ret + "\n"
                blanked += "}"
                result_parts.append(blanked)

        result_parts.append("")  # 宣告之間的空行

    if not has_main:
        result_parts.append(_dart_main_scaffold())
        result_parts.append("")

    body_result = "\n".join(result_parts).strip()
    parts = [p for p in [header, imports_text, body_result] if p]
    return "\n\n".join(parts) + "\n"


# ════════════════════════════════════════════════════════════════════════════
# Swift 骨架（Regex + 平衡括號）
# ════════════════════════════════════════════════════════════════════════════

def _swift_default_return(ret_type: str) -> str:
    rt = ret_type.strip() if ret_type else ""
    nullable = rt.endswith("?") or rt.endswith("!")
    base = rt.rstrip("?!").strip()
    if not base:
        return ""
    if nullable:
        return "return nil"
    if base.startswith("[") and ":" in base:
        return "return [:]"
    if base.startswith("["):
        return "return []"
    if base == "Bool":
        return "return false"
    if base in ("Int", "Double", "Float"):
        return "return 0"
    if base == "String":
        return 'return ""'
    return "return nil"


# 匹配 Swift 頂層類別 / 結構體
SWIFT_CLASS_RE = re.compile(
    r"^((?:(?:final|open|public|internal|private|@\w+\s*)\s+)*(?:class|struct)\s+(\w+)[^{]*)\{",
    re.MULTILINE,
)

# 匹配 Swift 頂層函式（func 關鍵字開頭的行）
SWIFT_FUNC_RE = re.compile(
    r"^((?:(?:private|public|internal|static|@\w+\s*)\s+)*func\s+(\w+)\s*\([^)]*\)"
    r"(?:\s*->\s*([\w<>\[\]?,\s\[\].?!]+?))?)\s*\{",
    re.MULTILINE,
)

# 匹配 Swift 類別內的方法（含 init）
SWIFT_METHOD_RE = re.compile(
    r"((?:(?:private|public|internal|static|override|final|required|convenience|@\w+\s*)\s+)*"
    r"(?:func\s+(\w+)|init)\s*\([^)]*\)(?:\s*->\s*([\w<>\[\]?,\s\[\].?!]+?))?)\s*\{",
    re.MULTILINE,
)


def _swift_blank_class_body(body: str) -> str:
    """清空 Swift 類別 body 中所有方法 / init 的實作。"""
    result = []
    pos = 0
    matches: list[tuple] = []

    for m in SWIFT_METHOD_RE.finditer(body):
        brace_start = body.find("{", m.start())
        if brace_start == -1 or brace_start > m.end() + 5:
            continue
        close_pos = find_closing_brace(body, brace_start)
        if close_pos == -1:
            continue
        # 確保行首是方法定義（非縮排的閉包）
        line_start = body.rfind("\n", 0, m.start()) + 1
        pre = body[line_start: m.start()]
        if pre.strip() and any(c in pre for c in ("=", "(", "{")):
            continue
        matches.append((m.start(), m, brace_start, close_pos))

    matches.sort(key=lambda x: x[0])

    for start_pos, m, brace_start, close_pos in matches:
        if start_pos < pos:
            continue

        result.append(body[pos: m.start()])

        # 取得縮排
        line_start = body.rfind("\n", 0, m.start()) + 1
        line = body[line_start: m.start()]
        cur_indent = len(line) - len(line.lstrip())
        body_indent_str = " " * (cur_indent + 4)
        indent_str = " " * cur_indent

        # 取得回傳型別
        groups = m.groups()
        ret_type = groups[2].strip() if len(groups) > 2 and groups[2] else ""
        default_ret = _swift_default_return(ret_type)

        blanked = m.group(0) + "\n"  # signature + {
        blanked += body_indent_str + "// TODO: implement\n"
        if default_ret:
            blanked += body_indent_str + default_ret + "\n"
        blanked += indent_str + "}"

        result.append(blanked)
        pos = close_pos + 1

    result.append(body[pos:])
    return "".join(result)


def _swift_test_scaffold() -> str:
    return (
        "// MARK: - Tests\n"
        "// let s = Solution()\n\n"
        "// Test 1\n"
        "// let result = s.solve(...)\n\n"
        'print("All tests passed!")'
    )


def make_swift_skeleton(source: str) -> str:
    """將完整 Swift 解答轉換為空白骨架（保留方法簽名）。"""
    lines = source.splitlines()

    # 擷取標頭
    header_end = 0
    while header_end < len(lines) and (
        lines[header_end].startswith("//") or lines[header_end].strip() == ""
    ):
        header_end += 1
    while header_end > 0 and lines[header_end - 1].strip() == "":
        header_end -= 1
    header = "\n".join(lines[:header_end])

    rest_lines = lines[header_end:]

    # 取出 import 敘述
    imports = []
    body_start = 0
    for i, line in enumerate(rest_lines):
        if line.startswith("import "):
            imports.append(line)
            body_start = i + 1
        elif line.strip() == "":
            if imports:
                body_start = i + 1
        else:
            if not line.startswith("import "):
                body_start = i
                break

    body_text = "\n".join(rest_lines[body_start:]).lstrip("\n")

    declarations: list[tuple] = []

    for m in SWIFT_CLASS_RE.finditer(body_text):
        line_start = body_text.rfind("\n", 0, m.start()) + 1
        if body_text[line_start: m.start()].strip():
            continue
        brace_pos = m.end() - 1
        close_pos = find_closing_brace(body_text, brace_pos)
        if close_pos != -1:
            declarations.append(("class", m, brace_pos, close_pos))

    for m in SWIFT_FUNC_RE.finditer(body_text):
        line_start = body_text.rfind("\n", 0, m.start()) + 1
        if body_text[line_start: m.start()].strip():
            continue
        brace_pos = m.end() - 1
        close_pos = find_closing_brace(body_text, brace_pos)
        if close_pos != -1:
            declarations.append(("func", m, brace_pos, close_pos))

    declarations.sort(key=lambda x: x[1].start())

    result_parts: list[str] = []

    for decl_type, m, brace_pos, close_pos in declarations:
        full_decl = body_text[m.start(): close_pos + 1]

        if decl_type == "class":
            class_name = m.group(2)
            if class_name in DS_KEEP_CLASSES:
                result_parts.append(full_decl)
            else:
                class_header = m.group(0)
                class_body = body_text[m.end(): close_pos]
                blanked = _swift_blank_class_body(class_body)
                result_parts.append(class_header + blanked + "}")

        elif decl_type == "func":
            func_name = m.group(2)
            # check* 或 _* 開頭視為測試輔助 → 保留
            is_utility = func_name.startswith(("check", "_", "from", "to"))
            if is_utility:
                result_parts.append(full_decl)
            else:
                ret_type = m.group(3) or ""
                default_ret = _swift_default_return(ret_type.strip())
                blanked = m.group(0) + "\n"
                blanked += "    // TODO: implement\n"
                if default_ret:
                    blanked += "    " + default_ret + "\n"
                blanked += "}"
                result_parts.append(blanked)

        result_parts.append("")

    # 最後加入測試腳手架（取代原本的頂層測試程式碼）
    result_parts.append(_swift_test_scaffold())

    body_result = "\n".join(result_parts).strip()

    parts = []
    if header:
        parts.append(header)
    if imports:
        parts.append("\n".join(imports))
    parts.append(body_result)

    return "\n\n".join(parts) + "\n"


# ════════════════════════════════════════════════════════════════════════════
# 遷移主邏輯
# ════════════════════════════════════════════════════════════════════════════

SKELETON_MAKERS = {
    "solution.py": make_python_skeleton,
    "solution.dart": make_dart_skeleton,
    "solution.swift": make_swift_skeleton,
}


def migrate_folder(folder: Path) -> dict[str, int]:
    stats = {"copied": 0, "blanked": 0, "skipped": 0, "errors": 0}

    for src_name, make_skeleton in SKELETON_MAKERS.items():
        src_path = folder / src_name
        if not src_path.exists():
            continue

        ext = src_path.suffix
        opt_path = folder / ("solution_optimal" + ext)

        # 如果 solution_optimal.* 已存在 → 代表已遷移，跳過
        if opt_path.exists():
            stats["skipped"] += 1
            continue

        source = src_path.read_text(encoding="utf-8")

        # Step 1: 複製到 solution_optimal.*
        shutil.copy2(src_path, opt_path)
        stats["copied"] += 1

        # Step 2: 建立空白骨架，覆寫 solution.*
        try:
            skeleton = make_skeleton(source)
            src_path.write_text(skeleton, encoding="utf-8")
            stats["blanked"] += 1
        except Exception as e:
            print(f"    ERROR blanking {src_path.name}: {e}")
            stats["errors"] += 1
            # 回滾：還原原始內容
            src_path.write_text(source, encoding="utf-8")

    return stats


def main() -> None:
    total: dict[str, int] = {"copied": 0, "blanked": 0, "skipped": 0, "errors": 0}

    problem_folders = []
    for cat_dir in sorted(PROBLEMS_DIR.iterdir()):
        if not cat_dir.is_dir():
            continue
        for prob_dir in sorted(cat_dir.iterdir()):
            if prob_dir.is_dir():
                problem_folders.append(prob_dir)

    print(f"找到 {len(problem_folders)} 個題目資料夾\n")

    error_list: list[str] = []
    for folder in problem_folders:
        stats = migrate_folder(folder)
        for k in total:
            total[k] += stats[k]
        if stats["errors"]:
            error_list.append(f"  ⚠ {folder.name}: {stats['errors']} 個錯誤")

    print("遷移完成！")
    print(f"  solution.* → solution_optimal.*：{total['copied']} 個檔案")
    print(f"  空白骨架建立完成：{total['blanked']} 個檔案")
    print(f"  已遷移（跳過）：{total['skipped']} 個檔案")
    if error_list:
        print(f"\n發生錯誤（{total['errors']} 個）：")
        for msg in error_list:
            print(msg)
    else:
        print(f"\n✓ 全部成功，無錯誤")


def regen_skeletons() -> None:
    """從 solution_optimal.* 重新生成所有 solution.* 骨架（覆寫現有版本）。"""
    problem_folders: list[Path] = []
    for cat_dir in sorted(PROBLEMS_DIR.iterdir()):
        if not cat_dir.is_dir():
            continue
        for prob_dir in sorted(cat_dir.iterdir()):
            if prob_dir.is_dir():
                problem_folders.append(prob_dir)

    print(f"找到 {len(problem_folders)} 個題目資料夾，重新生成骨架...\n")
    total = {"blanked": 0, "errors": 0, "skipped": 0}
    error_list: list[str] = []

    for folder in problem_folders:
        for src_name, make_skeleton in SKELETON_MAKERS.items():
            ext = Path(src_name).suffix
            opt_path = folder / ("solution_optimal" + ext)
            if not opt_path.exists():
                total["skipped"] += 1
                continue
            source = opt_path.read_text(encoding="utf-8")
            try:
                skeleton = make_skeleton(source)
                (folder / src_name).write_text(skeleton, encoding="utf-8")
                total["blanked"] += 1
            except Exception as e:
                msg = f"  ERROR {folder.name}/{src_name}: {e}"
                print(msg)
                error_list.append(msg)
                total["errors"] += 1

    print(f"\n重新生成完成！")
    print(f"  修改骨架：{total['blanked']} 個")
    print(f"  跳過（無 optimal 檔案）：{total['skipped']} 個")
    if error_list:
        print(f"  錯誤 {total['errors']} 個：")
        for msg in error_list:
            print(msg)
    else:
        print("✓ 全部成功，無錯誤")


if __name__ == "__main__":
    if "--regen" in sys.argv:
        regen_skeletons()
    else:
        main()
