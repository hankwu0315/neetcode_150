"""
Problem: 0211. Design Add and Search Words Data Structure
Difficulty: Medium
URL: https://leetcode.com/problems/design-add-and-search-words-data-structure/

解法：Trie + 帶 '.' 的 DFS。
"""

from __future__ import annotations

from typing import Dict

class _Node:
    __slots__ = ("ch", "end")
    def __init__(self):
        pass


class WordDictionary:
    def __init__(self):
        pass

    def addWord(self, word: str) -> None:
        pass

    def search(self, word: str) -> bool:
        pass


if __name__ == "__main__":
    wordDictionary = WordDictionary()

    # Test 1
    # result = wordDictionary.solve(...)
    # assert result == expected

    print("All tests passed!")
