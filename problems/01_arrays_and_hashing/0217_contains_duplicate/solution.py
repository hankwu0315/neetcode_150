"""
Problem: 217. Contains Duplicate
Difficulty: Easy
URL: https://leetcode.com/problems/contains-duplicate/

【解法演進】暴力 O(n²) → 排序 O(n log n) → 雜湊集合 O(n)（最佳）
【最佳解核心思路】
    維護一個集合 seen，走訪陣列時若 x 已在 seen 內代表重複，直接回傳 True；
    否則加入 seen 繼續。集合查詢均攤 O(1)。
【複雜度】時間：O(n)  空間：O(n)
"""

from typing import List

class Solution:
    # 最佳解：HashSet
    def containsDuplicate(self, nums: List[int]) -> bool:
        pass

    def containsDuplicate_brute(self, nums: List[int]) -> bool:
        pass

    def containsDuplicate_sort(self, nums: List[int]) -> bool:
        pass


if __name__ == "__main__":
    solution = Solution()

    # Test 1
    # result = solution.solve(...)
    # assert result == expected

    print("All tests passed!")
