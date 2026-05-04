"""
Problem: 1448. Count Good Nodes in Binary Tree
Difficulty: Medium
URL: https://leetcode.com/problems/count-good-nodes-in-binary-tree/

解法：DFS 攜帶路徑最大值，O(n)/O(h)。
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
    def goodNodes(self, root: Optional[TreeNode]) -> int:
        def dfs(n, mx):
            if n is None: return 0
            cnt = 1 if n.val >= mx else 0
            nmx = mx if mx > n.val else n.val
            return cnt + dfs(n.left, nmx) + dfs(n.right, nmx)
        return dfs(root, -math.inf)


if __name__ == "__main__":
    sol = Solution()
    assert sol.goodNodes(from_level([3, 1, 4, 3, None, 1, 5])) == 4
    assert sol.goodNodes(from_level([3, 3, None, 4, 2])) == 3
    assert sol.goodNodes(from_level([1])) == 1
    assert sol.goodNodes(from_level([2, None, 4, 10, 8, None, None, 4])) == 4
    print("All tests passed!")
