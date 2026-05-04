// Problem: 217. Contains Duplicate
// Difficulty: Easy
// URL: https://leetcode.com/problems/contains-duplicate/
//
// 【解法演進】暴力 O(n²) → 排序 O(n log n) → HashSet O(n)（最佳）
// 【最佳解核心思路】
//   走訪陣列維護 seen 集合，遇到已見元素即回傳 true。
// 【複雜度】時間：O(n)  空間：O(n)

import Foundation

class Solution {
    // 最佳解：HashSet
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var seen = Set<Int>()
        for x in nums {
            if seen.contains(x) { return true }
            seen.insert(x)
        }
        return false
    }

    // 暴力解：兩兩比較
    func containsDuplicate_brute(_ nums: [Int]) -> Bool {
        for i in 0..<nums.count {
            for j in (i + 1)..<nums.count {
                if nums[i] == nums[j] { return true }
            }
        }
        return false
    }

    // 排序後比鄰
    func containsDuplicate_sort(_ nums: [Int]) -> Bool {
        let arr = nums.sorted()
        for i in 1..<arr.count {
            if arr[i] == arr[i - 1] { return true }
        }
        return false
    }
}

// MARK: - Tests
func checkBool(_ actual: Bool, _ expected: Bool, _ name: String) {
    if actual == expected { print("✓ \(name)") }
    else { print("✗ \(name): expected \(expected) but got \(actual)") }
}

let s = Solution()
checkBool(s.containsDuplicate([1, 2, 3, 1]), true, "Test 1: basic dup")
checkBool(s.containsDuplicate([1, 2, 3, 4]), false, "Test 2: no dup")
checkBool(s.containsDuplicate([1, 1, 1, 3, 3, 4, 3, 2, 4, 2]), true, "Test 3: many dups")
checkBool(s.containsDuplicate([1]), false, "Test 4: single")
checkBool(s.containsDuplicate([-1, -1]), true, "Test 5: negatives")

checkBool(s.containsDuplicate_brute([1, 2, 3, 1]), true, "Brute Test 1")
checkBool(s.containsDuplicate_sort([1, 2, 3, 4]), false, "Sort Test 1")

print("All tests passed!")
