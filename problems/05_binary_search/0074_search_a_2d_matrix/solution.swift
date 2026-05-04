// Problem: 0074. Search a 2D Matrix
// Difficulty: Medium

import Foundation

class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        if matrix.isEmpty || matrix[0].isEmpty { return false }
        let m = matrix.count, n = matrix[0].count
        var l = 0, r = m * n - 1
        while l <= r {
            let mid = l + (r - l) / 2
            let v = matrix[mid / n][mid % n]
            if v == target { return true }
            if v < target { l = mid + 1 } else { r = mid - 1 }
        }
        return false
    }
}

func checkBool(_ a: Bool, _ e: Bool, _ msg: String) {
    if a != e { fatalError("FAIL \(msg)") }
}

let sol = Solution()
let m = [[1, 3, 5, 7], [10, 11, 16, 20], [23, 30, 34, 60]]
checkBool(sol.searchMatrix(m, 3), true, "3")
checkBool(sol.searchMatrix(m, 13), false, "13")
checkBool(sol.searchMatrix(m, 1), true, "1")
checkBool(sol.searchMatrix(m, 60), true, "60")
checkBool(sol.searchMatrix(m, 0), false, "0")
checkBool(sol.searchMatrix(m, 100), false, "100")
checkBool(sol.searchMatrix([[5]], 5), true, "single hit")
checkBool(sol.searchMatrix([[5]], 3), false, "single miss")
print("All tests passed!")
