"""
Problem: 0025. Reverse Nodes in k-Group
Difficulty: Hard
URL: https://leetcode.com/problems/reverse-nodes-in-k-group/

解法：dummy + 分組反轉，每組獨立反轉並串接，O(n)/O(1)。
"""

from __future__ import annotations

from typing import Optional

class ListNode:
    def __init__(self, val: int = 0, next: Optional["ListNode"] = None):
        self.val = val
        self.next = next

def to_list(h):
    out = []
    while h: out.append(h.val); h = h.next
    return out

def from_list(arr):
    d = ListNode(); c = d
    for v in arr: c.next = ListNode(v); c = c.next
    return d.next

class Solution:
    def reverseKGroup(self, head: Optional[ListNode], k: int) -> Optional[ListNode]:
        pass


if __name__ == "__main__":
    solution = Solution()

    # Test 1
    # result = solution.solve(...)
    # assert result == expected

    print("All tests passed!")
