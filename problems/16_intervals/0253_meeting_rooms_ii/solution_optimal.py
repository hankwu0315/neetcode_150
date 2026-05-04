"""
Problem: 0253. Meeting Rooms II
"""
from typing import List


class Solution:
    def minMeetingRooms(self, intervals: List[List[int]]) -> int:
        if not intervals:
            return 0
        starts = sorted(x[0] for x in intervals)
        ends = sorted(x[1] for x in intervals)
        rooms = used = j = 0
        for s in starts:
            if s < ends[j]:
                used += 1
                if used > rooms:
                    rooms = used
            else:
                j += 1
        return rooms


if __name__ == "__main__":
    sol = Solution()
    assert sol.minMeetingRooms([[0, 30], [5, 10], [15, 20]]) == 2
    assert sol.minMeetingRooms([[7, 10], [2, 4]]) == 1
    assert sol.minMeetingRooms([]) == 0
    assert sol.minMeetingRooms([[1, 10], [2, 7], [3, 19], [8, 12], [10, 20], [11, 30]]) == 4
    assert sol.minMeetingRooms([[1, 5], [5, 10]]) == 1
    print("All tests passed!")
