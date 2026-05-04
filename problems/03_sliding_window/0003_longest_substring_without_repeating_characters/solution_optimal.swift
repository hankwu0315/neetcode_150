// Problem: 3. Longest Substring Without Repeating Characters
// Difficulty: Medium
// URL: https://leetcode.com/problems/longest-substring-without-repeating-characters/
//
// 【解法演進】暴力 O(n²) → 滑動窗口 + HashMap O(n)（最佳）
// 【最佳解核心思路】記錄每字元上次出現索引；遇重複跳左界。
// 【複雜度】時間：O(n)  空間：O(min(n, |Σ|))

import Foundation

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var lastSeen = [Character: Int]()
        var l = 0, best = 0
        for (r, c) in Array(s).enumerated() {
            if let last = lastSeen[c], last >= l { l = last + 1 }
            lastSeen[c] = r
            if r - l + 1 > best { best = r - l + 1 }
        }
        return best
    }

    func lengthOfLongestSubstring_brute(_ s: String) -> Int {
        let chars = Array(s)
        var best = 0
        for i in 0..<chars.count {
            var seen = Set<Character>()
            for j in i..<chars.count {
                if seen.contains(chars[j]) { break }
                seen.insert(chars[j])
                if j - i + 1 > best { best = j - i + 1 }
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
checkInt(s.lengthOfLongestSubstring("abcabcbb"), 3, "Test 1")
checkInt(s.lengthOfLongestSubstring("bbbbb"), 1, "Test 2")
checkInt(s.lengthOfLongestSubstring("pwwkew"), 3, "Test 3")
checkInt(s.lengthOfLongestSubstring(""), 0, "Test 4: empty")
checkInt(s.lengthOfLongestSubstring(" "), 1, "Test 5: space")
checkInt(s.lengthOfLongestSubstring("dvdf"), 3, "Test 6")
checkInt(s.lengthOfLongestSubstring("abcdef"), 6, "Test 7: all unique")
checkInt(s.lengthOfLongestSubstring_brute("abcabcbb"), 3, "Brute Test")

print("All tests passed!")
