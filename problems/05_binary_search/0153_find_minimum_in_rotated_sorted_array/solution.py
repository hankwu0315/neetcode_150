"""
Problem: 0153. Find Minimum in Rotated Sorted Array
Difficulty: Medium
URL: https://leetcode.com/problems/find-minimum-in-rotated-sorted-array/

解法演進：
1) 暴力 min(nums) O(n)。
2) 二分 O(log n)：與 nums[r] 比較決定半區。

最佳解核心思路：
- nums[mid] > nums[r] -> 最小在右半；否則在左半（含 mid）。

複雜度：O(log n) / O(1)。
"""

class Solution:
    def findMin(self, nums: list[int]) -> int:
        pass

    def findMin_brute(self, nums: list[int]) -> int:
        pass


if __name__ == "__main__":
    solution = Solution()

    # Test 1
    # result = solution.solve(...)
    # assert result == expected

    print("All tests passed!")
