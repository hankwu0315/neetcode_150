"""
Problem: 0297. Serialize and Deserialize Binary Tree
Difficulty: Hard
URL: https://leetcode.com/problems/serialize-and-deserialize-binary-tree/

解法：前序 DFS + '#' null 標記，O(n)/O(n)。
"""
from __future__ import annotations
from typing import Optional, List, Iterator
from collections import deque


class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val; self.left = left; self.right = right


def from_level(arr: List[Optional[int]]) -> Optional[TreeNode]:
    if not arr: return None
    root = TreeNode(arr[0]); q = deque([root]); i = 1
    while q and i < len(arr):
        n = q.popleft()
        if i < len(arr) and arr[i] is not None: n.left = TreeNode(arr[i]); q.append(n.left)
        i += 1
        if i < len(arr) and arr[i] is not None: n.right = TreeNode(arr[i]); q.append(n.right)
        i += 1
    return root


def to_level(root: Optional[TreeNode]) -> List[Optional[int]]:
    if not root: return []
    out: List[Optional[int]] = []
    q = deque([root])
    while q:
        n = q.popleft()
        if n is None: out.append(None); continue
        out.append(n.val); q.append(n.left); q.append(n.right)
    while out and out[-1] is None: out.pop()
    return out


class Codec:
    def serialize(self, root: Optional[TreeNode]) -> str:
        out: List[str] = []

        def dfs(n: Optional[TreeNode]) -> None:
            if n is None:
                out.append('#'); return
            out.append(str(n.val))
            dfs(n.left); dfs(n.right)

        dfs(root)
        return ' '.join(out)

    def deserialize(self, data: str) -> Optional[TreeNode]:
        if not data: return None
        it = iter(data.split(' '))

        def dfs() -> Optional[TreeNode]:
            v = next(it)
            if v == '#': return None
            n = TreeNode(int(v))
            n.left = dfs(); n.right = dfs()
            return n

        return dfs()


if __name__ == "__main__":
    c = Codec()
    for arr in (
        [1, 2, 3, None, None, 4, 5],
        [],
        [1],
        [-1, -2, -3],
        [3, 9, 20, None, None, 15, 7],
        [1, 2, None, 3, None, 4, None, 5],
    ):
        t = from_level(arr)
        s = c.serialize(t)
        t2 = c.deserialize(s)
        assert to_level(t2) == arr, (arr, s, to_level(t2))
    print("All tests passed!")
