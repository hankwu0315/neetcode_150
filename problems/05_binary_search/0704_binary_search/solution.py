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
        pass

    def search_brute(self, nums: list[int], target: int) -> int:
        # 線性搜尋對照
        pass


if __name__ == "__main__":
    solution = Solution()

    # Test 1
    # result = solution.solve(...)
    # assert result == expected

    print("All tests passed!")
