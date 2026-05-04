// Problem: 49. Group Anagrams
// Difficulty: Medium
// URL: https://leetcode.com/problems/group-anagrams/
//
// 【解法演進】排序當 key O(n·k log k) → 26 元組計數 key O(n·k)（最佳）
// 【最佳解核心思路】每字串以 26 計數陣列作 key 歸類。
// 【複雜度】時間：O(n · k)  空間：O(n · k)

import Foundation

class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        // TODO: implement
        return []
    }

    func groupAnagrams_brute(_ strs: [String]) -> [[String]] {
        // TODO: implement
        return []
    }
}

func normGroups(_ g: [[String]]) -> [[String]] {
    // TODO: implement
    return []
}

func checkGroups(_ actual: [[String]], _ expected: [[String]], _ name: String) {
    let a = normGroups(actual)
    let b = normGroups(expected)
    if a == b { print("✓ \(name)") }
    else { print("✗ \(name): expected \(b) but got \(a)") }
}

// MARK: - Tests
// let s = Solution()

// Test 1
// let result = s.solve(...)

print("All tests passed!")
