// Problem: 1046. Last Stone Weight
// Difficulty: Easy

import Foundation

struct MaxHeap {
    var a: [Int] = []
    var count: Int { a.count }
    mutating func push(_ x: Int) {
        a.append(x)
        var i = a.count - 1
        while i > 0 {
            let p = (i - 1) >> 1
            if a[p] >= a[i] { break }
            a.swapAt(p, i); i = p
        }
    }
    @discardableResult
    mutating func pop() -> Int {
        let top = a[0]
        let last = a.removeLast()
        if !a.isEmpty {
            a[0] = last
            var i = 0; let n = a.count
            while true {
                let l = 2 * i + 1, r = 2 * i + 2
                var m = i
                if l < n && a[l] > a[m] { m = l }
                if r < n && a[r] > a[m] { m = r }
                if m == i { break }
                a.swapAt(i, m); i = m
            }
        }
        return top
    }
}

class Solution {
    func lastStoneWeight(_ stones: [Int]) -> Int {
        var h = MaxHeap()
        for s in stones { h.push(s) }
        while h.count > 1 {
            let x = h.pop()
            let y = h.pop()
            if x != y { h.push(x - y) }
        }
        return h.count == 0 ? 0 : h.a[0]
    }
}

func checkInt(_ a: Int, _ e: Int, _ msg: String) {
    if a != e { fatalError("FAIL \(msg): \(a) vs \(e)") }
}

let sol = Solution()
checkInt(sol.lastStoneWeight([2, 7, 4, 1, 8, 1]), 1, "ex1")
checkInt(sol.lastStoneWeight([1]), 1, "one")
checkInt(sol.lastStoneWeight([2, 2]), 0, "pair")
checkInt(sol.lastStoneWeight([3, 7, 2]), 2, "3,7,2")
checkInt(sol.lastStoneWeight([10]), 10, "10")
print("All tests passed!")
