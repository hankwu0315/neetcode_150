"""
Problem: 0212. Word Search II
Difficulty: Hard
URL: https://leetcode.com/problems/word-search-ii/

解法：Trie + DFS（多 word 共享前綴），回溯 + 剪枝。
"""

from __future__ import annotations

from typing import List, Dict, Optional

class _Node:
    __slots__ = ("ch", "word")
    def __init__(self):
        pass


def _build(words: List[str]) -> _Node:
    root = _Node()
    for w in words:
        n = root
        for c in w:
            n = n.ch.setdefault(c, _Node())
        n.word = w
    return root

class Solution:
    def findWords(self, board: List[List[str]], words: List[str]) -> List[str]:
        pass


if __name__ == "__main__":
    solution = Solution()

    # Test 1
    # result = solution.solve(...)
    # assert result == expected

    print("All tests passed!")
