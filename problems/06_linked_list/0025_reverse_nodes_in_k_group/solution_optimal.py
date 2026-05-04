"""
Problem: 0025. Reverse Nodes in k-Group
Difficulty: Hard
URL: https://leetcode.com/problems/reverse-nodes-in-k-group/

解法：dummy + 分組反轉，每組獨立反轉並串接，O(n)/O(1)。
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
    def reverseKGroup(self, head: Optional[ListNode], k: int) -> Optional[ListNode]:
        dummy = ListNode(0, head)
        group_prev = dummy
        while True:
            # 找第 k 個節點
            kth = group_prev
            for _ in range(k):
                kth = kth.next
                if kth is None:
                    return dummy.next
            group_next = kth.next
            # 反轉 [group_prev.next ... kth]
            prev, cur = group_next, group_prev.next
            while cur is not group_next:
                nxt = cur.next
                cur.next = prev
                prev = cur
                cur = nxt
            # 連接：group_prev.next 變成新尾（原 group_prev.next）
            tmp = group_prev.next
            group_prev.next = kth
            group_prev = tmp


if __name__ == "__main__":
    sol = Solution()
    assert to_list(sol.reverseKGroup(from_list([1, 2, 3, 4, 5]), 2)) == [2, 1, 4, 3, 5]
    assert to_list(sol.reverseKGroup(from_list([1, 2, 3, 4, 5]), 3)) == [3, 2, 1, 4, 5]
    assert to_list(sol.reverseKGroup(from_list([1, 2, 3, 4, 5, 6]), 3)) == [3, 2, 1, 6, 5, 4]
    assert to_list(sol.reverseKGroup(from_list([1, 2, 3, 4, 5]), 1)) == [1, 2, 3, 4, 5]
    assert to_list(sol.reverseKGroup(from_list([1, 2]), 5)) == [1, 2]  # 不足 k
    assert to_list(sol.reverseKGroup(from_list([]), 2)) == []
    print("All tests passed!")
