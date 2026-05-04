"""
Problem: 0021. Merge Two Sorted Lists
Difficulty: Easy
URL: https://leetcode.com/problems/merge-two-sorted-lists/

解法演進：
1) dummy + 雙指標 O(m+n)/O(1)。
2) 遞迴 O(m+n)/O(m+n)。

最佳解核心思路：
- dummy 簡化頭節點；比小者接尾，最後接剩餘整段。
"""

from __future__ import annotations

from typing import Optional

class ListNode:
    def __init__(self, val: int = 0, next: Optional["ListNode"] = None):
        self.val = val
        self.next = next

def to_list(h: Optional[ListNode]) -> list[int]:
    out = []
    while h:
        out.append(h.val)
        h = h.next
    return out

def from_list(arr: list[int]) -> Optional[ListNode]:
    d = ListNode()
    c = d
    for v in arr:
        c.next = ListNode(v)
        c = c.next
    return d.next

class Solution:
    def mergeTwoLists(self, l1: Optional[ListNode], l2: Optional[ListNode]) -> Optional[ListNode]:
        pass

    def mergeTwoLists_recursive(self, a: Optional[ListNode], b: Optional[ListNode]) -> Optional[ListNode]:
        pass


if __name__ == "__main__":
    solution = Solution()

    # Test 1
    # result = solution.solve(...)
    # assert result == expected

    print("All tests passed!")
