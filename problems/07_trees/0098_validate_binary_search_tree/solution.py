"""
Problem: 0098. Validate Binary Search Tree
Difficulty: Medium
URL: https://leetcode.com/problems/validate-binary-search-tree/

解法：DFS 攜帶 (low, high) 邊界，O(n)/O(h)。
"""
from __future__ import annotations
from typing import Optional, List
from collections import deque
import math


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
    def isValidBST(self, root: Optional[TreeNode]) -> bool:
        def valid(n, lo, hi):
            if n is None: return True
            if not (lo < n.val < hi): return False
            return valid(n.left, lo, n.val) and valid(n.right, n.val, hi)
        return valid(root, -math.inf, math.inf)

    def isValidBST_inorder(self, root: Optional[TreeNode]) -> bool:
        prev = -math.inf
        stack = []
        cur = root
        while cur or stack:
            while cur:
                stack.append(cur); cur = cur.left
            cur = stack.pop()
            if cur.val <= prev: return False
            prev = cur.val
            cur = cur.right
        return True


if __name__ == "__main__":
    sol = Solution()
    for fn in (sol.isValidBST, sol.isValidBST_inorder):
        assert fn(from_level([2, 1, 3])) is True
        assert fn(from_level([5, 1, 4, None, None, 3, 6])) is False
        assert fn(from_level([])) is True
        assert fn(from_level([1])) is True
        assert fn(from_level([5, 4, 6, None, None, 3, 7])) is False
        assert fn(from_level([10, 5, 15, None, None, 6, 20])) is False
    print("All tests passed!")
