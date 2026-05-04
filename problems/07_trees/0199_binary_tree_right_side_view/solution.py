"""
Problem: 0199. Binary Tree Right Side View
Difficulty: Medium
URL: https://leetcode.com/problems/binary-tree-right-side-view/

解法：BFS 取每層最後節點值，O(n)/O(w)。
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
    def rightSideView(self, root: Optional[TreeNode]) -> List[int]:
        if not root: return []
        out = []
        q = deque([root])
        while q:
            sz = len(q)
            for i in range(sz):
                n = q.popleft()
                if i == sz - 1:
                    out.append(n.val)
                if n.left: q.append(n.left)
                if n.right: q.append(n.right)
        return out


if __name__ == "__main__":
    sol = Solution()
    assert sol.rightSideView(from_level([1, 2, 3, None, 5, None, 4])) == [1, 3, 4]
    assert sol.rightSideView(from_level([1, None, 3])) == [1, 3]
    assert sol.rightSideView(from_level([])) == []
    assert sol.rightSideView(from_level([1, 2])) == [1, 2]
    assert sol.rightSideView(from_level([1, 2, 3, 4])) == [1, 3, 4]
    print("All tests passed!")
