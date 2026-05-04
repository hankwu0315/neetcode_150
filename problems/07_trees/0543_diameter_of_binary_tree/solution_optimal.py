"""
Problem: 0543. Diameter of Binary Tree
Difficulty: Easy
URL: https://leetcode.com/problems/diameter-of-binary-tree/

解法：DFS 後序，邊計深度邊更新最大 L+R，O(n)/O(h)。
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
        if i < len(arr) and arr[i] is not None: n.left = TreeNode(arr[i]); q.append(n.left)
        i += 1
        if i < len(arr) and arr[i] is not None: n.right = TreeNode(arr[i]); q.append(n.right)
        i += 1
    return root


class Solution:
    def diameterOfBinaryTree(self, root: Optional[TreeNode]) -> int:
        ans = 0

        def depth(n):
            nonlocal ans
            if n is None: return 0
            L = depth(n.left); R = depth(n.right)
            if L + R > ans: ans = L + R
            return 1 + max(L, R)

        depth(root)
        return ans


if __name__ == "__main__":
    sol = Solution()
    assert sol.diameterOfBinaryTree(from_level([1, 2, 3, 4, 5])) == 3
    assert sol.diameterOfBinaryTree(from_level([1, 2])) == 1
    assert sol.diameterOfBinaryTree(from_level([])) == 0
    assert sol.diameterOfBinaryTree(from_level([1])) == 0
    assert sol.diameterOfBinaryTree(from_level([1, 2, None, 3, None, 4, None, 5])) == 4
    print("All tests passed!")
