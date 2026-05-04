// 0091. Decode Ways
import Foundation
class Solution {
    func numDecodings(_ s: String) -> Int {
        let n = s.count
        let a = Array(s)
        if n == 0 || a[0] == "0" { return 0 }
        var p2 = 1, p1 = 1
        for i in 2...max(n,2) {
            if i > n { break }
            var cur = 0
            if a[i - 1] != "0" { cur += p1 }
            let two = Int(String(a[i-2...i-1]))!
            if two >= 10 && two <= 26 { cur += p2 }
            p2 = p1; p1 = cur
        }
        return n == 1 ? 1 : p1
    }
}
let sol = Solution()
if sol.numDecodings("12") != 2 { fatalError("a") }
if sol.numDecodings("226") != 3 { fatalError("b") }
if sol.numDecodings("06") != 0 { fatalError("c") }
if sol.numDecodings("0") != 0 { fatalError("d") }
if sol.numDecodings("10") != 1 { fatalError("e") }
if sol.numDecodings("27") != 1 { fatalError("f") }
if sol.numDecodings("11106") != 2 { fatalError("g") }
print("All tests passed!")
