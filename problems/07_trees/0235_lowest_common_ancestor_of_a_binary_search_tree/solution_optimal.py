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
        node = root
        while node:
            if p.val < node.val and q.val < node.val:
                node = node.left
            elif p.val > node.val and q.val > node.val:
                node = node.right
            else:
                return node


if __name__ == "__main__":
    sol = Solution()
    r = from_level([6, 2, 8, 0, 4, 7, 9, None, None, 3, 5])
    assert sol.lowestCommonAncestor(r, find(r, 2), find(r, 8)).val == 6
    assert sol.lowestCommonAncestor(r, find(r, 2), find(r, 4)).val == 2
    assert sol.lowestCommonAncestor(r, find(r, 3), find(r, 5)).val == 4
    assert sol.lowestCommonAncestor(r, find(r, 0), find(r, 9)).val == 6
    r2 = from_level([2, 1])
    assert sol.lowestCommonAncestor(r2, find(r2, 2), find(r2, 1)).val == 2
    print("All tests passed!")
