// 0678. Valid Parenthesis String
import Foundation
class Solution {
    func checkValidString(_ s: String) -> Bool {
        var lo = 0, hi = 0
        for c in s {
            if c == "(" { lo += 1; hi += 1 }
            else if c == ")" { lo -= 1; hi -= 1 }
            else { lo -= 1; hi += 1 }
            if hi < 0 { return false }
            if lo < 0 { lo = 0 }
        }
        return lo == 0
    }
}
let sol = Solution()
if sol.checkValidString("()") != true { fatalError("a") }
if sol.checkValidString("(*)") != true { fatalError("b") }
if sol.checkValidString("(*))") != true { fatalError("c") }
if sol.checkValidString("") != true { fatalError("d") }
if sol.checkValidString(")(") != false { fatalError("e") }
if sol.checkValidString("(((((*)))**") != true { fatalError("f") }
if sol.checkValidString("(()") != false { fatalError("g") }
print("All tests passed!")
