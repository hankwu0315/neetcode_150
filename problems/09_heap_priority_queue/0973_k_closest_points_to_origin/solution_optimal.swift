// Problem: 0973. K Closest Points to Origin
// Difficulty: Medium

import Foundation

struct PQEntry {
    let d: Int; let x: Int; let y: Int
}

struct PQ {
    var a: [PQEntry] = []
    var count: Int { a.count }
    mutating func push(_ e: PQEntry) {
        a.append(e)
        var i = a.count - 1
        while i > 0 {
            let p = (i - 1) >> 1
            if a[p].d >= a[i].d { break }
            a.swapAt(p, i); i = p
        }
    }
    @discardableResult
    mutating func pop() -> PQEntry {
        let top = a[0]
        let last = a.removeLast()
        if !a.isEmpty {
            a[0] = last
            var i = 0; let n = a.count
            while true {
                let l = 2 * i + 1, r = 2 * i + 2
                var m = i
                if l < n && a[l].d > a[m].d { m = l }
                if r < n && a[r].d > a[m].d { m = r }
                if m == i { break }
                a.swapAt(i, m); i = m
            }
        }
        return top
    }
}

class Solution {
    func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
        var h = PQ()
        for p in points {
            let d = p[0] * p[0] + p[1] * p[1]
            if h.count < k { h.push(PQEntry(d: d, x: p[0], y: p[1])) }
            else if d < h.a[0].d {
                _ = h.pop(); h.push(PQEntry(d: d, x: p[0], y: p[1]))
            }
        }
        return h.a.map { [$0.x, $0.y] }
    }
}

func norm(_ a: [[Int]]) -> [[Int]] {
    a.sorted { ($0[0], $0[1]) < ($1[0], $1[1]) }
}

func checkArr(_ a: [[Int]], _ e: [[Int]], _ msg: String) {
    let an = norm(a), en = norm(e)
    if an.count != en.count { fatalError("FAIL \(msg): \(an) vs \(en)") }
    for i in 0..<an.count {
        if an[i] != en[i] { fatalError("FAIL \(msg): \(an) vs \(en)") }
    }
}

let sol = Solution()
checkArr(sol.kClosest([[1, 3], [-2, 2]], 1), [[-2, 2]], "ex1")
checkArr(sol.kClosest([[3, 3], [5, -1], [-2, 4]], 2), [[3, 3], [-2, 4]], "ex2")
checkArr(sol.kClosest([[1, 1]], 1), [[1, 1]], "ex3")
checkArr(sol.kClosest([[0, 1], [1, 0]], 2), [[0, 1], [1, 0]], "ex4")
checkArr(sol.kClosest([[2, 2], [2, 2], [3, 3]], 2), [[2, 2], [2, 2]], "ex5")
print("All tests passed!")
