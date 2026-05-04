// Problem: 567. Permutation in String
// Difficulty: Medium
// URL: https://leetcode.com/problems/permutation-in-string/
//
// 【解法演進】排序 → 計數比較 → 固定窗口 + matches O(n)（最佳）
// 【最佳解核心思路】維護兩 26 元計數與 matches，滑窗時依相等狀態翻轉更新。
// 【複雜度】時間：O(n)  空間：O(1)

import Foundation

class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        if s1.count > s2.count { return false }
        let A = Int(Character("a").asciiValue!)
        var c1 = [Int](repeating: 0, count: 26)
        var c2 = [Int](repeating: 0, count: 26)
        let a1 = Array(s1), a2 = Array(s2)
        for i in 0..<a1.count {
            c1[Int(a1[i].asciiValue!) - A] += 1
            c2[Int(a2[i].asciiValue!) - A] += 1
        }
        var matches = 0
        for i in 0..<26 where c1[i] == c2[i] { matches += 1 }
        if matches == 26 { return true }

        for r in a1.count..<a2.count {
            var idx = Int(a2[r].asciiValue!) - A
            var before = c2[idx] == c1[idx]
            c2[idx] += 1
            var after = c2[idx] == c1[idx]
            if before != after { matches += after ? 1 : -1 }

            idx = Int(a2[r - a1.count].asciiValue!) - A
            before = c2[idx] == c1[idx]
            c2[idx] -= 1
            after = c2[idx] == c1[idx]
            if before != after { matches += after ? 1 : -1 }

            if matches == 26 { return true }
        }
        return false
    }
}

func checkBool(_ actual: Bool, _ expected: Bool, _ name: String) {
    if actual == expected { print("✓ \(name)") }
    else { print("✗ \(name): expected \(expected) but got \(actual)") }
}

let s = Solution()
checkBool(s.checkInclusion("ab", "eidbaooo"), true, "Test 1")
checkBool(s.checkInclusion("ab", "eidboaoo"), false, "Test 2")
checkBool(s.checkInclusion("a", "a"), true, "Test 3")
checkBool(s.checkInclusion("ab", "a"), false, "Test 4: s1 longer")
checkBool(s.checkInclusion("abc", "ccccbbbbaaaa"), false, "Test 5")
checkBool(s.checkInclusion("hello", "ooolleoooleh"), false, "Test 6")
checkBool(s.checkInclusion("adc", "dcda"), true, "Test 7")

print("All tests passed!")
