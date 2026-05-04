"""
Problem: 0208. Implement Trie (Prefix Tree)
Difficulty: Medium
URL: https://leetcode.com/problems/implement-trie-prefix-tree/

解法：dict 子節點 + end flag，O(m) 每操作。
"""

from __future__ import annotations

from typing import Dict, Optional

class _Node:
    __slots__ = ("ch", "end")
    def __init__(self):
        pass


class Trie:
    def __init__(self):
        pass

    def insert(self, word: str) -> None:
        pass

    def _walk(self, s: str) -> Optional[_Node]:
        pass

    def search(self, word: str) -> bool:
        pass

    def startsWith(self, prefix: str) -> bool:
        pass


if __name__ == "__main__":
    trie = Trie()

    # Test 1
    # result = trie.solve(...)
    # assert result == expected

    print("All tests passed!")
