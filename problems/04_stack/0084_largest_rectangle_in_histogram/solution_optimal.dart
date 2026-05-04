// Problem: 0084. Largest Rectangle in Histogram
// Difficulty: Hard
// URL: https://leetcode.com/problems/largest-rectangle-in-histogram/
//
// 最佳解：單調遞增堆疊 + sentinel。O(n) / O(n)。

int largestRectangleArea(List<int> heights) {
  final stack = <int>[];
  final n = heights.length;
  int best = 0;
  for (int i = 0; i <= n; i++) {
    final cur = (i == n) ? 0 : heights[i];
    while (stack.isNotEmpty && heights[stack.last] > cur) {
      final top = stack.removeLast();
      final h = heights[top];
      final w = stack.isEmpty ? i : i - stack.last - 1;
      if (h * w > best) best = h * w;
    }
    stack.add(i);
  }
  return best;
}

int largestRectangleAreaBrute(List<int> heights) {
  final n = heights.length;
  int best = 0;
  for (int i = 0; i < n; i++) {
    final h = heights[i];
    int l = i, r = i;
    while (l > 0 && heights[l - 1] >= h) l--;
    while (r < n - 1 && heights[r + 1] >= h) r++;
    final area = h * (r - l + 1);
    if (area > best) best = area;
  }
  return best;
}

void _expect(int a, int e, String msg) {
  if (a != e) throw StateError('FAIL $msg: $a vs $e');
}

void main() {
  for (final fn in [largestRectangleArea, largestRectangleAreaBrute]) {
    _expect(fn([2, 1, 5, 6, 2, 3]), 10, 'ex1');
    _expect(fn([2, 4]), 4, 'ex2');
    _expect(fn([1]), 1, 'single');
    _expect(fn([2, 1, 2]), 3, 'valley');
    _expect(fn([3, 3, 3, 3]), 12, 'flat');
    _expect(fn([1, 2, 3, 4, 5]), 9, 'asc');
    _expect(fn([5, 4, 3, 2, 1]), 9, 'desc');
    _expect(fn([0, 9]), 9, 'zero');
    _expect(fn([2, 0, 2]), 2, 'gap');
  }
  print('All tests passed!');
}
