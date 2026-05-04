// Problem: 0021. Merge Two Sorted Lists
// Difficulty: Easy

import Foundation

class ListNode {
    var val: Int; var next: ListNode?
    init(_ v: Int = 0, _ n: ListNode? = nil) { val = v; next = n }
}

func fromArr(_ a: [Int]) -> ListNode? {
    let d = ListNode(); var c = d
    for v in a { c.next = ListNode(v); c = c.next! }
    return d.next
}

func toArr(_ h: ListNode?) -> [Int] {
    var out: [Int] = []; var p = h
    while p != nil { out.append(p!.val); p = p!.next }
    return out
}

class Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let d = ListNode(); var t = d
        var a = l1, b = l2
        while a != nil && b != nil {
            if a!.val <= b!.val { t.next = a; a = a!.next } else { t.next = b; b = b!.next }
            t = t.next!
        }
        t.next = a ?? b
        return d.next
    }
}

func checkArr(_ a: [Int], _ e: [Int], _ msg: String) {
    if a != e { fatalError("FAIL \(msg): \(a) vs \(e)") }
}

let sol = Solution()
checkArr(toArr(sol.mergeTwoLists(fromArr([1, 2, 4]), fromArr([1, 3, 4]))), [1, 1, 2, 3, 4, 4], "ex1")
checkArr(toArr(sol.mergeTwoLists(fromArr([]), fromArr([]))), [], "empty")
checkArr(toArr(sol.mergeTwoLists(fromArr([]), fromArr([0]))), [0], "left empty")
checkArr(toArr(sol.mergeTwoLists(fromArr([5]), fromArr([1, 2, 3]))), [1, 2, 3, 5], "tail")
print("All tests passed!")
