// 0070. Climbing Stairs
import Foundation
class Solution {
    func climbStairs(_ n: Int) -> Int {
        var a = 1, b = 1
        for _ in 0..<n { let t = a + b; a = b; b = t }
        return a
    }
}
let sol = Solution()
if sol.climbStairs(1) != 1 { fatalError("a") }
if sol.climbStairs(2) != 2 { fatalError("b") }
if sol.climbStairs(3) != 3 { fatalError("c") }
if sol.climbStairs(5) != 8 { fatalError("d") }
if sol.climbStairs(10) != 89 { fatalError("e") }
if sol.climbStairs(0) != 1 { fatalError("f") }
print("All tests passed!")
