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
        self.val = x
        self.next = next
        self.random = random


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
        if head is None:
            return None
        m: dict[int, Node] = {}
        cur = head
        while cur:
            m[id(cur)] = Node(cur.val)
            cur = cur.next
        cur = head
        while cur:
            n = m[id(cur)]
            n.next = m[id(cur.next)] if cur.next else None
            n.random = m[id(cur.random)] if cur.random else None
            cur = cur.next
        return m[id(head)]


if __name__ == "__main__":
    sol = Solution()
    cases = [
        [(7, None), (13, 0), (11, 4), (10, 2), (1, 0)],
        [(1, 1), (2, 1)],
        [(3, None), (3, 0), (3, None)],
        [],
    ]
    for arr in cases:
        h = build(arr)
        copied = sol.copyRandomList(h)
        assert serialize(copied) == arr
        # 確認是深拷貝（不是同一節點）
        c1, c2 = h, copied
        while c1 and c2:
            assert c1 is not c2
            c1, c2 = c1.next, c2.next
    print("All tests passed!")
