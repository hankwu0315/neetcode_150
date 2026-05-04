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
        if not head or not head.next:
            return
        # 1) 找中點（slow 為前半尾）
        slow, fast = head, head
        while fast.next and fast.next.next:
            slow = slow.next
            fast = fast.next.next
        # 2) 反轉後半
        second = slow.next
        slow.next = None
        prev = None
        while second:
            nxt = second.next
            second.next = prev
            prev = second
            second = nxt
        # 3) 交錯合併
        a, b = head, prev
        while b:
            a_nxt, b_nxt = a.next, b.next
            a.next = b
            b.next = a_nxt
            a, b = a_nxt, b_nxt


if __name__ == "__main__":
    sol = Solution()
    h = from_list([1, 2, 3, 4]); sol.reorderList(h); assert to_list(h) == [1, 4, 2, 3]
    h = from_list([1, 2, 3, 4, 5]); sol.reorderList(h); assert to_list(h) == [1, 5, 2, 4, 3]
    h = from_list([1]); sol.reorderList(h); assert to_list(h) == [1]
    h = from_list([1, 2]); sol.reorderList(h); assert to_list(h) == [1, 2]
    h = from_list([1, 2, 3]); sol.reorderList(h); assert to_list(h) == [1, 3, 2]
    print("All tests passed!")
