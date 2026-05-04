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
        l, r = 0, len(nums) - 1
        while l <= r:
            mid = l + (r - l) // 2
            if nums[mid] == target:
                return mid
            if nums[l] <= nums[mid]:  # 左半已排序
                if nums[l] <= target < nums[mid]:
                    r = mid - 1
                else:
                    l = mid + 1
            else:  # 右半已排序
                if nums[mid] < target <= nums[r]:
                    l = mid + 1
                else:
                    r = mid - 1
        return -1

    def search_brute(self, nums: list[int], target: int) -> int:
        for i, v in enumerate(nums):
            if v == target:
                return i
        return -1


if __name__ == "__main__":
    sol = Solution()
    for fn in (sol.search, sol.search_brute):
        assert fn([4, 5, 6, 7, 0, 1, 2], 0) == 4
        assert fn([4, 5, 6, 7, 0, 1, 2], 3) == -1
        assert fn([1], 0) == -1
        assert fn([1], 1) == 0
        # 未旋轉
        assert fn([1, 2, 3, 4, 5], 3) == 2
        # 命中端點
        assert fn([4, 5, 6, 7, 0, 1, 2], 4) == 0
        assert fn([4, 5, 6, 7, 0, 1, 2], 2) == 6
        # 兩元素
        assert fn([3, 1], 1) == 1
        assert fn([3, 1], 3) == 0
    print("All tests passed!")
