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
        l, r = 0, len(nums) - 1
        while l < r:
            mid = l + (r - l) // 2
            if nums[mid] > nums[r]:
                l = mid + 1
            else:
                r = mid
        return nums[l]

    def findMin_brute(self, nums: list[int]) -> int:
        return min(nums)


if __name__ == "__main__":
    sol = Solution()
    for fn in (sol.findMin, sol.findMin_brute):
        assert fn([3, 4, 5, 1, 2]) == 1
        assert fn([4, 5, 6, 7, 0, 1, 2]) == 0
        assert fn([11, 13, 15, 17]) == 11  # 未旋轉
        assert fn([2, 1]) == 1
        assert fn([1]) == 1
        assert fn([1, 2]) == 1
        # 旋轉到剩 1 個在右
        assert fn([2, 3, 4, 5, 1]) == 1
    print("All tests passed!")
