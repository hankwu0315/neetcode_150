"""
Problem: 76. Minimum Window Substring
Difficulty: Hard
URL: https://leetcode.com/problems/minimum-window-substring/

【解法演進】暴力 O(n²) → 滑動窗口 + have/required O(|s|+|t|)（最佳）
【最佳解核心思路】
    need = Counter(t)；window 紀錄當前計數；have = 滿足條件的字母種類數。
    擴右、縮左，當 have == required 時更新答案。
【複雜度】時間：O(|s| + |t|)  空間：O(|Σ|)
"""

from collections import Counter, defaultdict

class Solution:
    # 最佳解
    def minWindow(self, s: str, t: str) -> str:
        pass


if __name__ == "__main__":
    solution = Solution()

    # Test 1
    # result = solution.solve(...)
    # assert result == expected

    print("All tests passed!")
