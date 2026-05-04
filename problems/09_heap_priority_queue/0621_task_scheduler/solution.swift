// Problem: 0621. Task Scheduler
// Difficulty: Medium

import Foundation

class Solution {
    func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
        var cnt: [Character: Int] = [:]
        for t in tasks { cnt[t, default: 0] += 1 }
        let maxF = cnt.values.max() ?? 0
        let maxCount = cnt.values.filter { $0 == maxF }.count
        let formula = (maxF - 1) * (n + 1) + maxCount
        return max(tasks.count, formula)
    }
}

func checkInt(_ a: Int, _ e: Int, _ msg: String) {
    if a != e { fatalError("FAIL \(msg): \(a) vs \(e)") }
}

let sol = Solution()
checkInt(sol.leastInterval(["A", "A", "A", "B", "B", "B"], 2), 8, "ex1")
checkInt(sol.leastInterval(["A", "A", "A", "B", "B", "B"], 0), 6, "no cool")
checkInt(sol.leastInterval(["A", "A", "A", "A", "A", "A", "B", "C", "D", "E", "F", "G"], 2), 16, "big")
checkInt(sol.leastInterval(["A"], 2), 1, "one")
checkInt(sol.leastInterval(["A", "B", "C", "D"], 2), 4, "all unique")
checkInt(sol.leastInterval(["A", "A", "B", "B"], 2), 5, "mix")
print("All tests passed!")
