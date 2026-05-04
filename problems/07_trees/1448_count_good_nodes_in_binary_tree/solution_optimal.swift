// Problem: 1448. Count Good Nodes in Binary Tree
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
    func goodNodes(_ root: TreeNode?) -> Int {
        func dfs(_ n: TreeNode?, _ mx: Int) -> Int {
            guard let n = n else { return 0 }
            let cnt = n.val >= mx ? 1 : 0
            let nmx = max(mx, n.val)
            return cnt + dfs(n.left, nmx) + dfs(n.right, nmx)
        }
        return dfs(root, Int.min)
    }
}

func checkInt(_ a: Int, _ e: Int, _ msg: String) {
    if a != e { fatalError("FAIL \(msg): \(a) vs \(e)") }
}

let sol = Solution()
checkInt(sol.goodNodes(fromLevel([3, 1, 4, 3, nil, 1, 5])), 4, "ex1")
checkInt(sol.goodNodes(fromLevel([3, 3, nil, 4, 2])), 3, "ex2")
checkInt(sol.goodNodes(fromLevel([1])), 1, "one")
checkInt(sol.goodNodes(fromLevel([2, nil, 4, 10, 8, nil, nil, 4])), 4, "ex4")
print("All tests passed!")
