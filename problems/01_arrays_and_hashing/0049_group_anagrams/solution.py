"""
Problem: 49. Group Anagrams
Difficulty: Medium
URL: https://leetcode.com/problems/group-anagrams/

【解法演進】排序當 key O(n·k log k) → 26 元組計數當 key O(n·k)（最佳）
【最佳解核心思路】
    對每個字串建立長度 26 的計數陣列，將 tuple(count) 作為 dict key 分組。
【複雜度】時間：O(n · k)  空間：O(n · k)
"""

from collections import defaultdict

from typing import List

class Solution:
    # 最佳解：計數元組作 key
    def groupAnagrams(self, strs: List[str]) -> List[List[str]]:
        pass

    def groupAnagrams_brute(self, strs: List[str]) -> List[List[str]]:
        pass


def _norm(groups: List[List[str]]) -> List[List[str]]:
    """將群組順序標準化以便比對。"""
    return sorted([sorted(g) for g in groups])

if __name__ == "__main__":
    solution = Solution()

    # Test 1
    # result = solution.solve(...)
    # assert result == expected

    print("All tests passed!")
