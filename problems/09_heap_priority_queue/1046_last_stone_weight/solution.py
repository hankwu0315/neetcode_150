"""
Problem: 1046. Last Stone Weight
Difficulty: Easy
URL: https://leetcode.com/problems/last-stone-weight/

解法：max-heap（取負模擬），O(n log n)/O(n)。
"""
from __future__ import annotations
from typing import List
import heapq


class Solution:
    def lastStoneWeight(self, stones: List[int]) -> int:
        h = [-x for x in stones]
        heapq.heapify(h)
        while len(h) > 1:
            x = -heapq.heappop(h)
            y = -heapq.heappop(h)
            if x != y:
                heapq.heappush(h, -(x - y))
        return -h[0] if h else 0


if __name__ == "__main__":
    sol = Solution()
    assert sol.lastStoneWeight([2, 7, 4, 1, 8, 1]) == 1
    assert sol.lastStoneWeight([1]) == 1
    assert sol.lastStoneWeight([2, 2]) == 0
    assert sol.lastStoneWeight([3, 7, 2]) == 2
    assert sol.lastStoneWeight([10]) == 10
    print("All tests passed!")
