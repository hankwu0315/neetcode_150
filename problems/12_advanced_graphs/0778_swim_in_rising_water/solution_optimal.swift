// Problem: 0778. Swim in Rising Water
// Difficulty: Hard

import Foundation

struct MinHeap778 {
    private var a: [(Int, Int, Int)] = []
    var isEmpty: Bool { a.isEmpty }
    mutating func push(_ v: (Int, Int, Int)) { a.append(v); up(a.count - 1) }
    mutating func pop() -> (Int, Int, Int) {
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
    func swimInWater(_ grid: [[Int]]) -> Int {
        let n = grid.count
        var vis = Array(repeating: Array(repeating: false, count: n), count: n)
        var h = MinHeap778()
        h.push((grid[0][0], 0, 0))
        let dirs = [(1, 0), (-1, 0), (0, 1), (0, -1)]
        while !h.isEmpty {
            let (t, i, j) = h.pop()
            if i == n - 1 && j == n - 1 { return t }
            if vis[i][j] { continue }
            vis[i][j] = true
            for d in dirs {
                let ni = i + d.0, nj = j + d.1
                if ni >= 0 && ni < n && nj >= 0 && nj < n && !vis[ni][nj] {
                    h.push((max(t, grid[ni][nj]), ni, nj))
                }
            }
        }
        return -1
    }
}

func checkInt(_ a: Int, _ e: Int, _ msg: String) {
    if a != e { fatalError("FAIL \(msg): \(a) vs \(e)") }
}

let sol = Solution()
checkInt(sol.swimInWater([[0, 2], [1, 3]]), 3, "a")
checkInt(sol.swimInWater([
    [0, 1, 2, 3, 4],
    [24, 23, 22, 21, 5],
    [12, 13, 14, 15, 16],
    [11, 17, 18, 19, 20],
    [10, 9, 8, 7, 6],
]), 16, "b")
checkInt(sol.swimInWater([[0]]), 0, "c")
checkInt(sol.swimInWater([[0, 1], [2, 3]]), 3, "d")
checkInt(sol.swimInWater([[3, 2], [0, 1]]), 3, "e")
checkInt(sol.swimInWater([[10, 12], [20, 15]]), 15, "f")
print("All tests passed!")
