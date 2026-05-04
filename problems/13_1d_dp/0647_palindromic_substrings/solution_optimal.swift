// 0647. Palindromic Substrings
import Foundation
class Solution {
    func countSubstrings(_ s: String) -> Int {
        let arr = Array(s)
        var cnt = 0
        func expand(_ li: Int, _ ri: Int) -> Int {
            var l = li, r = ri, c = 0
            while l >= 0 && r < arr.count && arr[l] == arr[r] { c += 1; l -= 1; r += 1 }
            return c
        }
        for i in 0..<arr.count { cnt += expand(i, i); cnt += expand(i, i + 1) }
        return cnt
    }
}
let sol = Solution()
if sol.countSubstrings("abc") != 3 { fatalError("a") }
if sol.countSubstrings("aaa") != 6 { fatalError("b") }
if sol.countSubstrings("") != 0 { fatalError("c") }
if sol.countSubstrings("a") != 1 { fatalError("d") }
if sol.countSubstrings("aaaa") != 10 { fatalError("e") }
if sol.countSubstrings("abba") != 6 { fatalError("f") }
print("All tests passed!")
