// 0435. Non-overlapping Intervals
int eraseOverlapIntervals(List<List<int>> intervals) {
  final a = [...intervals];
  a.sort((x, y) => x[1].compareTo(y[1]));
  var end = -1 << 62;
  var kept = 0;
  for (final iv in a) {
    if (iv[0] >= end) { kept++; end = iv[1]; }
  }
  return a.length - kept;
}
void main() {
  if (eraseOverlapIntervals([[1, 2], [2, 3], [3, 4], [1, 3]]) != 1) throw 'a';
  if (eraseOverlapIntervals([[1, 2], [1, 2], [1, 2]]) != 2) throw 'b';
  if (eraseOverlapIntervals([[1, 2], [2, 3]]) != 0) throw 'c';
  if (eraseOverlapIntervals([]) != 0) throw 'd';
  if (eraseOverlapIntervals([[1, 100], [11, 22], [1, 11], [2, 12]]) != 2) throw 'e';
  print('All tests passed!');
}
