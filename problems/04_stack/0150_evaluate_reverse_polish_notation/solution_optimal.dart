// Problem: 0150. Evaluate Reverse Polish Notation
// Difficulty: Medium
// URL: https://leetcode.com/problems/evaluate-reverse-polish-notation/
//
// 最佳解：堆疊掃描，除法向 0 截斷（Dart 的 ~/ 即為向 0 截斷）。

int evalRPN(List<String> tokens) {
  final stack = <int>[];
  for (final t in tokens) {
    if (t == '+' || t == '-' || t == '*' || t == '/') {
      final b = stack.removeLast();
      final a = stack.removeLast();
      switch (t) {
        case '+':
          stack.add(a + b);
          break;
        case '-':
          stack.add(a - b);
          break;
        case '*':
          stack.add(a * b);
          break;
        case '/':
          stack.add(a ~/ b); // Dart 的 ~/ 對負數向 0 截斷
          break;
      }
    } else {
      stack.add(int.parse(t));
    }
  }
  return stack[0];
}

void _expect(int actual, int expected, String msg) {
  if (actual != expected) {
    throw StateError('FAIL $msg: got $actual, expected $expected');
  }
}

void main() {
  _expect(evalRPN(['2', '1', '+', '3', '*']), 9, 'ex1');
  _expect(evalRPN(['4', '13', '5', '/', '+']), 6, 'ex2');
  _expect(
    evalRPN(['10', '6', '9', '3', '+', '-11', '*', '/', '*', '17', '+', '5', '+']),
    22,
    'ex3',
  );
  _expect(evalRPN(['6', '-132', '/']), 0, 'trunc');
  _expect(evalRPN(['-7', '2', '/']), -3, 'neg trunc');
  _expect(evalRPN(['3']), 3, 'single');
  print('All tests passed!');
}
