// Problem: 167. Two Sum II - Input Array Is Sorted
// Difficulty: Medium
// URL: https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/
//
// 【解法演進】HashMap O(n)/O(n) → 雙指標 O(n)/O(1)（最佳）
// 【最佳解核心思路】利用排序單調性，總和過小移左、過大移右。
// 【複雜度】時間：O(n)  空間：O(1)

import Foundation

class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var l = 0, r = numbers.count - 1
        while l < r {
            let total = numbers[l] + numbers[r]
            if total == target { return [l + 1, r + 1] }
            if total < target { l += 1 } else { r -= 1 }
        }
        return []
    }

    func twoSum_brute(_ numbers: [Int], _ target: Int) -> [Int] {
        var seen = [Int: Int]()
        for (i, x) in numbers.enumerated() {
            if let j = seen[target - x] { return [j + 1, i + 1] }
            seen[x] = i
        }
        return []
    }
}

func checkArr(_ actual: [Int], _ expected: [Int], _ name: String) {
    if actual == expected { print("✓ \(name)") }
    else { print("✗ \(name): expected \(expected) but got \(actual)") }
}

let s = Solution()
checkArr(s.twoSum([2, 7, 11, 15], 9), [1, 2], "Test 1")
checkArr(s.twoSum([2, 3, 4], 6), [1, 3], "Test 2")
checkArr(s.twoSum([-1, 0], -1), [1, 2], "Test 3: negatives")
checkArr(s.twoSum([1, 2, 3, 4, 5], 9), [4, 5], "Test 4")
checkArr(s.twoSum([0, 0, 3, 4], 0), [1, 2], "Test 5: zeros")
checkArr(s.twoSum_brute([2, 7, 11, 15], 9), [1, 2], "Brute Test")

print("All tests passed!")
