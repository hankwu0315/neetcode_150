// 0054. Spiral Matrix
import Foundation
class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        var res = [Int]()
        if matrix.isEmpty || matrix[0].isEmpty { return res }
        var top = 0, bottom = matrix.count - 1, left = 0, right = matrix[0].count - 1
        while top <= bottom && left <= right {
            for j in left...right { res.append(matrix[top][j]) }
            top += 1
            if top <= bottom {
                for i in top...bottom { res.append(matrix[i][right]) }
            }
            right -= 1
            if top <= bottom && left <= right {
                var j = right
                while j >= left { res.append(matrix[bottom][j]); j -= 1 }
                bottom -= 1
            }
            if left <= right && top <= bottom {
                var i = bottom
                while i >= top { res.append(matrix[i][left]); i -= 1 }
                left += 1
            }
        }
        return res
    }
}
let sol = Solution()
if sol.spiralOrder([[1, 2, 3], [4, 5, 6], [7, 8, 9]]) != [1, 2, 3, 6, 9, 8, 7, 4, 5] { fatalError("a") }
if sol.spiralOrder([[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12]]) != [1, 2, 3, 4, 8, 12, 11, 10, 9, 5, 6, 7] { fatalError("b") }
if sol.spiralOrder([[1]]) != [1] { fatalError("c") }
if sol.spiralOrder([[1, 2], [3, 4]]) != [1, 2, 4, 3] { fatalError("d") }
if sol.spiralOrder([[1], [2], [3]]) != [1, 2, 3] { fatalError("e") }
print("All tests passed!")
