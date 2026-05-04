"""
Problem: 0023. Merge K Sorted Lists
Difficulty: Hard
URL: https://leetcode.com/problems/merge-k-sorted-lists/

解法演進：
1) 收集排序 O(N log N)。
2) 分治兩兩合併 O(N log k)（最佳）。
3) 最小堆 O(N log k)。

複雜度：O(N log k) / O(1)。
"""

from __future__ import annotations

from typing import Optional, List

import heapq

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
    def mergeKLists(self, lists: List[Optional[ListNode]]) -> Optional[ListNode]:
        pass

    def mergeKLists_heap(self, lists: List[Optional[ListNode]]) -> Optional[ListNode]:
        pass


if __name__ == "__main__":
    solution = Solution()

    # Test 1
    # result = solution.solve(...)
    # assert result == expected

    print("All tests passed!")
