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
        pass

    def decode(self, s: str) -> List[str]:
        pass


class CodecNaive:
    SEP = "\x00"
    def encode(self, strs: List[str]) -> str:
        pass

    def decode(self, s: str) -> List[str]:
        pass


if __name__ == "__main__":
    codec = Codec()

    # Test 1
    # result = codec.solve(...)
    # assert result == expected

    print("All tests passed!")
