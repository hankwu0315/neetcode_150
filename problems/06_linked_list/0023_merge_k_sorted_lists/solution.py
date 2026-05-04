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
        if not lists:
            return None

        def merge2(a, b):
            d = ListNode(); t = d
            while a and b:
                if a.val <= b.val: t.next = a; a = a.next
                else:              t.next = b; b = b.next
                t = t.next
            t.next = a if a else b
            return d.next

        step = 1
        n = len(lists)
        while step < n:
            for i in range(0, n - step, step * 2):
                lists[i] = merge2(lists[i], lists[i + step])
            step *= 2
        return lists[0]

    def mergeKLists_heap(self, lists: List[Optional[ListNode]]) -> Optional[ListNode]:
        h = []
        for i, head in enumerate(lists):
            if head:
                heapq.heappush(h, (head.val, i, head))
        d = ListNode(); t = d
        while h:
            v, i, n = heapq.heappop(h)
            t.next = n; t = t.next
            if n.next:
                heapq.heappush(h, (n.next.val, i, n.next))
        return d.next


if __name__ == "__main__":
    sol = Solution()
    for fn in (sol.mergeKLists, sol.mergeKLists_heap):
        assert to_list(fn([from_list([1, 4, 5]), from_list([1, 3, 4]), from_list([2, 6])])) == [1, 1, 2, 3, 4, 4, 5, 6]
        assert to_list(fn([])) == []
        assert to_list(fn([from_list([])])) == []
        assert to_list(fn([from_list([]), from_list([1])])) == [1]
        assert to_list(fn([from_list([1]), from_list([0])])) == [0, 1]
    print("All tests passed!")
