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
        dummy = ListNode(0, head)
        fast = slow = dummy
        for _ in range(n + 1):
            fast = fast.next
        while fast:
            fast = fast.next
            slow = slow.next
        slow.next = slow.next.next
        return dummy.next

    def removeNthFromEnd_brute(self, head: Optional[ListNode], n: int) -> Optional[ListNode]:
        L = 0
        cur = head
        while cur:
            L += 1; cur = cur.next
        target = L - n  # 0-indexed
        dummy = ListNode(0, head)
        prev = dummy
        for _ in range(target):
            prev = prev.next
        prev.next = prev.next.next
        return dummy.next


if __name__ == "__main__":
    sol = Solution()
    for fn in (sol.removeNthFromEnd, sol.removeNthFromEnd_brute):
        assert to_list(fn(from_list([1, 2, 3, 4, 5]), 2)) == [1, 2, 3, 5]
        assert to_list(fn(from_list([1]), 1)) == []
        assert to_list(fn(from_list([1, 2]), 1)) == [1]
        assert to_list(fn(from_list([1, 2]), 2)) == [2]  # 刪頭
        assert to_list(fn(from_list([1, 2, 3, 4, 5]), 5)) == [2, 3, 4, 5]  # 刪頭
        assert to_list(fn(from_list([1, 2, 3, 4, 5]), 1)) == [1, 2, 3, 4]  # 刪尾
    print("All tests passed!")
