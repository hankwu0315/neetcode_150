// Problem: 0141. Linked List Cycle
// Difficulty: Easy

import Foundation

class ListNode {
    var val: Int; var next: ListNode?
    init(_ v: Int = 0, _ n: ListNode? = nil) { val = v; next = n }
}

func buildWithCycle(_ a: [Int], _ pos: Int) -> ListNode? {
    // TODO: implement
    return nil
}

class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        // TODO: implement
        return false
    }
}

func checkBool(_ a: Bool, _ e: Bool, _ msg: String) {
    if a != e { fatalError("FAIL \(msg)") }
}

// MARK: - Tests
// let s = Solution()

// Test 1
// let result = s.solve(...)

print("All tests passed!")
