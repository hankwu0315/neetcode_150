// Problem: 0743. Network Delay Time
// Difficulty: Medium

import Foundation

struct MinHeap743 {
    private var a: [(Int, Int)] = []
    var isEmpty: Bool { a.isEmpty }
    mutating func push(_ v: (Int, Int)) { a.append(v); siftUp(a.count - 1) }
    mutating func pop() -> (Int, Int) {
        let top = a[0]
        let last = a.removeLast()
        if !a.isEmpty { a[0] = last; siftDown(0) }
        return top
    }
    private mutating func siftUp(_ i: Int) {
        var i = i
        while i > 0 {
            let p = (i - 1) >> 1
            if a[p].0 <= a[i].0 { break }
            a.swapAt(i, p); i = p
        }
    }
    private mutating func siftDown(_ i: Int) {
        var i = i
        let n = a.count
        while true {
            let l = 2*i + 1, r = 2*i + 2
            var s = i
            if l < n && a[l].0 < a[s].0 { s = l }
            if r < n && a[r].0 < a[s].0 { s = r }
            if s == i { break }
            a.swapAt(i, s); i = s
        }
    }
}

class Solution {
    func networkDelayTime(_ times: [[Int]], _ n: Int, _ k: Int) -> Int {
        var g = Array(repeating: [(Int, Int)](), count: n + 1)
        for t in times { g[t[0]].append((t[1], t[2])) }
        var dist = Array(repeating: Int.max, count: n + 1)
        dist[k] = 0
        var h = MinHeap743()
        h.push((0, k))
        while !h.isEmpty {
            let (d, u) = h.pop()
            if d > dist[u] { continue }
            for e in g[u] {
                let nd = d + e.1
                if nd < dist[e.0] { dist[e.0] = nd; h.push((nd, e.0)) }
            }
        }
        var ans = 0
        for i in 1...n { if dist[i] > ans { ans = dist[i] } }
        return ans == Int.max ? -1 : ans
    }
}

func checkInt(_ a: Int, _ e: Int, _ msg: String) {
    if a != e { fatalError("FAIL \(msg): \(a) vs \(e)") }
}

let sol = Solution()
checkInt(sol.networkDelayTime([[2, 1, 1], [2, 3, 1], [3, 4, 1]], 4, 2), 2, "a")
checkInt(sol.networkDelayTime([[1, 2, 1]], 2, 1), 1, "b")
checkInt(sol.networkDelayTime([[1, 2, 1]], 2, 2), -1, "c")
checkInt(sol.networkDelayTime([[1, 2, 1], [2, 1, 3]], 2, 2), 3, "d")
checkInt(sol.networkDelayTime([[1, 2, 1], [2, 3, 2], [1, 3, 4]], 3, 1), 3, "e")
checkInt(sol.networkDelayTime([], 1, 1), 0, "f")
print("All tests passed!")
