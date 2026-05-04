// 1851. Minimum Interval to Include Each Query
class _Heap {
  final List<List<int>> a = [];
  bool get isEmpty => a.isEmpty;
  List<int> peek() => a[0];
  void push(List<int> v) {
    a.add(v); var i = a.length - 1;
    while (i > 0) {
      final p = (i - 1) >> 1;
      if (a[p][0] > a[i][0]) { final t = a[p]; a[p] = a[i]; a[i] = t; i = p; } else break;
    }
  }
  List<int> pop() {
    final r = a[0]; final last = a.removeLast();
    if (a.isNotEmpty) {
      a[0] = last; var i = 0; final n = a.length;
      while (true) {
        var l = 2 * i + 1, ri = 2 * i + 2, s = i;
        if (l < n && a[l][0] < a[s][0]) s = l;
        if (ri < n && a[ri][0] < a[s][0]) s = ri;
        if (s == i) break;
        final t = a[s]; a[s] = a[i]; a[i] = t; i = s;
      }
    }
    return r;
  }
}
List<int> minInterval(List<List<int>> intervals, List<int> queries) {
  final a = [...intervals]; a.sort((x, y) => x[0].compareTo(y[0]));
  final order = List<int>.generate(queries.length, (i) => i)
    ..sort((x, y) => queries[x].compareTo(queries[y]));
  final res = List<int>.filled(queries.length, -1);
  final heap = _Heap();
  var i = 0;
  for (final idx in order) {
    final q = queries[idx];
    while (i < a.length && a[i][0] <= q) {
      heap.push([a[i][1] - a[i][0] + 1, a[i][1]]);
      i++;
    }
    while (!heap.isEmpty && heap.peek()[1] < q) heap.pop();
    if (!heap.isEmpty) res[idx] = heap.peek()[0];
  }
  return res;
}
bool eq(List<int> a, List<int> b) {
  if (a.length != b.length) return false;
  for (var i = 0; i < a.length; i++) if (a[i] != b[i]) return false;
  return true;
}
void main() {
  if (!eq(minInterval([[1, 4], [2, 4], [3, 6], [4, 4]], [2, 3, 4, 5]), [3, 3, 1, 4])) throw 'a';
  if (!eq(minInterval([[2, 3], [2, 5], [1, 8], [20, 25]], [2, 19, 5, 22]), [2, -1, 4, 6])) throw 'b';
  if (!eq(minInterval([[1, 4]], [1, 4, 5]), [4, 4, -1])) throw 'c';
  if (!eq(minInterval([], [1, 2]), [-1, -1])) throw 'd';
  if (!eq(minInterval([[1, 10]], [0, 5, 11]), [-1, 10, -1])) throw 'e';
  print('All tests passed!');
}
