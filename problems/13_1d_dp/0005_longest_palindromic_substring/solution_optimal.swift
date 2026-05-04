// 0005. Longest Palindromic Substring
import Foundation
class Solution {
    func longestPalindrome(_ s: String) -> String {
        if s.isEmpty { return "" }
        let arr = Array(s)
        var bl = 0, br = 0
        func expand(_ li: Int, _ ri: Int) {
            var l = li, r = ri
            while l >= 0 && r < arr.count && arr[l] == arr[r] { l -= 1; r += 1 }
            l += 1; r -= 1
            if r - l > br - bl { bl = l; br = r }
        }
        for i in 0..<arr.count { expand(i, i); expand(i, i + 1) }
        return String(arr[bl...br])
    }
}
let sol = Solution()
let r1 = sol.longestPalindrome("babad")
if r1 != "bab" && r1 != "aba" { fatalError("a") }
if sol.longestPalindrome("cbbd") != "bb" { fatalError("b") }
if sol.longestPalindrome("a") != "a" { fatalError("c") }
if sol.longestPalindrome("") != "" { fatalError("d") }
let r5 = sol.longestPalindrome("ac")
if r5 != "a" && r5 != "c" { fatalError("e") }
if sol.longestPalindrome("racecar") != "racecar" { fatalError("f") }
print("All tests passed!")
