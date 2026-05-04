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
        // TODO: implement
    }

    func pop() {
        // TODO: implement
    }

    func top() -> Int {
        // TODO: implement
        return 0
    }
    func getMin() -> Int {
        // TODO: implement
        return 0
    }
}

func checkInt(_ a: Int, _ e: Int, _ msg: String) {
    if a != e { fatalError("FAIL \(msg): \(a) vs \(e)") }
}

// MARK: - Tests
// let s = Solution()

// Test 1
// let result = s.solve(...)

print("All tests passed!")
