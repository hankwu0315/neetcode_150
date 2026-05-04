// 0202. Happy Number
import Foundation
class Solution {
    func sq(_ x: Int) -> Int {
        var x = x, s = 0
        while x > 0 { let d = x % 10; s += d * d; x /= 10 }
        return s
    }
    func isHappy(_ n: Int) -> Bool {
        var slow = n, fast = sq(n)
        while fast != 1 && slow != fast {
            slow = sq(slow)
            fast = sq(sq(fast))
        }
        return fast == 1
    }
}
let sol = Solution()
if sol.isHappy(19) != true { fatalError("a") }
if sol.isHappy(2) != false { fatalError("b") }
if sol.isHappy(1) != true { fatalError("c") }
if sol.isHappy(7) != true { fatalError("d") }
if sol.isHappy(20) != false { fatalError("e") }
print("All tests passed!")
