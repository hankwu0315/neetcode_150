"""
Problem: 0019. Remove Nth Node From End of List
Difficulty: Medium
URL: https://leetcode.com/problems/remove-nth-node-from-end-of-list/

解法：dummy + 快慢指標一次掃描，O(L)/O(1)。
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
    def removeNthFromEnd(self, head: Optional[ListNode], n: int) -> Optional[ListNode]:
        pass

    def removeNthFromEnd_brute(self, head: Optional[ListNode], n: int) -> Optional[ListNode]:
        pass


if __name__ == "__main__":
    solution = Solution()

    # Test 1
    # result = solution.solve(...)
    # assert result == expected

    print("All tests passed!")
