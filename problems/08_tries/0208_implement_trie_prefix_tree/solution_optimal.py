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
        self.ch: Dict[str, _Node] = {}
        self.end: bool = False


class Trie:
    def __init__(self):
        self.root = _Node()

    def insert(self, word: str) -> None:
        n = self.root
        for c in word:
            if c not in n.ch:
                n.ch[c] = _Node()
            n = n.ch[c]
        n.end = True

    def _walk(self, s: str) -> Optional[_Node]:
        n = self.root
        for c in s:
            if c not in n.ch:
                return None
            n = n.ch[c]
        return n

    def search(self, word: str) -> bool:
        n = self._walk(word)
        return n is not None and n.end

    def startsWith(self, prefix: str) -> bool:
        return self._walk(prefix) is not None


if __name__ == "__main__":
    t = Trie()
    t.insert("apple")
    assert t.search("apple") is True
    assert t.search("app") is False
    assert t.startsWith("app") is True
    t.insert("app")
    assert t.search("app") is True
    assert t.startsWith("appl") is True
    assert t.search("appl") is False
    assert t.startsWith("b") is False
    print("All tests passed!")
