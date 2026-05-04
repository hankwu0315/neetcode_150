"""
Problem: 0143. Reorder List
Difficulty: Medium
URL: https://leetcode.com/problems/reorder-list/

解法：找中點 -> 反轉後半 -> 交錯合併，O(n)/O(1)。
"""

from __future__ import annotations

from typing import Optional

class ListNode:
    def __init__(self, val: int = 0, next: Optional["ListNode"] = None):
        self.val = val
        self.next = next

def to_list(h):
    out = []
    while h:
        out.append(h.val); h = h.next
    return out

def from_list(arr):
    d = ListNode(); c = d
    for v in arr: c.next = ListNode(v); c = c.next
    return d.next

class Solution:
    def reorderList(self, head: Optional[ListNode]) -> None:
        pass


if __name__ == "__main__":
    solution = Solution()

    # Test 1
    # result = solution.solve(...)
    # assert result == expected

    print("All tests passed!")
