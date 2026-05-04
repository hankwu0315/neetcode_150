"""
Problem: 1143. Longest Common Subsequence
"""


class Solution:
    def longestCommonSubsequence(self, text1: str, text2: str) -> int:
        m, n = len(text1), len(text2)
        prev = [0] * (n + 1)
        for i in range(1, m + 1):
            cur = [0] * (n + 1)
            for j in range(1, n + 1):
                if text1[i - 1] == text2[j - 1]:
                    cur[j] = prev[j - 1] + 1
                else:
                    cur[j] = max(prev[j], cur[j - 1])
            prev = cur
        return prev[n]


if __name__ == "__main__":
    sol = Solution()
    assert sol.longestCommonSubsequence("abcde", "ace") == 3
    assert sol.longestCommonSubsequence("abc", "abc") == 3
    assert sol.longestCommonSubsequence("abc", "def") == 0
    assert sol.longestCommonSubsequence("", "abc") == 0
    assert sol.longestCommonSubsequence("bsbininm", "jmjkbkjkv") == 1
    assert sol.longestCommonSubsequence("ezupkr", "ubmrapg") == 2
    print("All tests passed!")
