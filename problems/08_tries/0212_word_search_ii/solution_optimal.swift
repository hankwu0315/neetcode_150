// Problem: 0212. Word Search II
// Difficulty: Hard

import Foundation

final class WSNode {
    var ch: [Character: WSNode] = [:]
    var word: String? = nil
}

func buildWS(_ words: [String]) -> WSNode {
    let root = WSNode()
    for w in words {
        var n = root
        for c in w {
            if let nx = n.ch[c] { n = nx }
            else { let x = WSNode(); n.ch[c] = x; n = x }
        }
        n.word = w
    }
    return root
}

class Solution {
    func findWords(_ board: [[Character]], _ words: [String]) -> [String] {
        if board.isEmpty || board[0].isEmpty { return [] }
        var b = board
        let root = buildWS(words)
        let m = b.count, n = b[0].count
        var out: [String] = []
        let dirs = [(-1, 0), (1, 0), (0, -1), (0, 1)]
        func dfs(_ r: Int, _ c: Int, _ node: WSNode) {
            let ch = b[r][c]
            guard let nxt = node.ch[ch] else { return }
            if let w = nxt.word { out.append(w); nxt.word = nil }
            b[r][c] = "#"
            for (dr, dc) in dirs {
                let nr = r + dr, nc = c + dc
                if nr >= 0 && nr < m && nc >= 0 && nc < n && b[nr][nc] != "#" {
                    dfs(nr, nc, nxt)
                }
            }
            b[r][c] = ch
            if nxt.ch.isEmpty { node.ch.removeValue(forKey: ch) }
        }
        for r in 0..<m {
            for c in 0..<n { dfs(r, c, root) }
        }
        return out
    }
}

func toCharGrid(_ a: [[String]]) -> [[Character]] {
    a.map { $0.map { Character($0) } }
}

let sol = Solution()
let b1 = toCharGrid([["o", "a", "a", "n"], ["e", "t", "a", "e"], ["i", "h", "k", "r"], ["i", "f", "l", "v"]])
var r1 = sol.findWords(b1, ["oath", "pea", "eat", "rain"]).sorted()
if r1 != ["eat", "oath"] { fatalError("ex1 \(r1)") }
if !sol.findWords(toCharGrid([["a", "b"], ["c", "d"]]), ["abcb"]).isEmpty { fatalError("ex2") }
let r3 = sol.findWords(toCharGrid([["a"]]), ["a"])
if r3 != ["a"] { fatalError("ex3") }
if !sol.findWords(toCharGrid([["a", "a"]]), ["aaa"]).isEmpty { fatalError("ex4") }
let r5 = Set(sol.findWords(toCharGrid([["a", "b", "c"], ["a", "e", "d"], ["a", "f", "g"]]), ["abcdefg", "befa", "xyz"]))
if !r5.contains("abcdefg") || !r5.contains("befa") { fatalError("ex5 \(r5)") }
print("All tests passed!")
