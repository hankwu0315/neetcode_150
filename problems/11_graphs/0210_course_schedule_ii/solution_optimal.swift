// Problem: 0210. Course Schedule II
// Difficulty: Medium

import Foundation

class Solution {
    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        var g = Array(repeating: [Int](), count: numCourses)
        var indeg = Array(repeating: 0, count: numCourses)
        for p in prerequisites {
            g[p[1]].append(p[0])
            indeg[p[0]] += 1
        }
        var q: [Int] = []
        for i in 0..<numCourses { if indeg[i] == 0 { q.append(i) } }
        var head = 0
        var order: [Int] = []
        while head < q.count {
            let u = q[head]; head += 1
            order.append(u)
            for v in g[u] {
                indeg[v] -= 1
                if indeg[v] == 0 { q.append(v) }
            }
        }
        return order.count == numCourses ? order : []
    }
}

func validOrder(_ order: [Int], _ n: Int, _ prereqs: [[Int]]) -> Bool {
    if order.count != n { return false }
    if Set(order) != Set(0..<n) { return false }
    var pos: [Int: Int] = [:]
    for (i, v) in order.enumerated() { pos[v] = i }
    for p in prereqs {
        if (pos[p[1]] ?? -1) > (pos[p[0]] ?? -1) { return false }
    }
    return true
}

let sol = Solution()
let p1 = [[1, 0]]; if !validOrder(sol.findOrder(2, p1), 2, p1) { fatalError("a") }
let p2 = [[1, 0], [2, 0], [3, 1], [3, 2]]
if !validOrder(sol.findOrder(4, p2), 4, p2) { fatalError("b") }
if !sol.findOrder(2, [[1, 0], [0, 1]]).isEmpty { fatalError("c") }
let p3: [[Int]] = []
if !validOrder(sol.findOrder(3, p3), 3, p3) { fatalError("d") }
let r5 = sol.findOrder(1, [])
if !(r5.count == 1 && r5[0] == 0) { fatalError("e") }
if !sol.findOrder(3, [[0, 1], [1, 2], [2, 0]]).isEmpty { fatalError("f") }
print("All tests passed!")
