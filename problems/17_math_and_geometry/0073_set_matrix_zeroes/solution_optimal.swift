// 0073. Set Matrix Zeroes
import Foundation
class Solution {
    func setZeroes(_ matrix: inout [[Int]]) {
        let m = matrix.count, n = matrix[0].count
        var firstRow = false, firstCol = false
        for j in 0..<n { if matrix[0][j] == 0 { firstRow = true } }
        for i in 0..<m { if matrix[i][0] == 0 { firstCol = true } }
        if m > 1 && n > 1 {
            for i in 1..<m {
                for j in 1..<n {
                    if matrix[i][j] == 0 { matrix[i][0] = 0; matrix[0][j] = 0 }
                }
            }
            for i in 1..<m {
                for j in 1..<n {
                    if matrix[i][0] == 0 || matrix[0][j] == 0 { matrix[i][j] = 0 }
                }
            }
        }
        if firstRow { for j in 0..<n { matrix[0][j] = 0 } }
        if firstCol { for i in 0..<m { matrix[i][0] = 0 } }
    }
}
let sol = Solution()
var m1 = [[1, 1, 1], [1, 0, 1], [1, 1, 1]]
sol.setZeroes(&m1)
if m1 != [[1, 0, 1], [0, 0, 0], [1, 0, 1]] { fatalError("a") }
var m2 = [[0, 1, 2, 0], [3, 4, 5, 2], [1, 3, 1, 5]]
sol.setZeroes(&m2)
if m2 != [[0, 0, 0, 0], [0, 4, 5, 0], [0, 3, 1, 0]] { fatalError("b") }
var m3 = [[1]]
sol.setZeroes(&m3)
if m3 != [[1]] { fatalError("c") }
print("All tests passed!")
