"""
Problem: 0127. Word Ladder
Difficulty: Hard
URL: https://leetcode.com/problems/word-ladder/

解法：BFS + 模式桶。
"""
from __future__ import annotations
from typing import List
from collections import deque, defaultdict


class Solution:
    def ladderLength(self, beginWord: str, endWord: str, wordList: List[str]) -> int:
        ws = set(wordList)
        if endWord not in ws:
            return 0
        L = len(beginWord)
        buckets: dict = defaultdict(list)
        for w in ws | {beginWord}:
            for i in range(L):
                buckets[w[:i] + '*' + w[i + 1:]].append(w)
        visited = {beginWord}
        q = deque([(beginWord, 1)])
        while q:
            word, d = q.popleft()
            for i in range(L):
                key = word[:i] + '*' + word[i + 1:]
                for nb in buckets[key]:
                    if nb == endWord:
                        return d + 1
                    if nb not in visited:
                        visited.add(nb)
                        q.append((nb, d + 1))
                buckets[key] = []
        return 0


if __name__ == "__main__":
    sol = Solution()
    assert sol.ladderLength("hit", "cog", ["hot", "dot", "dog", "lot", "log", "cog"]) == 5
    assert sol.ladderLength("hit", "cog", ["hot", "dot", "dog", "lot", "log"]) == 0
    assert sol.ladderLength("a", "c", ["a", "b", "c"]) == 2
    assert sol.ladderLength("hot", "dog", ["hot", "dog"]) == 0
    assert sol.ladderLength("hot", "dog", ["hot", "dog", "dot"]) == 3
    assert sol.ladderLength("leet", "code", ["lest", "leet", "lose", "code", "lode", "robe", "lost"]) == 6
    print("All tests passed!")
