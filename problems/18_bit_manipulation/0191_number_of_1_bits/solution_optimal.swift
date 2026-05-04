// 0191. Number of 1 Bits
import Foundation
class Solution {
    func hammingWeight(_ n: Int) -> Int {
        var n = n, c = 0
        while n != 0 { n &= n - 1; c += 1 }
        return c
    }
}
let sol = Solution()
if sol.hammingWeight(11) != 3 { fatalError("a") }
if sol.hammingWeight(128) != 1 { fatalError("b") }
if sol.hammingWeight(0) != 0 { fatalError("c") }
if sol.hammingWeight(7) != 3 { fatalError("d") }
if sol.hammingWeight(1023) != 10 { fatalError("e") }
print("All tests passed!")
