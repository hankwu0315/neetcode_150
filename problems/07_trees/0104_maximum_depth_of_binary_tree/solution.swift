// Problem: 0104. Maximum Depth of Binary Tree
// Difficulty: Easy

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
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        return 1 + max(maxDepth(root.left), maxDepth(root.right))
    }
}

func checkInt(_ a: Int, _ e: Int, _ msg: String) {
    if a != e { fatalError("FAIL \(msg): \(a) vs \(e)") }
}

let sol = Solution()
checkInt(sol.maxDepth(fromLevel([3, 9, 20, nil, nil, 15, 7])), 3, "ex1")
checkInt(sol.maxDepth(fromLevel([1, nil, 2])), 2, "ex2")
checkInt(sol.maxDepth(fromLevel([])), 0, "empty")
checkInt(sol.maxDepth(fromLevel([1])), 1, "one")
checkInt(sol.maxDepth(fromLevel([1, 2, 3, 4, 5])), 3, "ex5")
print("All tests passed!")
