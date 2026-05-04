// Problem: 0017. Letter Combinations of a Phone Number
// Difficulty: Medium

import Foundation

class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        if digits.isEmpty { return [] }
        let m: [Character: [Character]] = [
            "2": ["a","b","c"], "3": ["d","e","f"], "4": ["g","h","i"], "5": ["j","k","l"],
            "6": ["m","n","o"], "7": ["p","q","r","s"], "8": ["t","u","v"], "9": ["w","x","y","z"],
        ]
        var out: [String] = []
        var path: [Character] = []
        let arr = Array(digits)
        let n = arr.count
        func dfs(_ i: Int) {
            if i == n { out.append(String(path)); return }
            for ch in m[arr[i]]! {
                path.append(ch)
                dfs(i + 1)
                path.removeLast()
            }
        }
        dfs(0)
        return out
    }
}

func checkStrs(_ a: [String], _ e: [String], _ msg: String) {
    if a.sorted() != e.sorted() { fatalError("FAIL \(msg)") }
}

let sol = Solution()
checkStrs(sol.letterCombinations("23"),
          ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"], "a")
if !sol.letterCombinations("").isEmpty { fatalError("b") }
checkStrs(sol.letterCombinations("2"), ["a", "b", "c"], "c")
checkStrs(sol.letterCombinations("7"), ["p", "q", "r", "s"], "d")
if sol.letterCombinations("234").count != 27 { fatalError("e") }
print("All tests passed!")
