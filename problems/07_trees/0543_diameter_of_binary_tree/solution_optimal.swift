// Problem: 0543. Diameter of Binary Tree
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
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        var ans = 0
        func depth(_ n: TreeNode?) -> Int {
            guard let n = n else { return 0 }
            let L = depth(n.left), R = depth(n.right)
            if L + R > ans { ans = L + R }
            return 1 + max(L, R)
        }
        _ = depth(root)
        return ans
    }
}

func checkInt(_ a: Int, _ e: Int, _ msg: String) {
    if a != e { fatalError("FAIL \(msg): \(a) vs \(e)") }
}

let sol = Solution()
checkInt(sol.diameterOfBinaryTree(fromLevel([1, 2, 3, 4, 5])), 3, "ex1")
checkInt(sol.diameterOfBinaryTree(fromLevel([1, 2])), 1, "ex2")
checkInt(sol.diameterOfBinaryTree(fromLevel([])), 0, "empty")
checkInt(sol.diameterOfBinaryTree(fromLevel([1])), 0, "one")
checkInt(sol.diameterOfBinaryTree(fromLevel([1, 2, nil, 3, nil, 4, nil, 5])), 4, "skew")
print("All tests passed!")
