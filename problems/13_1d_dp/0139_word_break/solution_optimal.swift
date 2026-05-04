// 0139. Word Break
import Foundation
class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        let words = Set(wordDict)
        var maxW = 0
        for w in words { if w.count > maxW { maxW = w.count } }
        let arr = Array(s)
        let n = arr.count
        var dp = Array(repeating: false, count: n + 1)
        dp[0] = true
        for i in 1...max(n,1) {
            if i > n { break }
            let lo = max(0, i - maxW)
            for j in lo..<i {
                if dp[j] && words.contains(String(arr[j..<i])) { dp[i] = true; break }
            }
        }
        return dp[n]
    }
}
let sol = Solution()
if sol.wordBreak("leetcode", ["leet", "code"]) != true { fatalError("a") }
if sol.wordBreak("applepenapple", ["apple", "pen"]) != true { fatalError("b") }
if sol.wordBreak("catsandog", ["cats", "dog", "sand", "and", "cat"]) != false { fatalError("c") }
if sol.wordBreak("a", ["a"]) != true { fatalError("d") }
if sol.wordBreak("ab", ["a"]) != false { fatalError("e") }
if sol.wordBreak("aaaaaaa", ["aaaa", "aaa"]) != true { fatalError("f") }
print("All tests passed!")
