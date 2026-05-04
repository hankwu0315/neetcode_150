// Problem: 0002. Add Two Numbers
// Difficulty: Medium

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
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let d = ListNode(); var t = d
        var a = l1, b = l2; var c = 0
        while a != nil || b != nil || c > 0 {
            var s = c
            if a != nil { s += a!.val; a = a!.next }
            if b != nil { s += b!.val; b = b!.next }
            c = s / 10
            t.next = ListNode(s % 10); t = t.next!
        }
        return d.next
    }
}

func checkArr(_ a: [Int], _ e: [Int], _ msg: String) {
    if a != e { fatalError("FAIL \(msg)") }
}

let sol = Solution()
checkArr(toArr(sol.addTwoNumbers(fromArr([2, 4, 3]), fromArr([5, 6, 4]))), [7, 0, 8], "ex1")
checkArr(toArr(sol.addTwoNumbers(fromArr([0]), fromArr([0]))), [0], "zero")
checkArr(toArr(sol.addTwoNumbers(fromArr([9, 9, 9, 9, 9, 9, 9]), fromArr([9, 9, 9, 9]))), [8, 9, 9, 9, 0, 0, 0, 1], "ex3")
checkArr(toArr(sol.addTwoNumbers(fromArr([5]), fromArr([5]))), [0, 1], "carry")
print("All tests passed!")
