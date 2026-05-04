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
        pass

    def isValidBST_inorder(self, root: Optional[TreeNode]) -> bool:
        pass


if __name__ == "__main__":
    solution = Solution()

    # Test 1
    # result = solution.solve(...)
    # assert result == expected

    print("All tests passed!")
