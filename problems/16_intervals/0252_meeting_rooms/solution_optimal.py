"""
Problem: 0252. Meeting Rooms
"""
from typing import List


class Solution:
    def canAttendMeetings(self, intervals: List[List[int]]) -> bool:
        intervals.sort()
        for i in range(1, len(intervals)):
            if intervals[i][0] < intervals[i - 1][1]:
                return False
        return True


if __name__ == "__main__":
    sol = Solution()
    assert sol.canAttendMeetings([[0, 30], [5, 10], [15, 20]]) is False
    assert sol.canAttendMeetings([[7, 10], [2, 4]]) is True
    assert sol.canAttendMeetings([]) is True
    assert sol.canAttendMeetings([[1, 5]]) is True
    assert sol.canAttendMeetings([[1, 5], [5, 10]]) is True
    assert sol.canAttendMeetings([[1, 5], [4, 10]]) is False
    print("All tests passed!")
