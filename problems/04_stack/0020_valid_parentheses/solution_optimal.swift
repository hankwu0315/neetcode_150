// Problem: 0020. Valid Parentheses
// Difficulty: Easy
// URL: https://leetcode.com/problems/valid-parentheses/
//
// 最佳解：堆疊。O(n) / O(n)。

import Foundation

class Solution {
    func isValid(_ s: String) -> Bool {
        let pairs: [Character: Character] = [")": "(", "]": "[", "}": "{"]
        var stack: [Character] = []
        for ch in s {
            if let need = pairs[ch] {
                if stack.last != need { return false }
                stack.removeLast()
            } else {
                stack.append(ch)
            }
        }
        return stack.isEmpty
    }

    func isValid_brute(_ s: String) -> Bool {
        var cur = s
        var prev = ""
        while prev != cur {
            prev = cur
            cur = cur
                .replacingOccurrences(of: "()", with: "")
                .replacingOccurrences(of: "[]", with: "")
                .replacingOccurrences(of: "{}", with: "")
        }
        return cur.isEmpty
    }
}

func checkBool(_ actual: Bool, _ expected: Bool, _ msg: String) {
    if actual != expected { fatalError("FAIL \(msg): got \(actual), expected \(expected)") }
}

let sol = Solution()
for fn in [sol.isValid, sol.isValid_brute] {
    checkBool(fn("()"), true, "()")
    checkBool(fn("()[]{}"), true, "()[]{}")
    checkBool(fn("(]"), false, "(]")
    checkBool(fn("([)]"), false, "([)]")
    checkBool(fn("{[]}"), true, "{[]}")
    checkBool(fn(""), true, "empty")
    checkBool(fn("("), false, "(")
}
print("All tests passed!")
