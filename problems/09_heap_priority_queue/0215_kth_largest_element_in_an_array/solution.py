"""
Problem: 0215. Kth Largest Element in an Array
Difficulty: Medium
URL: https://leetcode.com/problems/kth-largest-element-in-an-array/

解法：大小 k 的 min-heap，O(n log k)/O(k)。
"""
from __future__ import annotations
from typing import List
import heapq


class Solution:
    def findKthLargest(self, nums: List[int], k: int) -> int:
        h: List[int] = []
        for x in nums:
            if len(h) < k:
                heapq.heappush(h, x)
            elif x > h[0]:
                heapq.heapreplace(h, x)
        return h[0]


if __name__ == "__main__":
    sol = Solution()
    assert sol.findKthLargest([3, 2, 1, 5, 6, 4], 2) == 5
    assert sol.findKthLargest([3, 2, 3, 1, 2, 4, 5, 5, 6], 4) == 4
    assert sol.findKthLargest([1], 1) == 1
    assert sol.findKthLargest([1, 2], 2) == 1
    assert sol.findKthLargest([7, 7, 7], 2) == 7
    assert sol.findKthLargest([-1, -2, -3], 3) == -3
    print("All tests passed!")
