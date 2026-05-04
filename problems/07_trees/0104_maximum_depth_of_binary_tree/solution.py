"""
Problem: 0104. Maximum Depth of Binary Tree
Difficulty: Easy
URL: https://leetcode.com/problems/maximum-depth-of-binary-tree/

解法：DFS 遞迴 1 + max(L, R)，O(n)/O(h)。
"""
from __future__ import annotations
from typing import Optional, List
from collections import deque


class TreeNode:
    def __init__(self, val: int = 0, left=None, right=None):
        self.val = val; self.left = left; self.right = right


def from_level(arr: List[Optional[int]]) -> Optional[TreeNode]:
    if not arr: return None
    root = TreeNode(arr[0]); q = deque([root]); i = 1
    while q and i < len(arr):
        n = q.popleft()
        if i < len(arr) and arr[i] is not None:
            n.left = TreeNode(arr[i]); q.append(n.left)
        i += 1
        if i < len(arr) and arr[i] is not None:
            n.right = TreeNode(arr[i]); q.append(n.right)
        i += 1
    return root


class Solution:
    def maxDepth(self, root: Optional[TreeNode]) -> int:
        if root is None:
            return 0
        return 1 + max(self.maxDepth(root.left), self.maxDepth(root.right))

    def maxDepth_bfs(self, root: Optional[TreeNode]) -> int:
        if not root: return 0
        q = deque([root]); d = 0
        while q:
            d += 1
            for _ in range(len(q)):
                n = q.popleft()
                if n.left: q.append(n.left)
                if n.right: q.append(n.right)
        return d


if __name__ == "__main__":
    sol = Solution()
    for fn in (sol.maxDepth, sol.maxDepth_bfs):
        assert fn(from_level([3, 9, 20, None, None, 15, 7])) == 3
        assert fn(from_level([1, None, 2])) == 2
        assert fn(from_level([])) == 0
        assert fn(from_level([1])) == 1
        assert fn(from_level([1, 2, 3, 4, 5])) == 3
    print("All tests passed!")
