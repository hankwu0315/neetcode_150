"""
Problem: 0572. Subtree of Another Tree
Difficulty: Easy
URL: https://leetcode.com/problems/subtree-of-another-tree/

解法：對每個 root 節點呼叫 sameTree，O(m*n)/O(h)。
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
    def isSubtree(self, root: Optional[TreeNode], subRoot: Optional[TreeNode]) -> bool:
        if subRoot is None: return True
        if root is None: return False
        if self._same(root, subRoot): return True
        return self.isSubtree(root.left, subRoot) or self.isSubtree(root.right, subRoot)

    def _same(self, a: Optional[TreeNode], b: Optional[TreeNode]) -> bool:
        if a is None and b is None: return True
        if a is None or b is None: return False
        return a.val == b.val and self._same(a.left, b.left) and self._same(a.right, b.right)


if __name__ == "__main__":
    sol = Solution()
    assert sol.isSubtree(from_level([3, 4, 5, 1, 2]), from_level([4, 1, 2])) is True
    assert sol.isSubtree(from_level([3, 4, 5, 1, 2, None, None, None, None, 0]), from_level([4, 1, 2])) is False
    assert sol.isSubtree(from_level([1, 1]), from_level([1])) is True
    assert sol.isSubtree(from_level([]), from_level([1])) is False
    assert sol.isSubtree(from_level([1, 2, 3]), from_level([])) is True
    print("All tests passed!")
