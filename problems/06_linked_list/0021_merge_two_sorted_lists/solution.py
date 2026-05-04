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
        dummy = ListNode()
        tail = dummy
        a, b = l1, l2
        while a and b:
            if a.val <= b.val:
                tail.next = a
                a = a.next
            else:
                tail.next = b
                b = b.next
            tail = tail.next
        tail.next = a if a else b
        return dummy.next

    def mergeTwoLists_recursive(self, a: Optional[ListNode], b: Optional[ListNode]) -> Optional[ListNode]:
        if not a:
            return b
        if not b:
            return a
        if a.val <= b.val:
            a.next = self.mergeTwoLists_recursive(a.next, b)
            return a
        b.next = self.mergeTwoLists_recursive(a, b.next)
        return b


if __name__ == "__main__":
    sol = Solution()
    for fn in (sol.mergeTwoLists, sol.mergeTwoLists_recursive):
        assert to_list(fn(from_list([1, 2, 4]), from_list([1, 3, 4]))) == [1, 1, 2, 3, 4, 4]
        assert to_list(fn(from_list([]), from_list([]))) == []
        assert to_list(fn(from_list([]), from_list([0]))) == [0]
        assert to_list(fn(from_list([5]), from_list([1, 2, 3]))) == [1, 2, 3, 5]
        assert to_list(fn(from_list([1, 1, 1]), from_list([1, 1]))) == [1, 1, 1, 1, 1]
    print("All tests passed!")
