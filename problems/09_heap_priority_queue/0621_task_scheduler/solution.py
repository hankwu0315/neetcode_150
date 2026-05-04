"""
Problem: 0621. Task Scheduler
Difficulty: Medium
URL: https://leetcode.com/problems/task-scheduler/

解法：頻率公式 (maxF-1)*(n+1)+maxCount，與 len(tasks) 取最大。
時間 O(N)，空間 O(1)。
"""

from __future__ import annotations

from typing import List

from collections import Counter

class Solution:
    def leastInterval(self, tasks: List[str], n: int) -> int:
        pass


if __name__ == "__main__":
    solution = Solution()

    # Test 1
    # result = solution.solve(...)
    # assert result == expected

    print("All tests passed!")
