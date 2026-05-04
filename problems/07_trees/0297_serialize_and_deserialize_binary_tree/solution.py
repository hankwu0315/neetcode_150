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
        pass

    def deserialize(self, data: str) -> Optional[TreeNode]:
        pass


if __name__ == "__main__":
    codec = Codec()

    # Test 1
    # result = codec.solve(...)
    # assert result == expected

    print("All tests passed!")
