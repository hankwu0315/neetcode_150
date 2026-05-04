// 0253. Meeting Rooms II
import Foundation
class Solution {
    func minMeetingRooms(_ intervals: [[Int]]) -> Int {
        if intervals.isEmpty { return 0 }
        let starts = intervals.map { $0[0] }.sorted()
        let ends = intervals.map { $0[1] }.sorted()
        var rooms = 0, used = 0, j = 0
        for s in starts {
            if s < ends[j] {
                used += 1
                if used > rooms { rooms = used }
            } else {
                j += 1
            }
        }
        return rooms
    }
}
let sol = Solution()
if sol.minMeetingRooms([[0, 30], [5, 10], [15, 20]]) != 2 { fatalError("a") }
if sol.minMeetingRooms([[7, 10], [2, 4]]) != 1 { fatalError("b") }
if sol.minMeetingRooms([]) != 0 { fatalError("c") }
if sol.minMeetingRooms([[1, 10], [2, 7], [3, 19], [8, 12], [10, 20], [11, 30]]) != 4 { fatalError("d") }
if sol.minMeetingRooms([[1, 5], [5, 10]]) != 1 { fatalError("e") }
print("All tests passed!")
