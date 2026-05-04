// Problem: 0739. Daily Temperatures
// Difficulty: Medium
// URL: https://leetcode.com/problems/daily-temperatures/
//
// 最佳解：單調遞減堆疊。

import Foundation

class Solution {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        let n = temperatures.count
        var ans = Array(repeating: 0, count: n)
        var stack: [Int] = []
        for i in 0..<n {
            while let top = stack.last, temperatures[top] < temperatures[i] {
                stack.removeLast()
                ans[top] = i - top
            }
            stack.append(i)
        }
        return ans
    }

    func dailyTemperatures_brute(_ temperatures: [Int]) -> [Int] {
        let n = temperatures.count
        var ans = Array(repeating: 0, count: n)
        for i in 0..<n {
            for j in (i + 1)..<n {
                if temperatures[j] > temperatures[i] {
                    ans[i] = j - i
                    break
                }
            }
        }
        return ans
    }
}

func checkArr(_ a: [Int], _ e: [Int], _ msg: String) {
    if a != e { fatalError("FAIL \(msg): \(a) vs \(e)") }
}

let sol = Solution()
for fn in [sol.dailyTemperatures, sol.dailyTemperatures_brute] {
    checkArr(fn([73, 74, 75, 71, 69, 72, 76, 73]), [1, 1, 4, 2, 1, 1, 0, 0], "ex1")
    checkArr(fn([30, 40, 50, 60]), [1, 1, 1, 0], "ex2")
    checkArr(fn([30, 60, 90]), [1, 1, 0], "ex3")
    checkArr(fn([90, 80, 70]), [0, 0, 0], "desc")
    checkArr(fn([50]), [0], "single")
    checkArr(fn([55, 55, 55, 60]), [3, 2, 1, 0], "dup")
}
print("All tests passed!")
