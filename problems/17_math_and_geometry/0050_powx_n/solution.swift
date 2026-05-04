// 0050. Pow(x, n)
import Foundation
class Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {
        var nn = n
        var b = x
        if nn < 0 { b = 1 / b; nn = -nn }
        var res = 1.0
        while nn > 0 {
            if nn & 1 == 1 { res *= b }
            b *= b
            nn >>= 1
        }
        return res
    }
}
let sol = Solution()
if abs(sol.myPow(2.0, 10) - 1024.0) > 1e-6 { fatalError("a") }
if abs(sol.myPow(2.1, 3) - 9.261) > 1e-6 { fatalError("b") }
if abs(sol.myPow(2.0, -2) - 0.25) > 1e-6 { fatalError("c") }
if abs(sol.myPow(1.0, 0) - 1.0) > 1e-6 { fatalError("d") }
if abs(sol.myPow(0.5, 4) - 0.0625) > 1e-6 { fatalError("e") }
print("All tests passed!")
