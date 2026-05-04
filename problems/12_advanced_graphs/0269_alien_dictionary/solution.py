"""
Problem: 0269. Alien Dictionary
Difficulty: Hard
URL: https://leetcode.com/problems/alien-dictionary/

解法：建圖 + 拓撲排序。
"""
from __future__ import annotations
from typing import List, Dict, Set
from collections import deque


class Solution:
    def alienOrder(self, words: List[str]) -> str:
        graph: Dict[str, Set[str]] = {c: set() for w in words for c in w}
        indeg: Dict[str, int] = {c: 0 for c in graph}
        for i in range(len(words) - 1):
            a, b = words[i], words[i + 1]
            ml = min(len(a), len(b))
            if len(a) > len(b) and a[:ml] == b[:ml]:
                return ""
            for j in range(ml):
                if a[j] != b[j]:
                    if b[j] not in graph[a[j]]:
                        graph[a[j]].add(b[j])
                        indeg[b[j]] += 1
                    break
        q = deque(c for c in indeg if indeg[c] == 0)
        out: List[str] = []
        while q:
            c = q.popleft()
            out.append(c)
            for nb in graph[c]:
                indeg[nb] -= 1
                if indeg[nb] == 0:
                    q.append(nb)
        if len(out) != len(indeg):
            return ""
        return "".join(out)


def _is_valid(order: str, words: List[str]) -> bool:
    seen = set("".join(words))
    if set(order) != seen:
        return False
    pos = {c: i for i, c in enumerate(order)}
    for i in range(len(words) - 1):
        a, b = words[i], words[i + 1]
        ml = min(len(a), len(b))
        diff = -1
        for j in range(ml):
            if a[j] != b[j]:
                diff = j; break
        if diff == -1:
            if len(a) > len(b):
                return False
            continue
        if pos[a[diff]] >= pos[b[diff]]:
            return False
    return True


if __name__ == "__main__":
    sol = Solution()
    o1 = sol.alienOrder(["wrt", "wrf", "er", "ett", "rftt"])
    assert _is_valid(o1, ["wrt", "wrf", "er", "ett", "rftt"])
    assert sol.alienOrder(["z", "x"]) in ("zx",)
    assert sol.alienOrder(["z", "x", "z"]) == ""
    assert sol.alienOrder(["abc", "ab"]) == ""
    o5 = sol.alienOrder(["a"])
    assert o5 == "a"
    o6 = sol.alienOrder(["ab", "adc"])
    assert _is_valid(o6, ["ab", "adc"])
    print("All tests passed!")
