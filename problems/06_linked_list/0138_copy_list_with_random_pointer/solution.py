"""
Problem: 0138. Copy List with Random Pointer
Difficulty: Medium
URL: https://leetcode.com/problems/copy-list-with-random-pointer/

解法：HashMap 兩遍掃描，O(n)/O(n)。
"""

from __future__ import annotations

from typing import Optional

class Node:
    def __init__(self, x: int, next: Optional["Node"] = None, random: Optional["Node"] = None):
        pass


def build(arr: list[tuple[int, int | None]]) -> Optional[Node]:
    if not arr:
        return None
    nodes = [Node(v) for v, _ in arr]
    for i in range(len(nodes) - 1):
        nodes[i].next = nodes[i + 1]
    for i, (_, r) in enumerate(arr):
        if r is not None:
            nodes[i].random = nodes[r]
    return nodes[0]

def serialize(h: Optional[Node]) -> list[tuple[int, int | None]]:
    nodes, idx = [], {}
    cur = h
    while cur:
        idx[id(cur)] = len(nodes)
        nodes.append(cur)
        cur = cur.next
    out = []
    for n in nodes:
        out.append((n.val, idx[id(n.random)] if n.random else None))
    return out

class Solution:
    def copyRandomList(self, head: Optional[Node]) -> Optional[Node]:
        pass


if __name__ == "__main__":
    node = Node()

    # Test 1
    # result = node.solve(...)
    # assert result == expected

    print("All tests passed!")
