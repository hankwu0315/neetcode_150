// 0435. Non-overlapping Intervals
import Foundation
class Solution {
    func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
        let a = intervals.sorted { $0[1] < $1[1] }
        var end = Int.min
        var kept = 0
        for iv in a {
            if iv[0] >= end { kept += 1; end = iv[1] }
        }
        return a.count - kept
    }
}
let sol = Solution()
if sol.eraseOverlapIntervals([[1, 2], [2, 3], [3, 4], [1, 3]]) != 1 { fatalError("a") }
if sol.eraseOverlapIntervals([[1, 2], [1, 2], [1, 2]]) != 2 { fatalError("b") }
if sol.eraseOverlapIntervals([[1, 2], [2, 3]]) != 0 { fatalError("c") }
if sol.eraseOverlapIntervals([]) != 0 { fatalError("d") }
if sol.eraseOverlapIntervals([[1, 100], [11, 22], [1, 11], [2, 12]]) != 2 { fatalError("e") }
print("All tests passed!")
