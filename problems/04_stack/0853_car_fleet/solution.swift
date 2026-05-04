// Problem: 0853. Car Fleet
// Difficulty: Medium
// URL: https://leetcode.com/problems/car-fleet/
//
// 最佳解：排序 + 一次掃描。

import Foundation

class Solution {
    func carFleet(_ target: Int, _ position: [Int], _ speed: [Int]) -> Int {
        let n = position.count
        var cars: [(pos: Int, sp: Int)] = []
        for i in 0..<n { cars.append((position[i], speed[i])) }
        cars.sort { $0.pos > $1.pos }

        var fleets = 0
        var maxTime = 0.0
        for c in cars {
            let t = Double(target - c.pos) / Double(c.sp)
            if t > maxTime {
                fleets += 1
                maxTime = t
            }
        }
        return fleets
    }
}

func checkInt(_ a: Int, _ e: Int, _ msg: String) {
    if a != e { fatalError("FAIL \(msg): \(a) vs \(e)") }
}

let sol = Solution()
checkInt(sol.carFleet(12, [10, 8, 0, 5, 3], [2, 4, 1, 1, 3]), 3, "ex1")
checkInt(sol.carFleet(10, [3], [3]), 1, "ex2")
checkInt(sol.carFleet(100, [0, 2, 4], [4, 2, 1]), 1, "ex3")
checkInt(sol.carFleet(10, [6, 8], [3, 2]), 2, "split")
checkInt(sol.carFleet(10, [0, 4, 2], [2, 1, 3]), 1, "merge")
checkInt(sol.carFleet(10, [0, 5], [1, 1]), 2, "two")
print("All tests passed!")
