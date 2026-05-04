"""
Problem: 0704. Binary Search
Difficulty: Easy
URL: https://leetcode.com/problems/binary-search/

解法演進：
1) 迭代二分（閉區間）：l=0, r=n-1；mid 比較。
2) 遞迴二分：相同語意。

最佳解核心思路：
- 每輪以 mid 將搜尋區間減半。

複雜度：O(log n) / O(1)。
"""


class Solution:
    def search(self, nums: list[int], target: int) -> int:
        l, r = 0, len(nums) - 1
        while l <= r:
            mid = l + (r - l) // 2
            if nums[mid] == target:
                return mid
            if nums[mid] < target:
                l = mid + 1
            else:
                r = mid - 1
        return -1

    def search_brute(self, nums: list[int], target: int) -> int:
        # 線性搜尋對照
        for i, v in enumerate(nums):
            if v == target:
                return i
        return -1


if __name__ == "__main__":
    sol = Solution()
    for fn in (sol.search, sol.search_brute):
        assert fn([-1, 0, 3, 5, 9, 12], 9) == 4
        assert fn([-1, 0, 3, 5, 9, 12], 2) == -1
        assert fn([5], 5) == 0
        assert fn([5], 3) == -1
        assert fn([1, 2, 3, 4, 5], 1) == 0
        assert fn([1, 2, 3, 4, 5], 5) == 4
    print("All tests passed!")
