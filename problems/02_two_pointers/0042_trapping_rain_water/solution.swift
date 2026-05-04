// Problem: 42. Trapping Rain Water
// Difficulty: Hard
// URL: https://leetcode.com/problems/trapping-rain-water/
//
// 【解法演進】暴力 → 前綴後綴 → 雙指標 O(n)/O(1)（最佳）
// 【最佳解核心思路】何側較矮就結算何側水量並更新該側 max。
// 【複雜度】時間：O(n)  空間：O(1)

import Foundation

class Solution {
    func trap(_ height: [Int]) -> Int {
        let n = height.count
        if n < 3 { return 0 }
        var l = 0, r = n - 1
        var lMax = 0, rMax = 0, water = 0
        while l < r {
            if height[l] < height[r] {
                if height[l] >= lMax { lMax = height[l] }
                else { water += lMax - height[l] }
                l += 1
            } else {
                if height[r] >= rMax { rMax = height[r] }
                else { water += rMax - height[r] }
                r -= 1
            }
        }
        return water
    }

    func trap_arrays(_ height: [Int]) -> Int {
        let n = height.count
        if n == 0 { return 0 }
        var leftMax = [Int](repeating: 0, count: n)
        var rightMax = [Int](repeating: 0, count: n)
        leftMax[0] = height[0]
        for i in 1..<n { leftMax[i] = max(leftMax[i - 1], height[i]) }
        rightMax[n - 1] = height[n - 1]
        for i in stride(from: n - 2, through: 0, by: -1) {
            rightMax[i] = max(rightMax[i + 1], height[i])
        }
        var water = 0
        for i in 0..<n { water += min(leftMax[i], rightMax[i]) - height[i] }
        return water
    }
}

func checkInt(_ actual: Int, _ expected: Int, _ name: String) {
    if actual == expected { print("✓ \(name)") }
    else { print("✗ \(name): expected \(expected) but got \(actual)") }
}

let s = Solution()
checkInt(s.trap([0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]), 6, "Test 1")
checkInt(s.trap([4, 2, 0, 3, 2, 5]), 9, "Test 2")
checkInt(s.trap([]), 0, "Test 3: empty")
checkInt(s.trap([1, 2, 3]), 0, "Test 4: monotonic")
checkInt(s.trap([3, 0, 2, 0, 4]), 7, "Test 5")
checkInt(s.trap([0, 0, 0]), 0, "Test 6: all zero")
checkInt(s.trap_arrays([0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]), 6, "Arrays Test")

print("All tests passed!")
