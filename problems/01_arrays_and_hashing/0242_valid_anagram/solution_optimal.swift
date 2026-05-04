// Problem: 242. Valid Anagram
// Difficulty: Easy
// URL: https://leetcode.com/problems/valid-anagram/
//
// 【解法演進】排序比較 O(n log n) → 計數 O(n)（最佳）
// 【最佳解核心思路】長度不同直接 false；s +1、t -1，最後檢查全 0。
// 【複雜度】時間：O(n)  空間：O(1)

import Foundation

class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        if s.count != t.count { return false }
        var count = [Int](repeating: 0, count: 26)
        let aScalar = Int(Character("a").asciiValue!)
        let sArr = Array(s.unicodeScalars)
        let tArr = Array(t.unicodeScalars)
        for i in 0..<sArr.count {
            count[Int(sArr[i].value) - aScalar] += 1
            count[Int(tArr[i].value) - aScalar] -= 1
        }
        return count.allSatisfy { $0 == 0 }
    }

    // 暴力解：排序比較
    func isAnagram_brute(_ s: String, _ t: String) -> Bool {
        return s.sorted() == t.sorted()
    }
}

func checkBool(_ actual: Bool, _ expected: Bool, _ name: String) {
    if actual == expected { print("✓ \(name)") }
    else { print("✗ \(name): expected \(expected) but got \(actual)") }
}

let s = Solution()
checkBool(s.isAnagram("anagram", "nagaram"), true, "Test 1")
checkBool(s.isAnagram("rat", "car"), false, "Test 2")
checkBool(s.isAnagram("", ""), true, "Test 3: empty")
checkBool(s.isAnagram("a", "a"), true, "Test 4: single")
checkBool(s.isAnagram("ab", "a"), false, "Test 5: length diff")
checkBool(s.isAnagram("aacc", "ccac"), false, "Test 6: count diff")
checkBool(s.isAnagram_brute("anagram", "nagaram"), true, "Brute Test 1")

print("All tests passed!")
