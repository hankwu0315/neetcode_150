"""
Problem: 0102. Binary Tree Level Order Traversal
Difficulty: Medium
URL: https://leetcode.com/problems/binary-tree-level-order-traversal/

解法：BFS 逐層收集，O(n)/O(w)。
"""
from __future__ import annotations
from typing import Optional, List
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


class Solution:
    def levelOrder(self, root: Optional[TreeNode]) -> List[List[int]]:
        if not root: return []
        out = []
        q = deque([root])
        while q:
            layer = []
            for _ in range(len(q)):
                n = q.popleft()
                layer.append(n.val)
                if n.left: q.append(n.left)
                if n.right: q.append(n.right)
            out.append(layer)
        return out


if __name__ == "__main__":
    sol = Solution()
    assert sol.levelOrder(from_level([3, 9, 20, None, None, 15, 7])) == [[3], [9, 20], [15, 7]]
    assert sol.levelOrder(from_level([1])) == [[1]]
    assert sol.levelOrder(from_level([])) == []
    assert sol.levelOrder(from_level([1, 2, 3, 4, 5, 6, 7])) == [[1], [2, 3], [4, 5, 6, 7]]
    print("All tests passed!")
