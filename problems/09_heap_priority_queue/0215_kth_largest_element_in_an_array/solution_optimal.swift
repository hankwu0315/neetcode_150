// Problem: 0215. Kth Largest Element in an Array
// Difficulty: Medium

import Foundation

struct MinHeap {
    var a: [Int] = []
    var count: Int { a.count }
    var top: Int { a[0] }
    mutating func push(_ x: Int) {
        a.append(x)
        var i = a.count - 1
        while i > 0 {
            let p = (i - 1) >> 1
            if a[p] <= a[i] { break }
            a.swapAt(p, i); i = p
        }
    }
    @discardableResult
    mutating func pop() -> Int {
        let t0 = a[0]
        let last = a.removeLast()
        if !a.isEmpty {
            a[0] = last
            var i = 0; let n = a.count
            while true {
                let l = 2 * i + 1, r = 2 * i + 2
                var m = i
                if l < n && a[l] < a[m] { m = l }
                if r < n && a[r] < a[m] { m = r }
                if m == i { break }
                a.swapAt(i, m); i = m
            }
        }
        return t0
    }
}

class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var h = MinHeap()
        for x in nums {
            if h.count < k { h.push(x) }
            else if x > h.top { _ = h.pop(); h.push(x) }
        }
        return h.top
    }
}

func checkInt(_ a: Int, _ e: Int, _ msg: String) {
    if a != e { fatalError("FAIL \(msg): \(a) vs \(e)") }
}

let sol = Solution()
checkInt(sol.findKthLargest([3, 2, 1, 5, 6, 4], 2), 5, "ex1")
checkInt(sol.findKthLargest([3, 2, 3, 1, 2, 4, 5, 5, 6], 4), 4, "ex2")
checkInt(sol.findKthLargest([1], 1), 1, "one")
checkInt(sol.findKthLargest([1, 2], 2), 1, "two")
checkInt(sol.findKthLargest([7, 7, 7], 2), 7, "dup")
checkInt(sol.findKthLargest([-1, -2, -3], 3), -3, "neg")
print("All tests passed!")
