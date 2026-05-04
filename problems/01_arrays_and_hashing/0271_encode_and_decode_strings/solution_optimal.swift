// Problem: 271. Encode and Decode Strings (Premium)
// Difficulty: Medium
// URL: https://leetcode.com/problems/encode-and-decode-strings/
//
// 【解法演進】脆弱分隔符（壞）→ 長度前綴 + '#'（最佳）
// 【最佳解核心思路】encode 每個字串前加 "len#"，decode 解析長度後切片。
// 【複雜度】時間：O(N)  空間：O(N)

import Foundation

class Codec {
    func encode(_ strs: [String]) -> String {
        var result = ""
        for s in strs {
            result += "\(s.count)#\(s)"
        }
        return result
    }

    func decode(_ s: String) -> [String] {
        var result = [String]()
        let chars = Array(s)
        var i = 0
        while i < chars.count {
            var j = i
            while chars[j] != "#" { j += 1 }
            let length = Int(String(chars[i..<j]))!
            let start = j + 1
            let end = start + length
            result.append(String(chars[start..<end]))
            i = end
        }
        return result
    }
}

func checkArr(_ actual: [String], _ expected: [String], _ name: String) {
    if actual == expected { print("✓ \(name)") }
    else { print("✗ \(name): expected \(expected) but got \(actual)") }
}

let codec = Codec()
let cases: [[String]] = [
    ["lint", "code", "love", "you"],
    ["we", "say", ":", "yes"],
    [""],
    [],
    ["", ""],
    ["#", "1#", "abc#def", "##"],
    [String(repeating: "a", count: 100), String(repeating: "b", count: 50)],
]
for (i, c) in cases.enumerated() {
    let decoded = codec.decode(codec.encode(c))
    checkArr(decoded, c, "Test \(i + 1)")
}

print("All tests passed!")
