"""
Problem: 0739. Daily Temperatures
Difficulty: Medium
URL: https://leetcode.com/problems/daily-temperatures/

解法演進：
1) 暴力 O(n^2)：對每個 i 往後找。
2) 單調遞減堆疊 O(n)：堆疊存索引，遇到較高溫度即彈出並計算距離。

最佳解核心思路：
- 維持堆疊上的溫度單調遞減；遇到較高溫度時，所有低於它的都能在此 i 結算答案。

複雜度：O(n) / O(n)。
"""


class Solution:
    # 最佳解：單調堆疊
    def dailyTemperatures(self, temperatures: list[int]) -> list[int]:
        n = len(temperatures)
        ans = [0] * n
        stack: list[int] = []  # 索引；對應溫度單調遞減
        for i, t in enumerate(temperatures):
            while stack and temperatures[stack[-1]] < t:
                j = stack.pop()
                ans[j] = i - j
            stack.append(i)
        return ans

    # 暴力：O(n^2)
    def dailyTemperatures_brute(self, temperatures: list[int]) -> list[int]:
        n = len(temperatures)
        ans = [0] * n
        for i in range(n):
            for j in range(i + 1, n):
                if temperatures[j] > temperatures[i]:
                    ans[i] = j - i
                    break
        return ans


if __name__ == "__main__":
    sol = Solution()
    for fn in (sol.dailyTemperatures, sol.dailyTemperatures_brute):
        assert fn([73, 74, 75, 71, 69, 72, 76, 73]) == [1, 1, 4, 2, 1, 1, 0, 0]
        assert fn([30, 40, 50, 60]) == [1, 1, 1, 0]
        assert fn([30, 60, 90]) == [1, 1, 0]
        assert fn([90, 80, 70]) == [0, 0, 0]
        assert fn([50]) == [0]
        # 重複值
        assert fn([55, 55, 55, 60]) == [3, 2, 1, 0]
    print("All tests passed!")
