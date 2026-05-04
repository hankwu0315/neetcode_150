// 0056. Merge Intervals
List<List<int>> mergeIntervals(List<List<int>> intervals) {
  final a = [...intervals];
  a.sort((x, y) => x[0].compareTo(y[0]));
  final res = <List<int>>[];
  for (final iv in a) {
    if (res.isNotEmpty && iv[0] <= res.last[1]) {
      if (iv[1] > res.last[1]) res.last[1] = iv[1];
    } else {
      res.add([iv[0], iv[1]]);
    }
  }
  return res;
}
bool eq(List<List<int>> a, List<List<int>> b) {
  if (a.length != b.length) return false;
  for (var i = 0; i < a.length; i++) {
    if (a[i][0] != b[i][0] || a[i][1] != b[i][1]) return false;
  }
  return true;
}
void main() {
  if (!eq(mergeIntervals([[1, 3], [2, 6], [8, 10], [15, 18]]), [[1, 6], [8, 10], [15, 18]])) throw 'a';
  if (!eq(mergeIntervals([[1, 4], [4, 5]]), [[1, 5]])) throw 'b';
  if (!eq(mergeIntervals([[1, 4]]), [[1, 4]])) throw 'c';
  if (!eq(mergeIntervals([[1, 4], [0, 4]]), [[0, 4]])) throw 'd';
  if (!eq(mergeIntervals([[1, 4], [2, 3]]), [[1, 4]])) throw 'e';
  print('All tests passed!');
}
