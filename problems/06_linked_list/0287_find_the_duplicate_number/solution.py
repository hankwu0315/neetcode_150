"""
Problem: 0287. Find the Duplicate Number
Difficulty: Medium
URL: https://leetcode.com/problems/find-the-duplicate-number/

解法演進：
1) HashSet O(n)/O(n)。
2) Floyd 找環起點 O(n)/O(1)（最佳）。

最佳解核心思路：
- i -> nums[i] 構成函式圖，n+1 個值映到 [1,n] 必有環，入口即重複值。
"""


class Solution:
    def findDuplicate(self, nums: list[int]) -> int:
        slow = fast = 0
        while True:
            slow = nums[slow]
            fast = nums[nums[fast]]
            if slow == fast:
                break
        slow = 0
        while slow != fast:
            slow = nums[slow]
            fast = nums[fast]
        return slow

    def findDuplicate_brute(self, nums: list[int]) -> int:
        seen = set()
        for v in nums:
            if v in seen:
                return v
            seen.add(v)
        return -1


if __name__ == "__main__":
    sol = Solution()
    for fn in (sol.findDuplicate, sol.findDuplicate_brute):
        assert fn([1, 3, 4, 2, 2]) == 2
        assert fn([3, 1, 3, 4, 2]) == 3
        assert fn([1, 1]) == 1
        assert fn([2, 2, 2, 2, 2]) == 2
        assert fn([1, 4, 4, 2, 4]) == 4
    print("All tests passed!")
