"""
Problem: 0002. Add Two Numbers
Difficulty: Medium
URL: https://leetcode.com/problems/add-two-numbers/

解法：dummy + 進位逐位相加，O(max(m,n))/O(max(m,n))。
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
    def addTwoNumbers(self, l1: Optional[ListNode], l2: Optional[ListNode]) -> Optional[ListNode]:
        dummy = ListNode()
        tail = dummy
        carry = 0
        a, b = l1, l2
        while a or b or carry:
            s = carry
            if a: s += a.val; a = a.next
            if b: s += b.val; b = b.next
            carry, digit = divmod(s, 10)
            tail.next = ListNode(digit)
            tail = tail.next
        return dummy.next


if __name__ == "__main__":
    sol = Solution()
    assert to_list(sol.addTwoNumbers(from_list([2, 4, 3]), from_list([5, 6, 4]))) == [7, 0, 8]
    assert to_list(sol.addTwoNumbers(from_list([0]), from_list([0]))) == [0]
    assert to_list(sol.addTwoNumbers(from_list([9, 9, 9, 9, 9, 9, 9]), from_list([9, 9, 9, 9]))) == [8, 9, 9, 9, 0, 0, 0, 1]
    assert to_list(sol.addTwoNumbers(from_list([5]), from_list([5]))) == [0, 1]
    assert to_list(sol.addTwoNumbers(from_list([1]), from_list([9, 9, 9]))) == [0, 0, 0, 1]
    print("All tests passed!")
