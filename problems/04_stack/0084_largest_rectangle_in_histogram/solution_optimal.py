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
        stack: list[int] = []  # 索引；對應高度單調遞增
        best = 0
        n = len(heights)
        for i in range(n + 1):
            cur = 0 if i == n else heights[i]
            while stack and heights[stack[-1]] > cur:
                top = stack.pop()
                h = heights[top]
                w = i if not stack else i - stack[-1] - 1
                if h * w > best:
                    best = h * w
            stack.append(i)
        return best

    # 暴力 O(n^2)
    def largestRectangleArea_brute(self, heights: list[int]) -> int:
        n = len(heights)
        best = 0
        for i in range(n):
            h = heights[i]
            l = i
            while l > 0 and heights[l - 1] >= h:
                l -= 1
            r = i
            while r < n - 1 and heights[r + 1] >= h:
                r += 1
            best = max(best, h * (r - l + 1))
        return best


if __name__ == "__main__":
    sol = Solution()
    for fn in (sol.largestRectangleArea, sol.largestRectangleArea_brute):
        assert fn([2, 1, 5, 6, 2, 3]) == 10
        assert fn([2, 4]) == 4
        assert fn([1]) == 1
        assert fn([2, 1, 2]) == 3
        # 全相同
        assert fn([3, 3, 3, 3]) == 12
        # 嚴格遞增
        assert fn([1, 2, 3, 4, 5]) == 9  # 寬 3，高 3 -> 9
        # 嚴格遞減
        assert fn([5, 4, 3, 2, 1]) == 9
        # 含 0
        assert fn([0, 9]) == 9
        assert fn([2, 0, 2]) == 2
    print("All tests passed!")
