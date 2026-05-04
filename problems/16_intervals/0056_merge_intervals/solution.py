"""
Problem: 0056. Merge Intervals
"""
from typing import List


class Solution:
    def merge(self, intervals: List[List[int]]) -> List[List[int]]:
        intervals.sort()
        res = []
        for s, e in intervals:
            if res and s <= res[-1][1]:
                if e > res[-1][1]:
                    res[-1][1] = e
            else:
                res.append([s, e])
        return res


if __name__ == "__main__":
    sol = Solution()
    assert sol.merge([[1, 3], [2, 6], [8, 10], [15, 18]]) == [[1, 6], [8, 10], [15, 18]]
    assert sol.merge([[1, 4], [4, 5]]) == [[1, 5]]
    assert sol.merge([[1, 4]]) == [[1, 4]]
    assert sol.merge([[1, 4], [0, 4]]) == [[0, 4]]
    assert sol.merge([[1, 4], [2, 3]]) == [[1, 4]]
    print("All tests passed!")
