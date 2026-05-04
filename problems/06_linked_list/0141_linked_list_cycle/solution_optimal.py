"""
Problem: 0141. Linked List Cycle
Difficulty: Easy
URL: https://leetcode.com/problems/linked-list-cycle/

解法：Floyd 快慢指標，O(n)/O(1)。
"""
from __future__ import annotations
from typing import Optional


class ListNode:
    def __init__(self, val: int = 0, next: Optional["ListNode"] = None):
        self.val = val
        self.next = next


def build_with_cycle(arr, pos):
    if not arr:
        return None
    nodes = [ListNode(v) for v in arr]
    for i in range(len(nodes) - 1):
        nodes[i].next = nodes[i + 1]
    if pos != -1:
        nodes[-1].next = nodes[pos]
    return nodes[0]


class Solution:
    def hasCycle(self, head: Optional[ListNode]) -> bool:
        slow = fast = head
        while fast and fast.next:
            slow = slow.next
            fast = fast.next.next
            if slow is fast:
                return True
        return False

    def hasCycle_set(self, head: Optional[ListNode]) -> bool:
        seen = set()
        cur = head
        while cur:
            if id(cur) in seen:
                return True
            seen.add(id(cur))
            cur = cur.next
        return False


if __name__ == "__main__":
    sol = Solution()
    for fn in (sol.hasCycle, sol.hasCycle_set):
        assert fn(build_with_cycle([3, 2, 0, -4], 1)) is True
        assert fn(build_with_cycle([1, 2], 0)) is True
        assert fn(build_with_cycle([1], -1)) is False
        assert fn(build_with_cycle([], -1)) is False
        assert fn(build_with_cycle([1, 2, 3], -1)) is False
    print("All tests passed!")
