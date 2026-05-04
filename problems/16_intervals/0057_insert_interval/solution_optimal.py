"""
Problem: 0057. Insert Interval
"""
from typing import List


class Solution:
    def insert(self, intervals: List[List[int]], newInterval: List[int]) -> List[List[int]]:
        res = []
        i, n = 0, len(intervals)
        while i < n and intervals[i][1] < newInterval[0]:
            res.append(intervals[i]); i += 1
        s, e = newInterval
        while i < n and intervals[i][0] <= e:
            s = min(s, intervals[i][0])
            e = max(e, intervals[i][1])
            i += 1
        res.append([s, e])
        while i < n:
            res.append(intervals[i]); i += 1
        return res


if __name__ == "__main__":
    sol = Solution()
    assert sol.insert([[1, 3], [6, 9]], [2, 5]) == [[1, 5], [6, 9]]
    assert sol.insert([[1, 2], [3, 5], [6, 7], [8, 10], [12, 16]], [4, 8]) == [[1, 2], [3, 10], [12, 16]]
    assert sol.insert([], [5, 7]) == [[5, 7]]
    assert sol.insert([[1, 5]], [2, 3]) == [[1, 5]]
    assert sol.insert([[1, 5]], [6, 8]) == [[1, 5], [6, 8]]
    assert sol.insert([[1, 5]], [0, 0]) == [[0, 0], [1, 5]]
    print("All tests passed!")
