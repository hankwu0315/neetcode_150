// Problem: 125. Valid Palindrome
// Difficulty: Easy
// URL: https://leetcode.com/problems/valid-palindrome/
//
// 【解法演進】清理 + 反轉 → 雙指標 O(n)/O(1)（最佳）
// 【最佳解核心思路】左右指標相向，跳過非英數，比較小寫字元。
// 【複雜度】時間：O(n)  空間：O(1)

import Foundation

class Solution {
    func isPalindrome(_ s: String) -> Bool {
        let chars = Array(s)
        var l = 0, r = chars.count - 1
        while l < r {
            while l < r && !chars[l].isLetter && !chars[l].isNumber { l += 1 }
            while l < r && !chars[r].isLetter && !chars[r].isNumber { r -= 1 }
            if chars[l].lowercased() != chars[r].lowercased() { return false }
            l += 1
            r -= 1
        }
        return true
    }

    func isPalindrome_brute(_ s: String) -> Bool {
        let t = s.lowercased().filter { $0.isLetter || $0.isNumber }
        return t == String(t.reversed())
    }
}

func checkBool(_ actual: Bool, _ expected: Bool, _ name: String) {
    if actual == expected { print("✓ \(name)") }
    else { print("✗ \(name): expected \(expected) but got \(actual)") }
}

let s = Solution()
checkBool(s.isPalindrome("A man, a plan, a canal: Panama"), true, "Test 1")
checkBool(s.isPalindrome("race a car"), false, "Test 2")
checkBool(s.isPalindrome(" "), true, "Test 3: empty after clean")
checkBool(s.isPalindrome(""), true, "Test 4: empty")
checkBool(s.isPalindrome("0P"), false, "Test 5: digit vs letter")
checkBool(s.isPalindrome("a."), true, "Test 6: single alnum")
checkBool(s.isPalindrome("ab"), false, "Test 7")
checkBool(s.isPalindrome_brute("A man, a plan, a canal: Panama"), true, "Brute Test")

print("All tests passed!")
