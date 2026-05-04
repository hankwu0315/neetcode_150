// Problem: 424. Longest Repeating Character Replacement
// Difficulty: Medium
// URL: https://leetcode.com/problems/longest-repeating-character-replacement/
//
// 【解法演進】枚舉主導字母 → 單一滑動窗口 O(n)（最佳）
// 【最佳解核心思路】窗口 + count[26] + maxCount；窗長 - maxCount > k 則縮左。
// 【複雜度】時間：O(n)  空間：O(1)

import Foundation

class Solution {
    func characterReplacement(_ s: String, _ k: Int) -> Int {
        var count = [Int](repeating: 0, count: 26)
        let A = Int(Character("A").asciiValue!)
        let chars = Array(s)
        var l = 0, maxCount = 0, best = 0
        for r in 0..<chars.count {
            let idx = Int(chars[r].asciiValue!) - A
            count[idx] += 1
            if count[idx] > maxCount { maxCount = count[idx] }
            while (r - l + 1) - maxCount > k {
                count[Int(chars[l].asciiValue!) - A] -= 1
                l += 1
            }
            if r - l + 1 > best { best = r - l + 1 }
        }
        return best
    }
}

func checkInt(_ actual: Int, _ expected: Int, _ name: String) {
    if actual == expected { print("✓ \(name)") }
    else { print("✗ \(name): expected \(expected) but got \(actual)") }
}

let s = Solution()
checkInt(s.characterReplacement("ABAB", 2), 4, "Test 1")
checkInt(s.characterReplacement("AABABBA", 1), 4, "Test 2")
checkInt(s.characterReplacement("A", 0), 1, "Test 3: single")
checkInt(s.characterReplacement("AAAA", 2), 4, "Test 4: all same")
checkInt(s.characterReplacement("ABCDE", 1), 2, "Test 5")
checkInt(s.characterReplacement("ABCDE", 0), 1, "Test 6: k=0")

print("All tests passed!")
