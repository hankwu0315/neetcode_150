// 1899. Merge Triplets to Form Target Triplet
import Foundation
class Solution {
    func mergeTriplets(_ triplets: [[Int]], _ target: [Int]) -> Bool {
        var g = [0, 0, 0]
        for t in triplets {
            if t[0] > target[0] || t[1] > target[1] || t[2] > target[2] { continue }
            for i in 0..<3 { if t[i] > g[i] { g[i] = t[i] } }
        }
        return g == target
    }
}
let sol = Solution()
if sol.mergeTriplets([[2, 5, 3], [1, 8, 4], [1, 7, 5]], [2, 7, 5]) != true { fatalError("a") }
if sol.mergeTriplets([[3, 4, 5], [4, 5, 6]], [3, 2, 5]) != false { fatalError("b") }
if sol.mergeTriplets([[2, 5, 3], [2, 3, 4], [1, 2, 5], [5, 2, 3]], [5, 5, 5]) != true { fatalError("c") }
if sol.mergeTriplets([[1, 1, 1]], [2, 2, 2]) != false { fatalError("d") }
if sol.mergeTriplets([[2, 5, 3]], [2, 5, 3]) != true { fatalError("e") }
print("All tests passed!")
