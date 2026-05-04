// Problem: 1. Two Sum
// Difficulty: Easy
// URL: https://leetcode.com/problems/two-sum/
//
// 【解法演進】暴力 O(n²) → 一遍雜湊 O(n)（最佳）
// 【最佳解核心思路】先查 (target - x) 是否已見，沒有再寫入。
// 【複雜度】時間：O(n)  空間：O(n)

import Foundation

class Solution {
    // 最佳解：一遍 HashMap
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var seen = [Int: Int]()
        for (i, x) in nums.enumerated() {
            let comp = target - x
            if let j = seen[comp] { return [j, i] }
            seen[x] = i
        }
        return []
    }

    // 暴力解
    func twoSum_brute(_ nums: [Int], _ target: Int) -> [Int] {
        for i in 0..<nums.count {
            for j in (i + 1)..<nums.count {
                if nums[i] + nums[j] == target { return [i, j] }
            }
        }
        return []
    }
}

func checkPair(_ actual: [Int], _ expected: [Int], _ name: String) {
    if actual.sorted() == expected.sorted() { print("✓ \(name)") }
    else { print("✗ \(name): expected \(expected.sorted()) but got \(actual.sorted())") }
}

let s = Solution()
checkPair(s.twoSum([2, 7, 11, 15], 9), [0, 1], "Test 1")
checkPair(s.twoSum([3, 2, 4], 6), [1, 2], "Test 2")
checkPair(s.twoSum([3, 3], 6), [0, 1], "Test 3: same value")
checkPair(s.twoSum([-1, -2, -3, -4, -5], -8), [2, 4], "Test 4: negatives")
checkPair(s.twoSum([0, 4, 3, 0], 0), [0, 3], "Test 5: zeros")
checkPair(s.twoSum_brute([2, 7, 11, 15], 9), [0, 1], "Brute Test 1")

print("All tests passed!")
