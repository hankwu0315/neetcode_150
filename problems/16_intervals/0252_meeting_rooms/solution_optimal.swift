// 0252. Meeting Rooms
import Foundation
class Solution {
    func canAttendMeetings(_ intervals: [[Int]]) -> Bool {
        let a = intervals.sorted { $0[0] < $1[0] }
        if a.count <= 1 { return true }
        for i in 1..<a.count {
            if a[i][0] < a[i - 1][1] { return false }
        }
        return true
    }
}
let sol = Solution()
if sol.canAttendMeetings([[0, 30], [5, 10], [15, 20]]) != false { fatalError("a") }
if sol.canAttendMeetings([[7, 10], [2, 4]]) != true { fatalError("b") }
if sol.canAttendMeetings([]) != true { fatalError("c") }
if sol.canAttendMeetings([[1, 5]]) != true { fatalError("d") }
if sol.canAttendMeetings([[1, 5], [5, 10]]) != true { fatalError("e") }
if sol.canAttendMeetings([[1, 5], [4, 10]]) != false { fatalError("f") }
print("All tests passed!")
