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
        self.ch: Dict[str, _Node] = {}
        self.end: bool = False


class WordDictionary:
    def __init__(self):
        self.root = _Node()

    def addWord(self, word: str) -> None:
        n = self.root
        for c in word:
            n = n.ch.setdefault(c, _Node())
        n.end = True

    def search(self, word: str) -> bool:
        def dfs(i: int, n: _Node) -> bool:
            if i == len(word):
                return n.end
            c = word[i]
            if c == '.':
                for nxt in n.ch.values():
                    if dfs(i + 1, nxt):
                        return True
                return False
            nxt = n.ch.get(c)
            return False if nxt is None else dfs(i + 1, nxt)
        return dfs(0, self.root)


if __name__ == "__main__":
    w = WordDictionary()
    w.addWord("bad"); w.addWord("dad"); w.addWord("mad")
    assert w.search("pad") is False
    assert w.search("bad") is True
    assert w.search(".ad") is True
    assert w.search("b..") is True
    assert w.search("b...") is False
    w.addWord("a")
    assert w.search("a") is True
    assert w.search(".") is True
    assert w.search("aa") is False
    print("All tests passed!")
