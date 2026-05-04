// 0043. Multiply Strings
import Foundation
class Solution {
    func multiply(_ num1: String, _ num2: String) -> String {
        if num1 == "0" || num2 == "0" { return "0" }
        let a = Array(num1.utf8), b = Array(num2.utf8)
        let m = a.count, n = b.count
        var buf = Array(repeating: 0, count: m + n)
        for i in stride(from: m - 1, through: 0, by: -1) {
            let x = Int(a[i]) - 48
            for j in stride(from: n - 1, through: 0, by: -1) {
                let y = Int(b[j]) - 48
                let p = buf[i + j + 1] + x * y
                buf[i + j + 1] = p % 10
                buf[i + j] += p / 10
            }
        }
        var s = ""
        var leading = true
        for d in buf {
            if leading && d == 0 { continue }
            leading = false
            s += String(d)
        }
        return s.isEmpty ? "0" : s
    }
}
let sol = Solution()
if sol.multiply("2", "3") != "6" { fatalError("a") }
if sol.multiply("123", "456") != "56088" { fatalError("b") }
if sol.multiply("0", "12345") != "0" { fatalError("c") }
if sol.multiply("999", "999") != "998001" { fatalError("d") }
if sol.multiply("1", "1") != "1" { fatalError("e") }
print("All tests passed!")
