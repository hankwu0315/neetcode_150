"""
Problem: 0072. Edit Distance
"""


class Solution:
    def minDistance(self, word1: str, word2: str) -> int:
        m, n = len(word1), len(word2)
        prev = list(range(n + 1))
        for i in range(1, m + 1):
            cur = [i] + [0] * n
            for j in range(1, n + 1):
                if word1[i - 1] == word2[j - 1]:
                    cur[j] = prev[j - 1]
                else:
                    cur[j] = 1 + min(prev[j - 1], prev[j], cur[j - 1])
            prev = cur
        return prev[n]


if __name__ == "__main__":
    sol = Solution()
    assert sol.minDistance("horse", "ros") == 3
    assert sol.minDistance("intention", "execution") == 5
    assert sol.minDistance("", "") == 0
    assert sol.minDistance("a", "") == 1
    assert sol.minDistance("", "abc") == 3
    assert sol.minDistance("abc", "abc") == 0
    print("All tests passed!")
