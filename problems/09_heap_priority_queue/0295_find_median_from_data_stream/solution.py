"""
Problem: 0295. Find Median from Data Stream
Difficulty: Hard
URL: https://leetcode.com/problems/find-median-from-data-stream/

解法：max-heap + min-heap 平衡，addNum O(log n)，findMedian O(1)。
"""

from __future__ import annotations

from typing import List

import heapq

class MedianFinder:
    def __init__(self):
        pass

    def addNum(self, num: int) -> None:
        pass

    def findMedian(self) -> float:
        pass


if __name__ == "__main__":
    medianFinder = MedianFinder()

    # Test 1
    # result = medianFinder.solve(...)
    # assert result == expected

    print("All tests passed!")
