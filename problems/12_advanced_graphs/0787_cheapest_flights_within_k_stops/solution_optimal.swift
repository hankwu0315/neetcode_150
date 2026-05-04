// Problem: 0787. Cheapest Flights Within K Stops
// Difficulty: Medium

import Foundation

class Solution {
    func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ k: Int) -> Int {
        var dist = Array(repeating: Int.max, count: n)
        dist[src] = 0
        for _ in 0...k {
            var nd = dist
            for f in flights {
                if dist[f[0]] != Int.max && dist[f[0]] + f[2] < nd[f[1]] {
                    nd[f[1]] = dist[f[0]] + f[2]
                }
            }
            dist = nd
        }
        return dist[dst] == Int.max ? -1 : dist[dst]
    }
}

func checkInt(_ a: Int, _ e: Int, _ msg: String) {
    if a != e { fatalError("FAIL \(msg): \(a) vs \(e)") }
}

let sol = Solution()
checkInt(sol.findCheapestPrice(
    4, [[0, 1, 100], [1, 2, 100], [2, 0, 100], [1, 3, 600], [2, 3, 200]],
    0, 3, 1), 700, "a")
checkInt(sol.findCheapestPrice(
    3, [[0, 1, 100], [1, 2, 100], [0, 2, 500]], 0, 2, 1), 200, "b")
checkInt(sol.findCheapestPrice(
    3, [[0, 1, 100], [1, 2, 100], [0, 2, 500]], 0, 2, 0), 500, "c")
checkInt(sol.findCheapestPrice(2, [[0, 1, 100]], 0, 1, 1), 100, "d")
checkInt(sol.findCheapestPrice(2, [], 0, 1, 1), -1, "e")
checkInt(sol.findCheapestPrice(3, [[0, 1, 1], [1, 2, 1]], 0, 2, 0), -1, "f")
print("All tests passed!")
