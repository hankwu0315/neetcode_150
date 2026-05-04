"""
Problem: 0435. Non-overlapping Intervals
"""
from typing import List


class Solution:
    def eraseOverlapIntervals(self, intervals: List[List[int]]) -> int:
        intervals.sort(key=lambda x: x[1])
        end = float('-inf')
        kept = 0
        for s, e in intervals:
            if s >= end:
                kept += 1
                end = e
        return len(intervals) - kept


if __name__ == "__main__":
    sol = Solution()
    assert sol.eraseOverlapIntervals([[1, 2], [2, 3], [3, 4], [1, 3]]) == 1
    assert sol.eraseOverlapIntervals([[1, 2], [1, 2], [1, 2]]) == 2
    assert sol.eraseOverlapIntervals([[1, 2], [2, 3]]) == 0
    assert sol.eraseOverlapIntervals([]) == 0
    assert sol.eraseOverlapIntervals([[1, 100], [11, 22], [1, 11], [2, 12]]) == 2
    print("All tests passed!")
