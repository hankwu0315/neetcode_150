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
        pass


if __name__ == "__main__":
    solution = Solution()

    # Test 1
    # result = solution.solve(...)
    # assert result == expected

    print("All tests passed!")
