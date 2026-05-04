// 0057. Insert Interval
import 'dart:math';
List<List<int>> insertInterval(List<List<int>> intervals, List<int> ni) {
  final res = <List<int>>[];
  var i = 0; final n = intervals.length;
  while (i < n && intervals[i][1] < ni[0]) { res.add(intervals[i]); i++; }
  var s = ni[0], e = ni[1];
  while (i < n && intervals[i][0] <= e) {
    s = min(s, intervals[i][0]);
    e = max(e, intervals[i][1]);
    i++;
  }
  res.add([s, e]);
  while (i < n) { res.add(intervals[i]); i++; }
  return res;
}
bool eq(List<List<int>> a, List<List<int>> b) {
  if (a.length != b.length) return false;
  for (var i = 0; i < a.length; i++) {
    if (a[i].length != b[i].length) return false;
    for (var j = 0; j < a[i].length; j++) if (a[i][j] != b[i][j]) return false;
  }
  return true;
}
void main() {
  if (!eq(insertInterval([[1, 3], [6, 9]], [2, 5]), [[1, 5], [6, 9]])) throw 'a';
  if (!eq(insertInterval([[1, 2], [3, 5], [6, 7], [8, 10], [12, 16]], [4, 8]), [[1, 2], [3, 10], [12, 16]])) throw 'b';
  if (!eq(insertInterval([], [5, 7]), [[5, 7]])) throw 'c';
  if (!eq(insertInterval([[1, 5]], [2, 3]), [[1, 5]])) throw 'd';
  if (!eq(insertInterval([[1, 5]], [6, 8]), [[1, 5], [6, 8]])) throw 'e';
  if (!eq(insertInterval([[1, 5]], [0, 0]), [[0, 0], [1, 5]])) throw 'f';
  print('All tests passed!');
}
