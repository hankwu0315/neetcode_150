"""
Problem: 36. Valid Sudoku
Difficulty: Medium
URL: https://leetcode.com/problems/valid-sudoku/

【解法演進】三趟分別檢查 → 一遍走訪 + 三組集合（最佳）
【最佳解核心思路】
    維護 rows[9]、cols[9]、boxes[9] 三組集合，遍歷每格時同時更新與檢查。
    子方格索引 b = (i // 3) * 3 + (j // 3)。
【複雜度】時間：O(1)（81 格固定）  空間：O(1)
"""
from typing import List


class Solution:
    # 最佳解：一遍走訪
    def isValidSudoku(self, board: List[List[str]]) -> bool:
        rows = [set() for _ in range(9)]
        cols = [set() for _ in range(9)]
        boxes = [set() for _ in range(9)]
        for i in range(9):
            for j in range(9):
                c = board[i][j]
                if c == ".":
                    continue
                b = (i // 3) * 3 + (j // 3)
                if c in rows[i] or c in cols[j] or c in boxes[b]:
                    return False
                rows[i].add(c)
                cols[j].add(c)
                boxes[b].add(c)
        return True

    # 暴力解：三趟
    def isValidSudoku_brute(self, board: List[List[str]]) -> bool:
        # 列
        for r in range(9):
            seen = set()
            for c in range(9):
                v = board[r][c]
                if v == ".":
                    continue
                if v in seen:
                    return False
                seen.add(v)
        # 行
        for c in range(9):
            seen = set()
            for r in range(9):
                v = board[r][c]
                if v == ".":
                    continue
                if v in seen:
                    return False
                seen.add(v)
        # 子方格
        for br in range(3):
            for bc in range(3):
                seen = set()
                for r in range(br * 3, br * 3 + 3):
                    for c in range(bc * 3, bc * 3 + 3):
                        v = board[r][c]
                        if v == ".":
                            continue
                        if v in seen:
                            return False
                        seen.add(v)
        return True


if __name__ == "__main__":
    s = Solution()

    valid = [
        ["5", "3", ".", ".", "7", ".", ".", ".", "."],
        ["6", ".", ".", "1", "9", "5", ".", ".", "."],
        [".", "9", "8", ".", ".", ".", ".", "6", "."],
        ["8", ".", ".", ".", "6", ".", ".", ".", "3"],
        ["4", ".", ".", "8", ".", "3", ".", ".", "1"],
        ["7", ".", ".", ".", "2", ".", ".", ".", "6"],
        [".", "6", ".", ".", ".", ".", "2", "8", "."],
        [".", ".", ".", "4", "1", "9", ".", ".", "5"],
        [".", ".", ".", ".", "8", ".", ".", "7", "9"],
    ]
    invalid = [row[:] for row in valid]
    invalid[0][0] = "8"  # 與 [3][0]='8' 同行衝突

    empty = [["." for _ in range(9)] for _ in range(9)]

    assert s.isValidSudoku(valid) is True, "Test 1 failed"
    assert s.isValidSudoku(invalid) is False, "Test 2 failed (column conflict)"
    assert s.isValidSudoku(empty) is True, "Test 3 failed (empty)"

    # 子方格衝突
    box_conflict = [row[:] for row in empty]
    box_conflict[0][0] = "5"
    box_conflict[1][1] = "5"
    assert s.isValidSudoku(box_conflict) is False, "Test 4 failed (box conflict)"

    # 列衝突
    row_conflict = [row[:] for row in empty]
    row_conflict[0][0] = "5"
    row_conflict[0][8] = "5"
    assert s.isValidSudoku(row_conflict) is False, "Test 5 failed (row conflict)"

    assert s.isValidSudoku_brute(valid) is True
    assert s.isValidSudoku_brute(invalid) is False

    print("All tests passed!")
