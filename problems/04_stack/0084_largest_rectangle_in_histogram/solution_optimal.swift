// Problem: 0084. Largest Rectangle in Histogram
// Difficulty: Hard
// URL: https://leetcode.com/problems/largest-rectangle-in-histogram/
//
// 最佳解：單調遞增堆疊 + sentinel。

import Foundation

class Solution {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        var stack: [Int] = []
        let n = heights.count
        var best = 0
        for i in 0...n {
            let cur = (i == n) ? 0 : heights[i]
            while let top = stack.last, heights[top] > cur {
                stack.removeLast()
                let h = heights[top]
                let w = stack.isEmpty ? i : i - stack.last! - 1
                if h * w > best { best = h * w }
            }
            stack.append(i)
        }
        return best
    }

    func largestRectangleArea_brute(_ heights: [Int]) -> Int {
        let n = heights.count
        var best = 0
        for i in 0..<n {
            let h = heights[i]
            var l = i, r = i
            while l > 0 && heights[l - 1] >= h { l -= 1 }
            while r < n - 1 && heights[r + 1] >= h { r += 1 }
            best = max(best, h * (r - l + 1))
        }
        return best
    }
}

func checkInt(_ a: Int, _ e: Int, _ msg: String) {
    if a != e { fatalError("FAIL \(msg): \(a) vs \(e)") }
}

let sol = Solution()
for fn in [sol.largestRectangleArea, sol.largestRectangleArea_brute] {
    checkInt(fn([2, 1, 5, 6, 2, 3]), 10, "ex1")
    checkInt(fn([2, 4]), 4, "ex2")
    checkInt(fn([1]), 1, "single")
    checkInt(fn([2, 1, 2]), 3, "valley")
    checkInt(fn([3, 3, 3, 3]), 12, "flat")
    checkInt(fn([1, 2, 3, 4, 5]), 9, "asc")
    checkInt(fn([5, 4, 3, 2, 1]), 9, "desc")
    checkInt(fn([0, 9]), 9, "zero")
    checkInt(fn([2, 0, 2]), 2, "gap")
}
print("All tests passed!")
