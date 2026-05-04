"""
Problem: 0105. Construct Binary Tree from Preorder and Inorder Traversal
Difficulty: Medium
URL: https://leetcode.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/

解法：遞迴 + 中序索引雜湊，O(n)/O(n)。
"""
from __future__ import annotations
from typing import Optional, List, Dict
from collections import deque


class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val; self.left = left; self.right = right


def to_level(root: Optional[TreeNode]) -> List[Optional[int]]:
    if not root: return []
    out = []
    q = deque([root])
    while q:
        n = q.popleft()
        if n is None: out.append(None); continue
        out.append(n.val); q.append(n.left); q.append(n.right)
    while out and out[-1] is None: out.pop()
    return out


class Solution:
    def buildTree(self, preorder: List[int], inorder: List[int]) -> Optional[TreeNode]:
        idx: Dict[int, int] = {v: i for i, v in enumerate(inorder)}

        def build(pl: int, pr: int, il: int, ir: int) -> Optional[TreeNode]:
            if pl > pr: return None
            root = TreeNode(preorder[pl])
            i = idx[preorder[pl]]
            ls = i - il
            root.left = build(pl + 1, pl + ls, il, i - 1)
            root.right = build(pl + ls + 1, pr, i + 1, ir)
            return root

        return build(0, len(preorder) - 1, 0, len(inorder) - 1)


if __name__ == "__main__":
    sol = Solution()
    assert to_level(sol.buildTree([3, 9, 20, 15, 7], [9, 3, 15, 20, 7])) == [3, 9, 20, None, None, 15, 7]
    assert to_level(sol.buildTree([-1], [-1])) == [-1]
    assert to_level(sol.buildTree([1, 2], [2, 1])) == [1, 2]
    assert to_level(sol.buildTree([1, 2], [1, 2])) == [1, None, 2]
    assert to_level(sol.buildTree([], [])) == []
    print("All tests passed!")
