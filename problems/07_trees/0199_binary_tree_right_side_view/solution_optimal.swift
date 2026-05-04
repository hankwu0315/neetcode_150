// Problem: 0199. Binary Tree Right Side View
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
    func rightSideView(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var out: [Int] = []
        var q: [TreeNode] = [root]
        while !q.isEmpty {
            var nx: [TreeNode] = []
            for n in q {
                if let l = n.left { nx.append(l) }
                if let r = n.right { nx.append(r) }
            }
            out.append(q.last!.val)
            q = nx
        }
        return out
    }
}

func checkArr(_ a: [Int], _ e: [Int], _ msg: String) {
    if a != e { fatalError("FAIL \(msg): \(a) vs \(e)") }
}

let sol = Solution()
checkArr(sol.rightSideView(fromLevel([1, 2, 3, nil, 5, nil, 4])), [1, 3, 4], "ex1")
checkArr(sol.rightSideView(fromLevel([1, nil, 3])), [1, 3], "ex2")
checkArr(sol.rightSideView(fromLevel([])), [], "empty")
checkArr(sol.rightSideView(fromLevel([1, 2])), [1, 2], "left only")
checkArr(sol.rightSideView(fromLevel([1, 2, 3, 4])), [1, 3, 4], "mixed")
print("All tests passed!")
