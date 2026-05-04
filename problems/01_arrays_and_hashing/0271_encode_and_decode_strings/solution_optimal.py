"""
Problem: 271. Encode and Decode Strings (Premium)
Difficulty: Medium
URL: https://leetcode.com/problems/encode-and-decode-strings/

【解法演進】脆弱分隔符（壞）→ 長度前綴 + '#' 分隔（最佳）
【最佳解核心思路】
    encode: 對每個 s 輸出 f"{len(s)}#{s}"。
    decode: 解析至 '#'，取 length 後切 length 個字元，跳過繼續。
【複雜度】時間：O(N)  空間：O(N)
"""
from typing import List


class Codec:
    def encode(self, strs: List[str]) -> str:
        return "".join(f"{len(s)}#{s}" for s in strs)

    def decode(self, s: str) -> List[str]:
        result: List[str] = []
        i = 0
        while i < len(s):
            j = s.index("#", i)
            length = int(s[i:j])
            result.append(s[j + 1 : j + 1 + length])
            i = j + 1 + length
        return result


# 暴力解（脆弱）：示範錯誤示範，僅供對比
class CodecNaive:
    SEP = "\x00"

    def encode(self, strs: List[str]) -> str:
        return self.SEP.join(strs)

    def decode(self, s: str) -> List[str]:
        return s.split(self.SEP) if s else []


if __name__ == "__main__":
    codec = Codec()

    cases = [
        ["lint", "code", "love", "you"],
        ["we", "say", ":", "yes"],
        [""],                               # 單個空字串
        [],                                 # 空陣列
        ["", ""],                           # 多個空字串
        ["#", "1#", "abc#def", "##"],       # 字串內含 '#'
        ["a" * 100, "b" * 50],              # 較長字串
    ]
    for i, c in enumerate(cases, 1):
        encoded = codec.encode(c)
        decoded = codec.decode(encoded)
        assert decoded == c, f"Test {i} failed: {decoded} != {c}"

    # 驗證脆弱解：當字串含 '\x00' 時失敗
    naive = CodecNaive()
    bad = ["a\x00b"]
    assert naive.decode(naive.encode(bad)) != bad, "Naive should fail on null char"

    print("All tests passed!")
