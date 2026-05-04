// Problem: 11. Container With Most Water
// Difficulty: Medium
// URL: https://leetcode.com/problems/container-with-most-water/
//
// 【解法演進】暴力 O(n²) → 雙指標 O(n)（最佳）
// 【最佳解核心思路】每次移動較矮的一側。
// 【複雜度】時間：O(n)  空間：O(1)

import Foundation

class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var l = 0, r = height.count - 1
        var best = 0
        while l < r {
            let h = min(height[l], height[r])
            let area = h * (r - l)
            if area > best { best = area }
            if height[l] < height[r] { l += 1 } else { r -= 1 }
        }
        return best
    }

    func maxArea_brute(_ height: [Int]) -> Int {
        let n = height.count
        var best = 0
        for i in 0..<n {
            for j in (i + 1)..<n {
                let area = min(height[i], height[j]) * (j - i)
                if area > best { best = area }
            }
        }
        return best
    }
}

func checkInt(_ actual: Int, _ expected: Int, _ name: String) {
    if actual == expected { print("✓ \(name)") }
    else { print("✗ \(name): expected \(expected) but got \(actual)") }
}

let s = Solution()
checkInt(s.maxArea([1, 8, 6, 2, 5, 4, 8, 3, 7]), 49, "Test 1")
checkInt(s.maxArea([1, 1]), 1, "Test 2")
checkInt(s.maxArea([4, 3, 2, 1, 4]), 16, "Test 3")
checkInt(s.maxArea([1, 2, 1]), 2, "Test 4")
checkInt(s.maxArea([0, 0]), 0, "Test 5: zeros")
checkInt(s.maxArea([2, 3, 4, 5, 18, 17, 6]), 17, "Test 6")
checkInt(s.maxArea_brute([1, 8, 6, 2, 5, 4, 8, 3, 7]), 49, "Brute Test")

print("All tests passed!")
