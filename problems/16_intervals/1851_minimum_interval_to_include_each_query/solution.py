"""
Problem: 1851. Minimum Interval to Include Each Query
"""
from typing import List
import heapq


class Solution:
    def minInterval(self, intervals: List[List[int]], queries: List[int]) -> List[int]:
        intervals.sort()
        order = sorted(range(len(queries)), key=lambda i: queries[i])
        res = [-1] * len(queries)
        heap = []
        i = 0
        for idx in order:
            q = queries[idx]
            while i < len(intervals) and intervals[i][0] <= q:
                l, r = intervals[i]
                heapq.heappush(heap, (r - l + 1, r))
                i += 1
            while heap and heap[0][1] < q:
                heapq.heappop(heap)
            if heap:
                res[idx] = heap[0][0]
        return res


if __name__ == "__main__":
    sol = Solution()
    assert sol.minInterval([[1, 4], [2, 4], [3, 6], [4, 4]], [2, 3, 4, 5]) == [3, 3, 1, 4]
    assert sol.minInterval([[2, 3], [2, 5], [1, 8], [20, 25]], [2, 19, 5, 22]) == [2, -1, 4, 6]
    assert sol.minInterval([[1, 4]], [1, 4, 5]) == [4, 4, -1]
    assert sol.minInterval([], [1, 2]) == [-1, -1]
    assert sol.minInterval([[1, 10]], [0, 5, 11]) == [-1, 10, -1]
    print("All tests passed!")
