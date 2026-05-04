// Problem: 0703. Kth Largest Element in a Stream
// Difficulty: Easy

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
        let top = a[0]
        let last = a.removeLast()
        if !a.isEmpty {
            a[0] = last
            var i = 0
            let n = a.count
            while true {
                let l = 2 * i + 1, r = 2 * i + 2
                var m = i
                if l < n && a[l] < a[m] { m = l }
                if r < n && a[r] < a[m] { m = r }
                if m == i { break }
                a.swapAt(i, m); i = m
            }
        }
        return top
    }
}

class KthLargest {
    let k: Int
    var h = MinHeap()
    init(_ k: Int, _ nums: [Int]) {
        self.k = k
        for n in nums { _ = add(n) }
    }
    func add(_ val: Int) -> Int {
        if h.count < k { h.push(val) }
        else if val > h.top { _ = h.pop(); h.push(val) }
        return h.top
    }
}

func checkInt(_ a: Int, _ e: Int, _ msg: String) {
    if a != e { fatalError("FAIL \(msg): \(a) vs \(e)") }
}

let kl = KthLargest(3, [4, 5, 8, 2])
checkInt(kl.add(3), 4, "3")
checkInt(kl.add(5), 5, "5")
checkInt(kl.add(10), 5, "10")
checkInt(kl.add(9), 8, "9")
checkInt(kl.add(4), 8, "4")
print("All tests passed!")
