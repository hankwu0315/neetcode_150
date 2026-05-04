// 0048. Rotate Image
import Foundation
class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        let n = matrix.count
        for i in 0..<n {
            if i + 1 < n {
                for j in (i + 1)..<n {
                    let t = matrix[i][j]; matrix[i][j] = matrix[j][i]; matrix[j][i] = t
                }
            }
        }
        for i in 0..<n { matrix[i].reverse() }
    }
}
let sol = Solution()
var m1 = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
sol.rotate(&m1)
if m1 != [[7, 4, 1], [8, 5, 2], [9, 6, 3]] { fatalError("a") }
var m2 = [[5, 1, 9, 11], [2, 4, 8, 10], [13, 3, 6, 7], [15, 14, 12, 16]]
sol.rotate(&m2)
if m2 != [[15, 13, 2, 5], [14, 3, 4, 1], [12, 6, 8, 9], [16, 7, 10, 11]] { fatalError("b") }
var m3 = [[1]]
sol.rotate(&m3)
if m3 != [[1]] { fatalError("c") }
print("All tests passed!")
