"""
Problem: 0703. Kth Largest Element in a Stream
Difficulty: Easy
URL: https://leetcode.com/problems/kth-largest-element-in-a-stream/

解法：大小 k 的 min-heap，O(log k)/O(k)。
"""
from __future__ import annotations
from typing import List
import heapq


class KthLargest:
    def __init__(self, k: int, nums: List[int]):
        self.k = k
        self.h: List[int] = []
        for n in nums:
            self.add(n)

    def add(self, val: int) -> int:
        if len(self.h) < self.k:
            heapq.heappush(self.h, val)
        elif val > self.h[0]:
            heapq.heapreplace(self.h, val)
        return self.h[0]


if __name__ == "__main__":
    kl = KthLargest(3, [4, 5, 8, 2])
    assert kl.add(3) == 4
    assert kl.add(5) == 5
    assert kl.add(10) == 5
    assert kl.add(9) == 8
    assert kl.add(4) == 8
    kl2 = KthLargest(1, [])
    assert kl2.add(-3) == -3
    assert kl2.add(-2) == -2
    assert kl2.add(-4) == -2
    assert kl2.add(0) == 0
    assert kl2.add(4) == 4
    print("All tests passed!")
