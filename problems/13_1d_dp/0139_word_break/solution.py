"""
Problem: 0139. Word Break
"""
from typing import List


class Solution:
    def wordBreak(self, s: str, wordDict: List[str]) -> bool:
        words = set(wordDict)
        max_w = max((len(w) for w in words), default=0)
        n = len(s)
        dp = [False] * (n + 1)
        dp[0] = True
        for i in range(1, n + 1):
            for j in range(max(0, i - max_w), i):
                if dp[j] and s[j:i] in words:
                    dp[i] = True
                    break
        return dp[n]


if __name__ == "__main__":
    sol = Solution()
    assert sol.wordBreak("leetcode", ["leet", "code"]) is True
    assert sol.wordBreak("applepenapple", ["apple", "pen"]) is True
    assert sol.wordBreak("catsandog", ["cats", "dog", "sand", "and", "cat"]) is False
    assert sol.wordBreak("a", ["a"]) is True
    assert sol.wordBreak("ab", ["a"]) is False
    assert sol.wordBreak("aaaaaaa", ["aaaa", "aaa"]) is True
    print("All tests passed!")
