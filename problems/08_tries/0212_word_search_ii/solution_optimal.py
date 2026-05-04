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
        self.ch: Dict[str, _Node] = {}
        self.word: Optional[str] = None


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
        if not board or not board[0]: return []
        root = _build(words)
        m, n = len(board), len(board[0])
        out: List[str] = []

        def dfs(r: int, c: int, node: _Node) -> None:
            ch = board[r][c]
            nxt = node.ch.get(ch)
            if nxt is None: return
            if nxt.word is not None:
                out.append(nxt.word)
                nxt.word = None
            board[r][c] = '#'
            for dr, dc in ((-1, 0), (1, 0), (0, -1), (0, 1)):
                nr, nc = r + dr, c + dc
                if 0 <= nr < m and 0 <= nc < n and board[nr][nc] != '#':
                    dfs(nr, nc, nxt)
            board[r][c] = ch
            if not nxt.ch:
                node.ch.pop(ch, None)

        for r in range(m):
            for c in range(n):
                dfs(r, c, root)
        return out


if __name__ == "__main__":
    sol = Solution()
    board = [list("oaan"), list("etae"), list("ihkr"), list("iflv")]
    assert sorted(sol.findWords([row[:] for row in board], ["oath", "pea", "eat", "rain"])) == ["eat", "oath"]
    assert sol.findWords([["a", "b"], ["c", "d"]], ["abcb"]) == []
    out2 = sol.findWords([["a"]], ["a"])
    assert out2 == ["a"]
    out3 = sorted(sol.findWords([list("abc"), list("aed"), list("afg")], ["abcdefg", "gfedcbaaa", "eaabcdgfa", "befa", "dgc", "xyz"]))
    assert "abcdefg" in out3 and "befa" in out3
    assert sol.findWords([["a", "a"]], ["aaa"]) == []
    print("All tests passed!")
