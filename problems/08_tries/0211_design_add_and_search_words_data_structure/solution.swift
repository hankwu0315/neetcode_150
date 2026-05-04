// Problem: 0211. Design Add and Search Words Data Structure
// Difficulty: Medium

import Foundation

final class WDNode {
    var ch: [Character: WDNode] = [:]
    var end: Bool = false
}

class WordDictionary {
    private let root = WDNode()
    init() {}
    func addWord(_ word: String) {
        var n = root
        for c in word {
            if let nx = n.ch[c] { n = nx }
            else { let x = WDNode(); n.ch[c] = x; n = x }
        }
        n.end = true
    }
    func search(_ word: String) -> Bool {
        let arr = Array(word)
        func dfs(_ i: Int, _ n: WDNode) -> Bool {
            if i == arr.count { return n.end }
            let c = arr[i]
            if c == "." {
                for nx in n.ch.values { if dfs(i + 1, nx) { return true } }
                return false
            }
            guard let nx = n.ch[c] else { return false }
            return dfs(i + 1, nx)
        }
        return dfs(0, root)
    }
}

func checkBool(_ a: Bool, _ e: Bool, _ msg: String) {
    if a != e { fatalError("FAIL \(msg)") }
}

let w = WordDictionary()
w.addWord("bad"); w.addWord("dad"); w.addWord("mad")
checkBool(w.search("pad"), false, "pad")
checkBool(w.search("bad"), true, "bad")
checkBool(w.search(".ad"), true, ".ad")
checkBool(w.search("b.."), true, "b..")
checkBool(w.search("b..."), false, "b...")
w.addWord("a")
checkBool(w.search("a"), true, "a")
checkBool(w.search("."), true, ".")
checkBool(w.search("aa"), false, "aa")
print("All tests passed!")
