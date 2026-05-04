// 0371. Sum of Two Integers
import Foundation
class Solution {
    func getSum(_ a: Int, _ b: Int) -> Int {
        var a = a, b = b
        while b != 0 {
            let carry = (a & b) << 1
            a = a ^ b
            b = carry
        }
        return a
    }
}
let sol = Solution()
if sol.getSum(1, 2) != 3 { fatalError("a") }
if sol.getSum(2, 3) != 5 { fatalError("b") }
if sol.getSum(-1, 1) != 0 { fatalError("c") }
if sol.getSum(-2, 3) != 1 { fatalError("d") }
if sol.getSum(0, 0) != 0 { fatalError("e") }
if sol.getSum(-5, -7) != -12 { fatalError("f") }
print("All tests passed!")
