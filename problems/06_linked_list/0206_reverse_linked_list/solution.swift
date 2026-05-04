// Problem: 0206. Reverse Linked List
// Difficulty: Easy

import Foundation

class ListNode {
    var val: Int
    var next: ListNode?
    init(_ v: Int = 0, _ n: ListNode? = nil) { val = v; next = n }
}

func fromArr(_ a: [Int]) -> ListNode? {
    let d = ListNode()
    var c = d
    for v in a { c.next = ListNode(v); c = c.next! }
    return d.next
}

func toArr(_ h: ListNode?) -> [Int] {
    var out: [Int] = []
    var p = h
    while p != nil { out.append(p!.val); p = p!.next }
    return out
}

class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        // TODO: implement
        return nil
    }
}

func checkArr(_ a: [Int], _ e: [Int], _ msg: String) {
    if a != e { fatalError("FAIL \(msg): \(a) vs \(e)") }
}

// MARK: - Tests
// let s = Solution()

// Test 1
// let result = s.solve(...)

print("All tests passed!")
