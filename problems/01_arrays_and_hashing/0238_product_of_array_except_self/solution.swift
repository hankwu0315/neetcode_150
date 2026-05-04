// Problem: 238. Product of Array Except Self
// Difficulty: Medium
// URL: https://leetcode.com/problems/product-of-array-except-self/
//
// 【解法演進】暴力 O(n²) → 左右前綴 O(n)/O(n) → 原地兩遍掃描 O(n)/O(1)（最佳）
// 【最佳解核心思路】answer 第一遍存左前綴，第二遍從右到左乘右後綴。
// 【複雜度】時間：O(n)  空間：O(1)（不計輸出）

import Foundation

class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        let n = nums.count
        var answer = [Int](repeating: 1, count: n)
        for i in 1..<n { answer[i] = answer[i - 1] * nums[i - 1] }
        var right = 1
        for i in stride(from: n - 1, through: 0, by: -1) {
            answer[i] *= right
            right *= nums[i]
        }
        return answer
    }

    func productExceptSelf_brute(_ nums: [Int]) -> [Int] {
        let n = nums.count
        var result = [Int](repeating: 0, count: n)
        for i in 0..<n {
            var p = 1
            for j in 0..<n where j != i { p *= nums[j] }
            result[i] = p
        }
        return result
    }
}

func checkArr(_ actual: [Int], _ expected: [Int], _ name: String) {
    if actual == expected { print("✓ \(name)") }
    else { print("✗ \(name): expected \(expected) but got \(actual)") }
}

let s = Solution()
checkArr(s.productExceptSelf([1, 2, 3, 4]), [24, 12, 8, 6], "Test 1")
checkArr(s.productExceptSelf([-1, 1, 0, -3, 3]), [0, 0, 9, 0, 0], "Test 2")
checkArr(s.productExceptSelf([2, 3]), [3, 2], "Test 3: length 2")
checkArr(s.productExceptSelf([0, 0]), [0, 0], "Test 4: two zeros")
checkArr(s.productExceptSelf([1, 1, 1, 1]), [1, 1, 1, 1], "Test 5: all ones")
checkArr(s.productExceptSelf([-1, -1, -1, -1]), [-1, -1, -1, -1], "Test 6: all -1")
checkArr(s.productExceptSelf_brute([1, 2, 3, 4]), [24, 12, 8, 6], "Brute Test")

print("All tests passed!")
