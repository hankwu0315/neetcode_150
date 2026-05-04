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
        if not t or len(s) < len(t):
            return ""
        need = Counter(t)
        required = len(need)
        window: dict = defaultdict(int)
        have = 0
        l = 0
        bestLen = float("inf")
        bestL = bestR = 0
        for r, c in enumerate(s):
            window[c] += 1
            if c in need and window[c] == need[c]:
                have += 1
            while have == required:
                if r - l + 1 < bestLen:
                    bestLen = r - l + 1
                    bestL, bestR = l, r
                window[s[l]] -= 1
                if s[l] in need and window[s[l]] < need[s[l]]:
                    have -= 1
                l += 1
        return "" if bestLen == float("inf") else s[bestL : bestR + 1]


if __name__ == "__main__":
    s = Solution()

    assert s.minWindow("ADOBECODEBANC", "ABC") == "BANC", "Test 1 failed"
    assert s.minWindow("a", "a") == "a", "Test 2 failed"
    assert s.minWindow("a", "aa") == "", "Test 3 failed (insufficient)"
    assert s.minWindow("aa", "aa") == "aa", "Test 4 failed"
    assert s.minWindow("ab", "b") == "b", "Test 5 failed"
    assert s.minWindow("", "a") == "", "Test 6 failed (empty s)"
    assert s.minWindow("aaflslflsldkalskaaa", "aaa") == "aaa", "Test 7 failed"

    print("All tests passed!")
