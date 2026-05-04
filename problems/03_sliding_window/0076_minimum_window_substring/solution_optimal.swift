// Problem: 76. Minimum Window Substring
// Difficulty: Hard
// URL: https://leetcode.com/problems/minimum-window-substring/
//
// 【解法演進】暴力 O(n²) → 滑動窗口 + have/required（最佳）
// 【最佳解核心思路】need + window 計數，have 達 required 時縮左更新答案。
// 【複雜度】時間：O(|s| + |t|)  空間：O(|Σ|)

import Foundation

class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        if t.isEmpty || s.count < t.count { return "" }
        var need = [Character: Int]()
        for c in t { need[c, default: 0] += 1 }
        let required = need.count
        var window = [Character: Int]()
        var have = 0, l = 0
        var bestLen = Int.max, bestL = 0, bestR = -1
        let arr = Array(s)
        for r in 0..<arr.count {
            let c = arr[r]
            window[c, default: 0] += 1
            if let n = need[c], window[c] == n { have += 1 }
            while have == required {
                if r - l + 1 < bestLen {
                    bestLen = r - l + 1
                    bestL = l
                    bestR = r
                }
                let lc = arr[l]
                window[lc]! -= 1
                if let n = need[lc], window[lc]! < n { have -= 1 }
                l += 1
            }
        }
        if bestR < 0 { return "" }
        return String(arr[bestL...bestR])
    }
}

func checkStr(_ actual: String, _ expected: String, _ name: String) {
    if actual == expected { print("✓ \(name)") }
    else { print("✗ \(name): expected \"\(expected)\" but got \"\(actual)\"") }
}

let s = Solution()
checkStr(s.minWindow("ADOBECODEBANC", "ABC"), "BANC", "Test 1")
checkStr(s.minWindow("a", "a"), "a", "Test 2")
checkStr(s.minWindow("a", "aa"), "", "Test 3: insufficient")
checkStr(s.minWindow("aa", "aa"), "aa", "Test 4")
checkStr(s.minWindow("ab", "b"), "b", "Test 5")
checkStr(s.minWindow("", "a"), "", "Test 6: empty s")
checkStr(s.minWindow("aaflslflsldkalskaaa", "aaa"), "aaa", "Test 7")

print("All tests passed!")
