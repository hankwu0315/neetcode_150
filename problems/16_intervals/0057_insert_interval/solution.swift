// 0057. Insert Interval
import Foundation
class Solution {
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        var res = [[Int]]()
        var i = 0; let n = intervals.count
        while i < n && intervals[i][1] < newInterval[0] { res.append(intervals[i]); i += 1 }
        var s = newInterval[0], e = newInterval[1]
        while i < n && intervals[i][0] <= e {
            s = min(s, intervals[i][0])
            e = max(e, intervals[i][1])
            i += 1
        }
        res.append([s, e])
        while i < n { res.append(intervals[i]); i += 1 }
        return res
    }
}
let sol = Solution()
if sol.insert([[1, 3], [6, 9]], [2, 5]) != [[1, 5], [6, 9]] { fatalError("a") }
if sol.insert([[1, 2], [3, 5], [6, 7], [8, 10], [12, 16]], [4, 8]) != [[1, 2], [3, 10], [12, 16]] { fatalError("b") }
if sol.insert([], [5, 7]) != [[5, 7]] { fatalError("c") }
if sol.insert([[1, 5]], [2, 3]) != [[1, 5]] { fatalError("d") }
if sol.insert([[1, 5]], [6, 8]) != [[1, 5], [6, 8]] { fatalError("e") }
if sol.insert([[1, 5]], [0, 0]) != [[0, 0], [1, 5]] { fatalError("f") }
print("All tests passed!")
