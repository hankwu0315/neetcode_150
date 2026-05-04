"""
Problem: 0110. Balanced Binary Tree
Difficulty: Easy
URL: https://leetcode.com/problems/balanced-binary-tree/

解法：DFS 後序回傳深度或 -1（提前剪枝），O(n)/O(h)。
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
    def isBalanced(self, root: Optional[TreeNode]) -> bool:
        def depth(n):
            if n is None: return 0
            L = depth(n.left)
            if L == -1: return -1
            R = depth(n.right)
            if R == -1 or abs(L - R) > 1: return -1
            return 1 + max(L, R)
        return depth(root) != -1


if __name__ == "__main__":
    sol = Solution()
    assert sol.isBalanced(from_level([3, 9, 20, None, None, 15, 7])) is True
    assert sol.isBalanced(from_level([1, 2, 2, 3, 3, None, None, 4, 4])) is False
    assert sol.isBalanced(from_level([])) is True
    assert sol.isBalanced(from_level([1])) is True
    assert sol.isBalanced(from_level([1, 2, None, 3, None, 4])) is False
    print("All tests passed!")
