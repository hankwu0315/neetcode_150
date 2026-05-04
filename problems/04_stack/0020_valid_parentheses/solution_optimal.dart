// Problem: 0020. Valid Parentheses
// Difficulty: Easy
// URL: https://leetcode.com/problems/valid-parentheses/
//
// 最佳解：堆疊。O(n) / O(n)。

bool isValid(String s) {
  final pairs = <String, String>{')': '(', ']': '[', '}': '{'};
  final stack = <String>[];
  for (final ch in s.split('')) {
    if (pairs.containsKey(ch)) {
      if (stack.isEmpty || stack.last != pairs[ch]) return false;
      stack.removeLast();
    } else {
      stack.add(ch);
    }
  }
  return stack.isEmpty;
}

bool isValidBrute(String s) {
  String prev = '';
  while (prev != s) {
    prev = s;
    s = s.replaceAll('()', '').replaceAll('[]', '').replaceAll('{}', '');
  }
  return s.isEmpty;
}

void _expect(bool actual, bool expected, String msg) {
  if (actual != expected) {
    throw StateError('FAIL $msg: got $actual, expected $expected');
  }
}

void main() {
  for (final fn in [isValid, isValidBrute]) {
    _expect(fn('()'), true, '()');
    _expect(fn('()[]{}'), true, '()[]{}');
    _expect(fn('(]'), false, '(]');
    _expect(fn('([)]'), false, '([)]');
    _expect(fn('{[]}'), true, '{[]}');
    _expect(fn(''), true, 'empty');
    _expect(fn('('), false, '(');
  }
  print('All tests passed!');
}
