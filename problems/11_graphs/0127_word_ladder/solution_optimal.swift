// Problem: 0127. Word Ladder
// Difficulty: Hard

import Foundation

class Solution {
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        let ws = Set(wordList)
        if !ws.contains(endWord) { return 0 }
        let L = beginWord.count
        var buckets: [String: [String]] = [:]
        func keyOf(_ w: [Character], _ i: Int) -> String {
            var c = w
            c[i] = "*"
            return String(c)
        }
        func addWord(_ w: String) {
            let arr = Array(w)
            for i in 0..<L {
                let k = keyOf(arr, i)
                buckets[k, default: []].append(w)
            }
        }
        addWord(beginWord)
        for w in ws where w != beginWord { addWord(w) }
        var visited: Set<String> = [beginWord]
        var q: [(String, Int)] = [(beginWord, 1)]
        var head = 0
        while head < q.count {
            let p = q[head]; head += 1
            let arr = Array(p.0)
            for i in 0..<L {
                let k = keyOf(arr, i)
                guard let lst = buckets[k] else { continue }
                for nb in lst {
                    if nb == endWord { return p.1 + 1 }
                    if !visited.contains(nb) {
                        visited.insert(nb)
                        q.append((nb, p.1 + 1))
                    }
                }
                buckets[k] = []
            }
        }
        return 0
    }
}

func checkInt(_ a: Int, _ e: Int, _ msg: String) {
    if a != e { fatalError("FAIL \(msg): \(a) vs \(e)") }
}

let sol = Solution()
checkInt(sol.ladderLength("hit", "cog", ["hot", "dot", "dog", "lot", "log", "cog"]), 5, "a")
checkInt(sol.ladderLength("hit", "cog", ["hot", "dot", "dog", "lot", "log"]), 0, "b")
checkInt(sol.ladderLength("a", "c", ["a", "b", "c"]), 2, "c")
checkInt(sol.ladderLength("hot", "dog", ["hot", "dog"]), 0, "d")
checkInt(sol.ladderLength("hot", "dog", ["hot", "dog", "dot"]), 3, "e")
checkInt(sol.ladderLength("leet", "code",
    ["lest", "leet", "lose", "code", "lode", "robe", "lost"]), 6, "f")
print("All tests passed!")
