// Problem: 0739. Daily Temperatures
// Difficulty: Medium
// URL: https://leetcode.com/problems/daily-temperatures/
//
// 最佳解：單調遞減堆疊。O(n) / O(n)。

List<int> dailyTemperatures(List<int> temperatures) {
  final n = temperatures.length;
  final ans = List<int>.filled(n, 0);
  final stack = <int>[];
  for (int i = 0; i < n; i++) {
    while (stack.isNotEmpty && temperatures[stack.last] < temperatures[i]) {
      final j = stack.removeLast();
      ans[j] = i - j;
    }
    stack.add(i);
  }
  return ans;
}

List<int> dailyTemperaturesBrute(List<int> temperatures) {
  final n = temperatures.length;
  final ans = List<int>.filled(n, 0);
  for (int i = 0; i < n; i++) {
    for (int j = i + 1; j < n; j++) {
      if (temperatures[j] > temperatures[i]) {
        ans[i] = j - i;
        break;
      }
    }
  }
  return ans;
}

void _expect(List<int> a, List<int> e, String msg) {
  if (a.length != e.length) throw StateError('FAIL $msg: len');
  for (int i = 0; i < a.length; i++) {
    if (a[i] != e[i]) throw StateError('FAIL $msg @$i: $a vs $e');
  }
}

void main() {
  for (final fn in [dailyTemperatures, dailyTemperaturesBrute]) {
    _expect(fn([73, 74, 75, 71, 69, 72, 76, 73]), [1, 1, 4, 2, 1, 1, 0, 0], 'ex1');
    _expect(fn([30, 40, 50, 60]), [1, 1, 1, 0], 'ex2');
    _expect(fn([30, 60, 90]), [1, 1, 0], 'ex3');
    _expect(fn([90, 80, 70]), [0, 0, 0], 'desc');
    _expect(fn([50]), [0], 'single');
    _expect(fn([55, 55, 55, 60]), [3, 2, 1, 0], 'dup');
  }
  print('All tests passed!');
}
