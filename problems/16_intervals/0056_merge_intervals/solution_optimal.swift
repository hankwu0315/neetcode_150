// 0056. Merge Intervals
import Foundation
class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        let a = intervals.sorted { $0[0] < $1[0] }
        var res = [[Int]]()
        for iv in a {
            if !res.isEmpty && iv[0] <= res[res.count - 1][1] {
                if iv[1] > res[res.count - 1][1] { res[res.count - 1][1] = iv[1] }
            } else {
                res.append([iv[0], iv[1]])
            }
        }
        return res
    }
}
let sol = Solution()
if sol.merge([[1, 3], [2, 6], [8, 10], [15, 18]]) != [[1, 6], [8, 10], [15, 18]] { fatalError("a") }
if sol.merge([[1, 4], [4, 5]]) != [[1, 5]] { fatalError("b") }
if sol.merge([[1, 4]]) != [[1, 4]] { fatalError("c") }
if sol.merge([[1, 4], [0, 4]]) != [[0, 4]] { fatalError("d") }
if sol.merge([[1, 4], [2, 3]]) != [[1, 4]] { fatalError("e") }
print("All tests passed!")
