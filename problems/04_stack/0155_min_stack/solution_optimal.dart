// Problem: 0155. Min Stack
// Difficulty: Medium
// URL: https://leetcode.com/problems/min-stack/
//
// 最佳解：主堆疊 + min 輔助堆疊，每個操作 O(1)。

class MinStack {
  final List<int> _stack = [];
  final List<int> _min = [];

  void push(int val) {
    _stack.add(val);
    if (_min.isEmpty || val <= _min.last) _min.add(val);
  }

  void pop() {
    final v = _stack.removeLast();
    if (v == _min.last) _min.removeLast();
  }

  int top() => _stack.last;
  int getMin() => _min.last;
}

void _expect(int a, int e, String msg) {
  if (a != e) throw StateError('FAIL $msg: $a vs $e');
}

void main() {
  final ms = MinStack();
  ms.push(-2);
  ms.push(0);
  ms.push(-3);
  _expect(ms.getMin(), -3, 'min1');
  ms.pop();
  _expect(ms.top(), 0, 'top');
  _expect(ms.getMin(), -2, 'min2');

  final ms2 = MinStack();
  ms2.push(1);
  ms2.push(1);
  ms2.push(1);
  _expect(ms2.getMin(), 1, 'rep min1');
  ms2.pop();
  _expect(ms2.getMin(), 1, 'rep min2');

  final ms3 = MinStack();
  ms3.push(5);
  _expect(ms3.top(), 5, 'single top');
  _expect(ms3.getMin(), 5, 'single min');

  print('All tests passed!');
}
