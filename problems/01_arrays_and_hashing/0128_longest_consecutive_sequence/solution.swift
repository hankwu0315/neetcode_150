// Problem: 128. Longest Consecutive Sequence
// Difficulty: Medium
// URL: https://leetcode.com/problems/longest-consecutive-sequence/
//
// 【解法演進】排序 O(n log n) → HashSet + 從起點展開 O(n)（最佳）
// 【最佳解核心思路】只從序列起點（x-1 不在 set）開始向上展開。
// 【複雜度】時間：O(n)  空間：O(n)

import Foundation

class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        let s = Set(nums)
        var best = 0
        for x in s {
            if !s.contains(x - 1) {
                var cur = x
                var length = 1
                while s.contains(cur + 1) {
                    cur += 1
                    length += 1
                }
                best = max(best, length)
            }
        }
        return best
    }

    func longestConsecutive_brute(_ nums: [Int]) -> Int {
        if nums.isEmpty { return 0 }
        let arr = Array(Set(nums)).sorted()
        var best = 1, cur = 1
        for i in 1..<arr.count {
            if arr[i] == arr[i - 1] + 1 {
                cur += 1
                best = max(best, cur)
            } else {
                cur = 1
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
checkInt(s.longestConsecutive([100, 4, 200, 1, 3, 2]), 4, "Test 1")
checkInt(s.longestConsecutive([0, 3, 7, 2, 5, 8, 4, 6, 0, 1]), 9, "Test 2")
checkInt(s.longestConsecutive([]), 0, "Test 3: empty")
checkInt(s.longestConsecutive([1]), 1, "Test 4: single")
checkInt(s.longestConsecutive([1, 1, 1]), 1, "Test 5: dups")
checkInt(s.longestConsecutive([-1, -2, -3, 0, 1]), 5, "Test 6: negatives")
checkInt(s.longestConsecutive([10, 20, 30]), 1, "Test 7: no consecutive")
checkInt(s.longestConsecutive_brute([100, 4, 200, 1, 3, 2]), 4, "Brute Test")

print("All tests passed!")
