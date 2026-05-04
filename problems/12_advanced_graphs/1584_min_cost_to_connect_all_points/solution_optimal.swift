// Problem: 1584. Min Cost to Connect All Points
// Difficulty: Medium

import Foundation

struct MinHeap1584 {
    private var a: [(Int, Int)] = []
    var isEmpty: Bool { a.isEmpty }
    mutating func push(_ v: (Int, Int)) { a.append(v); up(a.count - 1) }
    mutating func pop() -> (Int, Int) {
        let t = a[0]; let last = a.removeLast()
        if !a.isEmpty { a[0] = last; down(0) }
        return t
    }
    private mutating func up(_ i: Int) {
        var i = i
        while i > 0 {
            let p = (i - 1) >> 1
            if a[p].0 <= a[i].0 { break }
            a.swapAt(i, p); i = p
        }
    }
    private mutating func down(_ i: Int) {
        var i = i; let n = a.count
        while true {
            let l = 2*i+1, r = 2*i+2
            var s = i
            if l < n && a[l].0 < a[s].0 { s = l }
            if r < n && a[r].0 < a[s].0 { s = r }
            if s == i { break }
            a.swapAt(i, s); i = s
        }
    }
}

class Solution {
    func minCostConnectPoints(_ points: [[Int]]) -> Int {
        let n = points.count
        if n <= 1 { return 0 }
        var inMst = Array(repeating: false, count: n)
        var h = MinHeap1584()
        h.push((0, 0))
        var total = 0, seen = 0
        while !h.isEmpty && seen < n {
            let (d, u) = h.pop()
            if inMst[u] { continue }
            inMst[u] = true; total += d; seen += 1
            for v in 0..<n where !inMst[v] {
                let nd = abs(points[u][0] - points[v][0]) +
                         abs(points[u][1] - points[v][1])
                h.push((nd, v))
            }
        }
        return total
    }
}

func checkInt(_ a: Int, _ e: Int, _ msg: String) {
    if a != e { fatalError("FAIL \(msg): \(a) vs \(e)") }
}

let sol = Solution()
checkInt(sol.minCostConnectPoints([[0, 0], [2, 2], [3, 10], [5, 2], [7, 0]]), 20, "a")
checkInt(sol.minCostConnectPoints([[3, 12], [-2, 5], [-4, 1]]), 18, "b")
checkInt(sol.minCostConnectPoints([[0, 0]]), 0, "c")
checkInt(sol.minCostConnectPoints([[0, 0], [1, 1]]), 2, "d")
checkInt(sol.minCostConnectPoints([[2, -3], [-17, -8], [13, 8], [-17, -15]]), 53, "e")
checkInt(sol.minCostConnectPoints([]), 0, "f")
print("All tests passed!")
