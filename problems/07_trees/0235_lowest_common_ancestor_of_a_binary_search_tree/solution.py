"""
Problem: 0235. Lowest Common Ancestor of a BST
Difficulty: Medium
URL: https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-search-tree/

解法：利用 BST 排序性沿樹走，O(h)/O(1)。
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

def find(root, val):
    cur = root
    while cur:
        if cur.val == val: return cur
        cur = cur.left if val < cur.val else cur.right
    return None

class Solution:
    def lowestCommonAncestor(self, root: TreeNode, p: TreeNode, q: TreeNode) -> TreeNode:
        pass


if __name__ == "__main__":
    solution = Solution()

    # Test 1
    # result = solution.solve(...)
    # assert result == expected

    print("All tests passed!")
