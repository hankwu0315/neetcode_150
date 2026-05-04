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
        pass

    def add(self, val: int) -> int:
        pass


if __name__ == "__main__":
    kthLargest = KthLargest()

    # Test 1
    # result = kthLargest.solve(...)
    # assert result == expected

    print("All tests passed!")
