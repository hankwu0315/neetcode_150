"""
Problem: 0206. Reverse Linked List
Difficulty: Easy
URL: https://leetcode.com/problems/reverse-linked-list/

解法演進：
1) 迭代：prev/cur 指標翻轉，O(n)/O(1)。
2) 遞迴：O(n)/O(n)。

最佳解核心思路：
- 在改 cur.next 前先存 nxt，再 prev/cur 各前進一步。
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
    dummy = ListNode()
    cur = dummy
    for v in arr:
        cur.next = ListNode(v)
        cur = cur.next
    return dummy.next


class Solution:
    def reverseList(self, head: Optional[ListNode]) -> Optional[ListNode]:
        prev, cur = None, head
        while cur:
            nxt = cur.next
            cur.next = prev
            prev = cur
            cur = nxt
        return prev

    def reverseList_recursive(self, head: Optional[ListNode]) -> Optional[ListNode]:
        if head is None or head.next is None:
            return head
        new_head = self.reverseList_recursive(head.next)
        head.next.next = head
        head.next = None
        return new_head


if __name__ == "__main__":
    sol = Solution()
    for fn in (sol.reverseList, sol.reverseList_recursive):
        assert to_list(fn(from_list([1, 2, 3, 4, 5]))) == [5, 4, 3, 2, 1]
        assert to_list(fn(from_list([1, 2]))) == [2, 1]
        assert to_list(fn(from_list([]))) == []
        assert to_list(fn(from_list([7]))) == [7]
    print("All tests passed!")
