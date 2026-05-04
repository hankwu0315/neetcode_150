// Problem: 0074. Search a 2D Matrix
// Difficulty: Medium
// 一維二分。O(log(m*n))。

bool searchMatrix(List<List<int>> matrix, int target) {
  if (matrix.isEmpty || matrix[0].isEmpty) return false;
  final m = matrix.length, n = matrix[0].length;
  int l = 0, r = m * n - 1;
  while (l <= r) {
    final mid = l + (r - l) ~/ 2;
    final v = matrix[mid ~/ n][mid % n];
    if (v == target) return true;
    if (v < target) {
      l = mid + 1;
    } else {
      r = mid - 1;
    }
  }
  return false;
}

void _expect(bool a, bool e, String msg) {
  if (a != e) throw StateError('FAIL $msg');
}

void main() {
  final m = [
    [1, 3, 5, 7],
    [10, 11, 16, 20],
    [23, 30, 34, 60],
  ];
  _expect(searchMatrix(m, 3), true, '3');
  _expect(searchMatrix(m, 13), false, '13');
  _expect(searchMatrix(m, 1), true, '1');
  _expect(searchMatrix(m, 60), true, '60');
  _expect(searchMatrix(m, 0), false, '0');
  _expect(searchMatrix(m, 100), false, '100');
  _expect(searchMatrix([
    [5]
  ], 5), true, 'single hit');
  _expect(searchMatrix([
    [5]
  ], 3), false, 'single miss');
  print('All tests passed!');
}
