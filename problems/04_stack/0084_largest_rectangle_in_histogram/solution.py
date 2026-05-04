"""
Problem: 0084. Largest Rectangle in Histogram
Difficulty: Hard
URL: https://leetcode.com/problems/largest-rectangle-in-histogram/

解法演進：
1) 暴力 O(n^2)：對每個 i 向左右擴展。
2) 單調遞增堆疊 O(n)：遇到較矮高度時，彈出並用該高度計算可形成矩形。

最佳解核心思路：
- 堆疊維持索引，其高度單調遞增；遇到較矮即「結算」彈出索引能形成的最大矩形。

複雜度：O(n) / O(n)。
"""

class Solution:
    # 最佳解：單調堆疊（用 sentinel 統一處理）
    def largestRectangleArea(self, heights: list[int]) -> int:
        pass

    def largestRectangleArea_brute(self, heights: list[int]) -> int:
        pass


if __name__ == "__main__":
    solution = Solution()

    # Test 1
    # result = solution.solve(...)
    # assert result == expected

    print("All tests passed!")
