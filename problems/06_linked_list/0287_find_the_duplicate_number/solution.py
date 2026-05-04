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
        pass

    def findDuplicate_brute(self, nums: list[int]) -> int:
        pass


if __name__ == "__main__":
    solution = Solution()

    # Test 1
    # result = solution.solve(...)
    # assert result == expected

    print("All tests passed!")
