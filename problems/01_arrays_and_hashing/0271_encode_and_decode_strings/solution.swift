// Problem: 271. Encode and Decode Strings (Premium)
// Difficulty: Medium
// URL: https://leetcode.com/problems/encode-and-decode-strings/
//
// 【解法演進】脆弱分隔符（壞）→ 長度前綴 + '#'（最佳）
// 【最佳解核心思路】encode 每個字串前加 "len#"，decode 解析長度後切片。
// 【複雜度】時間：O(N)  空間：O(N)

import Foundation

class Codec {
    func encode(_ strs: [String]) -> String {
        // TODO: implement
        return ""
    }

    func decode(_ s: String) -> [String] {
        // TODO: implement
        return []
    }
}

func checkArr(_ actual: [String], _ expected: [String], _ name: String) {
    if actual == expected { print("✓ \(name)") }
    else { print("✗ \(name): expected \(expected) but got \(actual)") }
}

// MARK: - Tests
// let s = Solution()

// Test 1
// let result = s.solve(...)

print("All tests passed!")
