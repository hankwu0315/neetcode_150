"""
Problem: 0097. Interleaving String
"""


class Solution:
    def isInterleave(self, s1: str, s2: str, s3: str) -> bool:
        m, n = len(s1), len(s2)
        if m + n != len(s3):
            return False
        dp = [False] * (n + 1)
        dp[0] = True
        for j in range(1, n + 1):
            dp[j] = dp[j - 1] and s2[j - 1] == s3[j - 1]
        for i in range(1, m + 1):
            dp[0] = dp[0] and s1[i - 1] == s3[i - 1]
            for j in range(1, n + 1):
                dp[j] = (dp[j] and s1[i - 1] == s3[i + j - 1]) or \
                        (dp[j - 1] and s2[j - 1] == s3[i + j - 1])
        return dp[n]


if __name__ == "__main__":
    sol = Solution()
    assert sol.isInterleave("aabcc", "dbbca", "aadbbcbcac") is True
    assert sol.isInterleave("aabcc", "dbbca", "aadbbbaccc") is False
    assert sol.isInterleave("", "", "") is True
    assert sol.isInterleave("", "abc", "abc") is True
    assert sol.isInterleave("a", "", "a") is True
    assert sol.isInterleave("a", "b", "ab") is True
    assert sol.isInterleave("a", "b", "ba") is True
    print("All tests passed!")
