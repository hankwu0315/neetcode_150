"""
Problem: 0226. Invert Binary Tree
Difficulty: Easy
URL: https://leetcode.com/problems/invert-binary-tree/

解法：DFS 遞迴交換左右子樹，O(n)/O(h)。
"""
from __future__ import annotations
from typing import Optional, List
from collections import deque


class TreeNode:
    def __init__(self, val: int = 0, left: Optional["TreeNode"] = None, right: Optional["TreeNode"] = None):
        self.val = val; self.left = left; self.right = right


def from_level(arr: List[Optional[int]]) -> Optional[TreeNode]:
    if not arr:
        return None
    root = TreeNode(arr[0])
    q = deque([root])
    i = 1
    while q and i < len(arr):
        n = q.popleft()
        if i < len(arr) and arr[i] is not None:
            n.left = TreeNode(arr[i]); q.append(n.left)
        i += 1
        if i < len(arr) and arr[i] is not None:
            n.right = TreeNode(arr[i]); q.append(n.right)
        i += 1
    return root


def to_level(root: Optional[TreeNode]) -> List[Optional[int]]:
    if not root:
        return []
    out: List[Optional[int]] = []
    q = deque([root])
    while q:
        n = q.popleft()
        if n is None:
            out.append(None); continue
        out.append(n.val)
        q.append(n.left); q.append(n.right)
    while out and out[-1] is None:
        out.pop()
    return out


class Solution:
    def invertTree(self, root: Optional[TreeNode]) -> Optional[TreeNode]:
        if root is None:
            return None
        root.left, root.right = self.invertTree(root.right), self.invertTree(root.left)
        return root


if __name__ == "__main__":
    sol = Solution()
    assert to_level(sol.invertTree(from_level([4, 2, 7, 1, 3, 6, 9]))) == [4, 7, 2, 9, 6, 3, 1]
    assert to_level(sol.invertTree(from_level([2, 1, 3]))) == [2, 3, 1]
    assert to_level(sol.invertTree(from_level([]))) == []
    assert to_level(sol.invertTree(from_level([1]))) == [1]
    print("All tests passed!")
