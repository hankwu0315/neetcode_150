// 0134. Gas Station
import Foundation
class Solution {
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        if gas.reduce(0, +) < cost.reduce(0, +) { return -1 }
        var start = 0, tank = 0
        for i in 0..<gas.count {
            tank += gas[i] - cost[i]
            if tank < 0 { start = i + 1; tank = 0 }
        }
        return start
    }
}
let sol = Solution()
if sol.canCompleteCircuit([1, 2, 3, 4, 5], [3, 4, 5, 1, 2]) != 3 { fatalError("a") }
if sol.canCompleteCircuit([2, 3, 4], [3, 4, 3]) != -1 { fatalError("b") }
if sol.canCompleteCircuit([5], [4]) != 0 { fatalError("c") }
if sol.canCompleteCircuit([5], [6]) != -1 { fatalError("d") }
if sol.canCompleteCircuit([4, 5, 2, 6, 5, 3], [3, 2, 7, 3, 2, 9]) != -1 { fatalError("e") }
print("All tests passed!")
