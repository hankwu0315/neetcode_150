// 0054. Spiral Matrix
List<int> spiralOrder(List<List<int>> matrix) {
  final res = <int>[];
  if (matrix.isEmpty || matrix[0].isEmpty) return res;
  var top = 0, bottom = matrix.length - 1, left = 0, right = matrix[0].length - 1;
  while (top <= bottom && left <= right) {
    for (var j = left; j <= right; j++) res.add(matrix[top][j]);
    top++;
    for (var i = top; i <= bottom; i++) res.add(matrix[i][right]);
    right--;
    if (top <= bottom) {
      for (var j = right; j >= left; j--) res.add(matrix[bottom][j]);
      bottom--;
    }
    if (left <= right) {
      for (var i = bottom; i >= top; i--) res.add(matrix[i][left]);
      left++;
    }
  }
  return res;
}
bool eq(List<int> a, List<int> b) {
  if (a.length != b.length) return false;
  for (var i = 0; i < a.length; i++) if (a[i] != b[i]) return false;
  return true;
}
void main() {
  if (!eq(spiralOrder([[1, 2, 3], [4, 5, 6], [7, 8, 9]]), [1, 2, 3, 6, 9, 8, 7, 4, 5])) throw 'a';
  if (!eq(spiralOrder([[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12]]), [1, 2, 3, 4, 8, 12, 11, 10, 9, 5, 6, 7])) throw 'b';
  if (!eq(spiralOrder([[1]]), [1])) throw 'c';
  if (!eq(spiralOrder([[1, 2], [3, 4]]), [1, 2, 4, 3])) throw 'd';
  if (!eq(spiralOrder([[1], [2], [3]]), [1, 2, 3])) throw 'e';
  print('All tests passed!');
}
