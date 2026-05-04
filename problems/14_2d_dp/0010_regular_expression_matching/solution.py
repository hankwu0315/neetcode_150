"""
Problem: 0010. Regular Expression Matching
"""


class Solution:
    def isMatch(self, s: str, p: str) -> bool:
        m, n = len(s), len(p)
        dp = [[False] * (n + 1) for _ in range(m + 1)]
        dp[0][0] = True
        for j in range(1, n + 1):
            if p[j - 1] == '*':
                dp[0][j] = dp[0][j - 2]
        for i in range(1, m + 1):
            for j in range(1, n + 1):
                if p[j - 1] == '*':
                    dp[i][j] = dp[i][j - 2]
                    if p[j - 2] == '.' or p[j - 2] == s[i - 1]:
                        dp[i][j] = dp[i][j] or dp[i - 1][j]
                elif p[j - 1] == '.' or p[j - 1] == s[i - 1]:
                    dp[i][j] = dp[i - 1][j - 1]
        return dp[m][n]


if __name__ == "__main__":
    sol = Solution()
    assert sol.isMatch("aa", "a") is False
    assert sol.isMatch("aa", "a*") is True
    assert sol.isMatch("ab", ".*") is True
    assert sol.isMatch("aab", "c*a*b") is True
    assert sol.isMatch("mississippi", "mis*is*p*.") is False
    assert sol.isMatch("", "") is True
    assert sol.isMatch("", ".*") is True
    assert sol.isMatch("a", "ab*") is True
    print("All tests passed!")
