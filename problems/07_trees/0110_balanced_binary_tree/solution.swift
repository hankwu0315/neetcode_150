// Problem: 0110. Balanced Binary Tree
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
    func isBalanced(_ root: TreeNode?) -> Bool {
        func depth(_ n: TreeNode?) -> Int {
            guard let n = n else { return 0 }
            let L = depth(n.left)
            if L == -1 { return -1 }
            let R = depth(n.right)
            if R == -1 || abs(L - R) > 1 { return -1 }
            return 1 + max(L, R)
        }
        return depth(root) != -1
    }
}

func checkBool(_ a: Bool, _ e: Bool, _ msg: String) {
    if a != e { fatalError("FAIL \(msg)") }
}

let sol = Solution()
checkBool(sol.isBalanced(fromLevel([3, 9, 20, nil, nil, 15, 7])), true, "ex1")
checkBool(sol.isBalanced(fromLevel([1, 2, 2, 3, 3, nil, nil, 4, 4])), false, "ex2")
checkBool(sol.isBalanced(fromLevel([])), true, "empty")
checkBool(sol.isBalanced(fromLevel([1])), true, "one")
checkBool(sol.isBalanced(fromLevel([1, 2, nil, 3, nil, 4])), false, "skew")
print("All tests passed!")
