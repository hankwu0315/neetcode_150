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
        pass


if __name__ == "__main__":
    solution = Solution()

    # Test 1
    # result = solution.solve(...)
    # assert result == expected

    print("All tests passed!")
