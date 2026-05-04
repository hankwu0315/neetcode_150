"""
Problem: 0230. Kth Smallest Element in a BST
Difficulty: Medium
URL: https://leetcode.com/problems/kth-smallest-element-in-a-bst/

解法：中序走訪迭代計數，O(h+k)/O(h)。
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
    def kthSmallest(self, root: Optional[TreeNode], k: int) -> int:
        stack = []
        cur = root
        while True:
            while cur:
                stack.append(cur); cur = cur.left
            cur = stack.pop()
            k -= 1
            if k == 0:
                return cur.val
            cur = cur.right


if __name__ == "__main__":
    sol = Solution()
    assert sol.kthSmallest(from_level([3, 1, 4, None, 2]), 1) == 1
    assert sol.kthSmallest(from_level([3, 1, 4, None, 2]), 2) == 2
    assert sol.kthSmallest(from_level([3, 1, 4, None, 2]), 3) == 3
    assert sol.kthSmallest(from_level([5, 3, 6, 2, 4, None, None, 1]), 3) == 3
    assert sol.kthSmallest(from_level([1]), 1) == 1
    print("All tests passed!")
