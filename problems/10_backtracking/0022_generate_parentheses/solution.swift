// Problem: 0022. Generate Parentheses
// Difficulty: Medium

import Foundation

class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        var out: [String] = []
        var path: [Character] = []
        func dfs(_ op: Int, _ cl: Int) {
            if op == n && cl == n { out.append(String(path)); return }
            if op < n {
                path.append("(")
                dfs(op + 1, cl)
                path.removeLast()
            }
            if cl < op {
                path.append(")")
                dfs(op, cl + 1)
                path.removeLast()
            }
        }
        dfs(0, 0)
        return out
    }
}

func checkStrs2(_ a: [String], _ e: [String], _ msg: String) {
    if a.sorted() != e.sorted() { fatalError("FAIL \(msg)") }
}

let sol = Solution()
checkStrs2(sol.generateParenthesis(3),
           ["((()))", "(()())", "(())()", "()(())", "()()()"], "a")
checkStrs2(sol.generateParenthesis(1), ["()"], "b")
checkStrs2(sol.generateParenthesis(2), ["(())", "()()"], "c")
if sol.generateParenthesis(4).count != 14 { fatalError("d") }
if sol.generateParenthesis(5).count != 42 { fatalError("e") }
print("All tests passed!")
