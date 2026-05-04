"""
Problem: 0115. Distinct Subsequences
"""


class Solution:
    def numDistinct(self, s: str, t: str) -> int:
        m, n = len(s), len(t)
        if n > m:
            return 0
        dp = [0] * (n + 1)
        dp[0] = 1
        for i in range(1, m + 1):
            for j in range(min(i, n), 0, -1):
                if s[i - 1] == t[j - 1]:
                    dp[j] += dp[j - 1]
        return dp[n]


if __name__ == "__main__":
    sol = Solution()
    assert sol.numDistinct("rabbbit", "rabbit") == 3
    assert sol.numDistinct("babgbag", "bag") == 5
    assert sol.numDistinct("", "") == 1
    assert sol.numDistinct("a", "a") == 1
    assert sol.numDistinct("a", "b") == 0
    assert sol.numDistinct("aaa", "a") == 3
    print("All tests passed!")
