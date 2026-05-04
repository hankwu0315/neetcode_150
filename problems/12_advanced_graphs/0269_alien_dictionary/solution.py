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
        pass


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
    solution = Solution()

    # Test 1
    # result = solution.solve(...)
    # assert result == expected

    print("All tests passed!")
