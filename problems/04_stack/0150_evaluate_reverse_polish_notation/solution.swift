// Problem: 0150. Evaluate Reverse Polish Notation
// Difficulty: Medium
// URL: https://leetcode.com/problems/evaluate-reverse-polish-notation/
//
// 最佳解：堆疊；Swift 整數除法 / 對負數即為向 0 截斷。

import Foundation

class Solution {
    func evalRPN(_ tokens: [String]) -> Int {
        var stack: [Int] = []
        for t in tokens {
            switch t {
            case "+", "-", "*", "/":
                let b = stack.removeLast()
                let a = stack.removeLast()
                switch t {
                case "+": stack.append(a + b)
                case "-": stack.append(a - b)
                case "*": stack.append(a * b)
                default: stack.append(a / b) // 向 0 截斷
                }
            default:
                stack.append(Int(t)!)
            }
        }
        return stack[0]
    }
}

func checkInt(_ a: Int, _ e: Int, _ msg: String) {
    if a != e { fatalError("FAIL \(msg): \(a) vs \(e)") }
}

let sol = Solution()
checkInt(sol.evalRPN(["2", "1", "+", "3", "*"]), 9, "ex1")
checkInt(sol.evalRPN(["4", "13", "5", "/", "+"]), 6, "ex2")
checkInt(
    sol.evalRPN(["10", "6", "9", "3", "+", "-11", "*", "/", "*", "17", "+", "5", "+"]),
    22, "ex3"
)
checkInt(sol.evalRPN(["6", "-132", "/"]), 0, "trunc")
checkInt(sol.evalRPN(["-7", "2", "/"]), -3, "neg trunc")
checkInt(sol.evalRPN(["3"]), 3, "single")
print("All tests passed!")
