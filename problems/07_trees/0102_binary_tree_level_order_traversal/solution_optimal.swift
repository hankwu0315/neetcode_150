// Problem: 0102. Binary Tree Level Order Traversal
// Difficulty: Medium

import Foundation

class TreeNode {
    var val: Int; var left: TreeNode?; var right: TreeNode?
    init(_ v: Int = 0, _ l: TreeNode? = nil, _ r: TreeNode? = nil) { val = v; left = l; right = r }
}

func fromLevel(_ a: [Int?]) -> TreeNode? {
    if a.isEmpty { return nil }
    let root = TreeNode(a[0]!); var q = [root]; var qi = 0, i = 1
    while qi < q.count && i < a.count {
        let n = q[qi]; qi += 1
        if i < a.count, let v = a[i] { n.left = TreeNode(v); q.append(n.left!) }
        i += 1
        if i < a.count, let v = a[i] { n.right = TreeNode(v); q.append(n.right!) }
        i += 1
    }
    return root
}

class Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        var out: [[Int]] = []
        var q: [TreeNode] = [root]
        while !q.isEmpty {
            var layer: [Int] = []
            var nx: [TreeNode] = []
            for n in q {
                layer.append(n.val)
                if let l = n.left { nx.append(l) }
                if let r = n.right { nx.append(r) }
            }
            out.append(layer)
            q = nx
        }
        return out
    }
}

func eq(_ a: [[Int]], _ b: [[Int]]) -> Bool { a.count == b.count && zip(a, b).allSatisfy { $0 == $1 } }

let sol = Solution()
if !eq(sol.levelOrder(fromLevel([3, 9, 20, nil, nil, 15, 7])), [[3], [9, 20], [15, 7]]) { fatalError("ex1") }
if !eq(sol.levelOrder(fromLevel([1])), [[1]]) { fatalError("one") }
if !eq(sol.levelOrder(fromLevel([])), []) { fatalError("empty") }
if !eq(sol.levelOrder(fromLevel([1, 2, 3, 4, 5, 6, 7])), [[1], [2, 3], [4, 5, 6, 7]]) { fatalError("full") }
print("All tests passed!")
