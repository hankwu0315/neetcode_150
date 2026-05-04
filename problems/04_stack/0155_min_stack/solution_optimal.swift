// Problem: 0155. Min Stack
// Difficulty: Medium
// URL: https://leetcode.com/problems/min-stack/
//
// 最佳解：兩個堆疊，每個操作 O(1)。

import Foundation

class MinStack {
    private var stack: [Int] = []
    private var minStack: [Int] = []

    func push(_ val: Int) {
        stack.append(val)
        if minStack.isEmpty || val <= minStack.last! {
            minStack.append(val)
        }
    }

    func pop() {
        let v = stack.removeLast()
        if v == minStack.last! { minStack.removeLast() }
    }

    func top() -> Int { stack.last! }
    func getMin() -> Int { minStack.last! }
}

func checkInt(_ a: Int, _ e: Int, _ msg: String) {
    if a != e { fatalError("FAIL \(msg): \(a) vs \(e)") }
}

let ms = MinStack()
ms.push(-2); ms.push(0); ms.push(-3)
checkInt(ms.getMin(), -3, "min1")
ms.pop()
checkInt(ms.top(), 0, "top")
checkInt(ms.getMin(), -2, "min2")

let ms2 = MinStack()
ms2.push(1); ms2.push(1); ms2.push(1)
checkInt(ms2.getMin(), 1, "rep1")
ms2.pop()
checkInt(ms2.getMin(), 1, "rep2")

let ms3 = MinStack()
ms3.push(5)
checkInt(ms3.top(), 5, "single top")
checkInt(ms3.getMin(), 5, "single min")
print("All tests passed!")
