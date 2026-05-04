// 1851. Minimum Interval to Include Each Query
import Foundation
struct MinHeap {
    var a: [(Int, Int)] = []
    var isEmpty: Bool { a.isEmpty }
    func peek() -> (Int, Int) { a[0] }
    mutating func push(_ v: (Int, Int)) {
        a.append(v); var i = a.count - 1
        while i > 0 {
            let p = (i - 1) >> 1
            if a[p].0 > a[i].0 { a.swapAt(p, i); i = p } else { break }
        }
    }
    @discardableResult
    mutating func pop() -> (Int, Int) {
        let r = a[0]; let last = a.removeLast()
        if !a.isEmpty {
            a[0] = last; var i = 0; let n = a.count
            while true {
                var l = 2 * i + 1, ri = 2 * i + 2, s = i
                if l < n && a[l].0 < a[s].0 { s = l }
                if ri < n && a[ri].0 < a[s].0 { s = ri }
                if s == i { break }
                a.swapAt(s, i); i = s
            }
        }
        return r
    }
}
class Solution {
    func minInterval(_ intervals: [[Int]], _ queries: [Int]) -> [Int] {
        let a = intervals.sorted { $0[0] < $1[0] }
        let order = (0..<queries.count).sorted { queries[$0] < queries[$1] }
        var res = Array(repeating: -1, count: queries.count)
        var heap = MinHeap()
        var i = 0
        for idx in order {
            let q = queries[idx]
            while i < a.count && a[i][0] <= q {
                heap.push((a[i][1] - a[i][0] + 1, a[i][1]))
                i += 1
            }
            while !heap.isEmpty && heap.peek().1 < q { heap.pop() }
            if !heap.isEmpty { res[idx] = heap.peek().0 }
        }
        return res
    }
}
let sol = Solution()
if sol.minInterval([[1, 4], [2, 4], [3, 6], [4, 4]], [2, 3, 4, 5]) != [3, 3, 1, 4] { fatalError("a") }
if sol.minInterval([[2, 3], [2, 5], [1, 8], [20, 25]], [2, 19, 5, 22]) != [2, -1, 4, 6] { fatalError("b") }
if sol.minInterval([[1, 4]], [1, 4, 5]) != [4, 4, -1] { fatalError("c") }
if sol.minInterval([], [1, 2]) != [-1, -1] { fatalError("d") }
if sol.minInterval([[1, 10]], [0, 5, 11]) != [-1, 10, -1] { fatalError("e") }
print("All tests passed!")
