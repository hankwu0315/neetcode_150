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
        pass

    def reverseList_recursive(self, head: Optional[ListNode]) -> Optional[ListNode]:
        pass


if __name__ == "__main__":
    solution = Solution()

    # Test 1
    # result = solution.solve(...)
    # assert result == expected

    print("All tests passed!")
