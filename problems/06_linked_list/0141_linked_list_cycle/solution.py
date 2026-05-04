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
        pass

    def hasCycle_set(self, head: Optional[ListNode]) -> bool:
        pass


if __name__ == "__main__":
    solution = Solution()

    # Test 1
    # result = solution.solve(...)
    # assert result == expected

    print("All tests passed!")
