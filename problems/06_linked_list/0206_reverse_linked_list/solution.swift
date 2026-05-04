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
        var prev: ListNode? = nil
        var cur = head
        while cur != nil {
            let nxt = cur!.next
            cur!.next = prev
            prev = cur
            cur = nxt
        }
        return prev
    }
}

func checkArr(_ a: [Int], _ e: [Int], _ msg: String) {
    if a != e { fatalError("FAIL \(msg): \(a) vs \(e)") }
}

let sol = Solution()
checkArr(toArr(sol.reverseList(fromArr([1, 2, 3, 4, 5]))), [5, 4, 3, 2, 1], "ex1")
checkArr(toArr(sol.reverseList(fromArr([1, 2]))), [2, 1], "ex2")
checkArr(toArr(sol.reverseList(fromArr([]))), [], "empty")
checkArr(toArr(sol.reverseList(fromArr([7]))), [7], "single")
print("All tests passed!")
