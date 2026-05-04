// Problem: 0208. Implement Trie (Prefix Tree)
// Difficulty: Medium

import Foundation

final class TrieNode {
    var ch: [Character: TrieNode] = [:]
    var end: Bool = false
}

class Trie {
    private let root = TrieNode()
    init() {}
    func insert(_ word: String) {
        var n = root
        for c in word {
            if let nxt = n.ch[c] { n = nxt }
            else { let x = TrieNode(); n.ch[c] = x; n = x }
        }
        n.end = true
    }
    private func walk(_ s: String) -> TrieNode? {
        var n = root
        for c in s {
            guard let nxt = n.ch[c] else { return nil }
            n = nxt
        }
        return n
    }
    func search(_ w: String) -> Bool {
        if let n = walk(w) { return n.end }
        return false
    }
    func startsWith(_ p: String) -> Bool { walk(p) != nil }
}

func checkBool(_ a: Bool, _ e: Bool, _ msg: String) {
    if a != e { fatalError("FAIL \(msg)") }
}

let t = Trie()
t.insert("apple")
checkBool(t.search("apple"), true, "apple in")
checkBool(t.search("app"), false, "app not in")
checkBool(t.startsWith("app"), true, "app prefix")
t.insert("app")
checkBool(t.search("app"), true, "app now in")
checkBool(t.startsWith("appl"), true, "appl prefix")
checkBool(t.search("appl"), false, "appl not word")
checkBool(t.startsWith("b"), false, "b not prefix")
print("All tests passed!")
