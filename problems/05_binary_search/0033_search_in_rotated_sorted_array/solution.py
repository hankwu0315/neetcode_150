"""
Problem: 0033. Search in Rotated Sorted Array
Difficulty: Medium
URL: https://leetcode.com/problems/search-in-rotated-sorted-array/

解法演進：
1) 暴力線性 O(n)。
2) 一次二分 O(log n)：以 mid 判斷哪半排序，看 target 是否在排序半的範圍。

最佳解核心思路：
- 至少一半是排序的；若 target 在排序那半的範圍 -> 縮入；否則去另一半。

複雜度：O(log n) / O(1)。
"""

class Solution:
    def search(self, nums: list[int], target: int) -> int:
        pass

    def search_brute(self, nums: list[int], target: int) -> int:
        pass


if __name__ == "__main__":
    solution = Solution()

    # Test 1
    # result = solution.solve(...)
    # assert result == expected

    print("All tests passed!")
