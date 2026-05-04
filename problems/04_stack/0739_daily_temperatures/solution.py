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
        pass

    def dailyTemperatures_brute(self, temperatures: list[int]) -> list[int]:
        pass


if __name__ == "__main__":
    solution = Solution()

    # Test 1
    # result = solution.solve(...)
    # assert result == expected

    print("All tests passed!")
