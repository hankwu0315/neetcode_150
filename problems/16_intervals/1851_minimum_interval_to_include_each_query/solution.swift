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
        // TODO: implement
        return []
    }
}

// MARK: - Tests
// let s = Solution()

// Test 1
// let result = s.solve(...)

print("All tests passed!")
