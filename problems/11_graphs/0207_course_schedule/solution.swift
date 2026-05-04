// Problem: 0207. Course Schedule
// Difficulty: Medium

import Foundation

class Solution {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var g = Array(repeating: [Int](), count: numCourses)
        var indeg = Array(repeating: 0, count: numCourses)
        for p in prerequisites {
            g[p[1]].append(p[0])
            indeg[p[0]] += 1
        }
        var q: [Int] = []
        for i in 0..<numCourses { if indeg[i] == 0 { q.append(i) } }
        var head = 0, done = 0
        while head < q.count {
            let u = q[head]; head += 1
            done += 1
            for v in g[u] {
                indeg[v] -= 1
                if indeg[v] == 0 { q.append(v) }
            }
        }
        return done == numCourses
    }
}

func checkBool(_ a: Bool, _ e: Bool, _ msg: String) {
    if a != e { fatalError("FAIL \(msg)") }
}

let sol = Solution()
checkBool(sol.canFinish(2, [[1, 0]]), true, "a")
checkBool(sol.canFinish(2, [[1, 0], [0, 1]]), false, "b")
checkBool(sol.canFinish(1, []), true, "c")
checkBool(sol.canFinish(4, [[1, 0], [2, 1], [3, 2]]), true, "d")
checkBool(sol.canFinish(3, [[0, 1], [1, 2], [2, 0]]), false, "e")
checkBool(sol.canFinish(5, []), true, "f")
print("All tests passed!")
