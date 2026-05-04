// Problem: 0295. Find Median from Data Stream
// Difficulty: Hard

import Foundation

struct MaxHeapMF {
    var a: [Int] = []
    var count: Int { a.count }
    var top: Int { a[0] }
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
        let t0 = a[0]; let last = a.removeLast()
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
        return t0
    }
}

struct MinHeapMF {
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
        let t0 = a[0]; let last = a.removeLast()
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

class MedianFinder {
    var lo = MaxHeapMF()
    var hi = MinHeapMF()
    init() {}

    func addNum(_ num: Int) {
        lo.push(num)
        hi.push(lo.pop())
        if hi.count > lo.count { lo.push(hi.pop()) }
    }

    func findMedian() -> Double {
        if lo.count > hi.count { return Double(lo.top) }
        return Double(lo.top + hi.top) / 2.0
    }
}

func checkD(_ a: Double, _ e: Double, _ msg: String) {
    if abs(a - e) > 1e-9 { fatalError("FAIL \(msg): \(a) vs \(e)") }
}

let mf = MedianFinder()
mf.addNum(1); mf.addNum(2)
checkD(mf.findMedian(), 1.5, "a")
mf.addNum(3)
checkD(mf.findMedian(), 2.0, "b")
let mf2 = MedianFinder()
for x in [-1, -2, -3, -4, -5] { mf2.addNum(x) }
checkD(mf2.findMedian(), -3.0, "c")
let mf3 = MedianFinder()
mf3.addNum(6); checkD(mf3.findMedian(), 6.0, "d1")
mf3.addNum(10); checkD(mf3.findMedian(), 8.0, "d2")
mf3.addNum(2); mf3.addNum(6)
checkD(mf3.findMedian(), 6.0, "d3")
mf3.addNum(5); mf3.addNum(0)
checkD(mf3.findMedian(), 5.5, "d4")
print("All tests passed!")
