// 0007. Reverse Integer
import Foundation
class Solution {
    func reverse(_ x: Int) -> Int {
        let sign = x < 0 ? -1 : 1
        var n = abs(x)
        var r = 0
        while n > 0 {
            r = r * 10 + n % 10
            n /= 10
        }
        r *= sign
        if r < -2147483648 || r > 2147483647 { return 0 }
        return r
    }
}
let sol = Solution()
if sol.reverse(123) != 321 { fatalError("a") }
if sol.reverse(-123) != -321 { fatalError("b") }
if sol.reverse(120) != 21 { fatalError("c") }
if sol.reverse(0) != 0 { fatalError("d") }
if sol.reverse(1534236469) != 0 { fatalError("e") }
if sol.reverse(-2147483648) != 0 { fatalError("f") }
print("All tests passed!")
