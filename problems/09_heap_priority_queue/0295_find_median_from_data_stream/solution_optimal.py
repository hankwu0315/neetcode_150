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
        self.lo: List[int] = []  # max-heap (push -x)
        self.hi: List[int] = []  # min-heap

    def addNum(self, num: int) -> None:
        heapq.heappush(self.lo, -num)
        # move top of lo into hi
        heapq.heappush(self.hi, -heapq.heappop(self.lo))
        if len(self.hi) > len(self.lo):
            heapq.heappush(self.lo, -heapq.heappop(self.hi))

    def findMedian(self) -> float:
        if len(self.lo) > len(self.hi):
            return float(-self.lo[0])
        return ((-self.lo[0]) + self.hi[0]) / 2.0


if __name__ == "__main__":
    mf = MedianFinder()
    mf.addNum(1); mf.addNum(2)
    assert mf.findMedian() == 1.5
    mf.addNum(3)
    assert mf.findMedian() == 2.0
    mf2 = MedianFinder()
    for x in [-1, -2, -3, -4, -5]:
        mf2.addNum(x)
    assert mf2.findMedian() == -3.0
    mf3 = MedianFinder()
    mf3.addNum(6)
    assert mf3.findMedian() == 6.0
    mf3.addNum(10)
    assert mf3.findMedian() == 8.0
    mf3.addNum(2); mf3.addNum(6)
    assert mf3.findMedian() == 6.0
    mf3.addNum(5); mf3.addNum(0)
    # sorted: 0,2,5,6,6,10 -> (5+6)/2=5.5
    assert mf3.findMedian() == 5.5
    print("All tests passed!")
