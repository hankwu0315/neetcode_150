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
        cnt = Counter(tasks)
        maxF = max(cnt.values())
        maxCount = sum(1 for v in cnt.values() if v == maxF)
        return max(len(tasks), (maxF - 1) * (n + 1) + maxCount)


if __name__ == "__main__":
    sol = Solution()
    assert sol.leastInterval(["A", "A", "A", "B", "B", "B"], 2) == 8
    assert sol.leastInterval(["A", "A", "A", "B", "B", "B"], 0) == 6
    assert sol.leastInterval(["A", "A", "A", "A", "A", "A", "B", "C", "D", "E", "F", "G"], 2) == 16
    assert sol.leastInterval(["A"], 2) == 1
    assert sol.leastInterval(["A", "B", "C", "D"], 2) == 4
    assert sol.leastInterval(["A", "A", "B", "B"], 2) == 5
    print("All tests passed!")
