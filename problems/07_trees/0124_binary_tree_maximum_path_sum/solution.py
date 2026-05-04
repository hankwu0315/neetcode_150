"""
Problem: 0124. Binary Tree Maximum Path Sum
Difficulty: Hard
URL: https://leetcode.com/problems/binary-tree-maximum-path-sum/

解法：DFS 後序，回傳向上單邊最大貢獻並更新答案，O(n)/O(h)。
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
    def maxPathSum(self, root: Optional[TreeNode]) -> int:
        ans = -math.inf

        def gain(n):
            nonlocal ans
            if n is None: return 0
            L = max(0, gain(n.left))
            R = max(0, gain(n.right))
            cur = n.val + L + R
            if cur > ans: ans = cur
            return n.val + max(L, R)

        gain(root)
        return ans


if __name__ == "__main__":
    sol = Solution()
    assert sol.maxPathSum(from_level([1, 2, 3])) == 6
    assert sol.maxPathSum(from_level([-10, 9, 20, None, None, 15, 7])) == 42
    assert sol.maxPathSum(from_level([-3])) == -3
    assert sol.maxPathSum(from_level([2, -1])) == 2
    assert sol.maxPathSum(from_level([-2, -1])) == -1
    assert sol.maxPathSum(from_level([1, -2, -3, 1, 3, -2, None, -1])) == 3
    print("All tests passed!")
