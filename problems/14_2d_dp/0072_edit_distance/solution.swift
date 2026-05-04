// 0072. Edit Distance
import Foundation
class Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        let a = Array(word1), b = Array(word2)
        let m = a.count, n = b.count
        var prev = Array(0...n)
        if m >= 1 {
            for i in 1...m {
                var cur = Array(repeating: 0, count: n + 1)
                cur[0] = i
                if n >= 1 {
                    for j in 1...n {
                        if a[i - 1] == b[j - 1] {
                            cur[j] = prev[j - 1]
                        } else {
                            cur[j] = 1 + min(prev[j - 1], min(prev[j], cur[j - 1]))
                        }
                    }
                }
                prev = cur
            }
        }
        return prev[n]
    }
}
let sol = Solution()
if sol.minDistance("horse", "ros") != 3 { fatalError("a") }
if sol.minDistance("intention", "execution") != 5 { fatalError("b") }
if sol.minDistance("", "") != 0 { fatalError("c") }
if sol.minDistance("a", "") != 1 { fatalError("d") }
if sol.minDistance("", "abc") != 3 { fatalError("e") }
if sol.minDistance("abc", "abc") != 0 { fatalError("f") }
print("All tests passed!")
