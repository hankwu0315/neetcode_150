// Problem: 0090. Subsets II
// Difficulty: Medium

List<List<int>> subsetsWithDup(List<int> nums) {
  final a = List<int>.from(nums)..sort();
  final n = a.length;
  final out = <List<int>>[];
  final path = <int>[];
  void dfs(int i) {
    out.add(List<int>.from(path));
    for (var j = i; j < n; j++) {
      if (j > i && a[j] == a[j - 1]) continue;
      path.add(a[j]);
      dfs(j + 1);
      path.removeLast();
    }
  }
  dfs(0);
  return out;
}

List<List<int>> _norm(List<List<int>> xs) {
  final r = xs.map((s) { final c = List<int>.from(s); c.sort(); return c; }).toList();
  r.sort((a, b) {
    if (a.length != b.length) return a.length - b.length;
    for (var i = 0; i < a.length; i++) if (a[i] != b[i]) return a[i] - b[i];
    return 0;
  });
  return r;
}

bool _eqLL(List<List<int>> a, List<List<int>> b) {
  if (a.length != b.length) return false;
  for (var i = 0; i < a.length; i++) {
    if (a[i].length != b[i].length) return false;
    for (var j = 0; j < a[i].length; j++) if (a[i][j] != b[i][j]) return false;
  }
  return true;
}

void main() {
  if (!_eqLL(_norm(subsetsWithDup([1, 2, 2])),
      _norm([[], [1], [1, 2], [1, 2, 2], [2], [2, 2]]))) throw 'a';
  if (!_eqLL(_norm(subsetsWithDup([0])), _norm([[], [0]]))) throw 'b';
  if (!_eqLL(_norm(subsetsWithDup([])), _norm([[]]))) throw 'c';
  if (!_eqLL(_norm(subsetsWithDup([1, 1])), _norm([[], [1], [1, 1]]))) throw 'd';
  if (subsetsWithDup([1, 2, 2, 3]).length != 12) throw 'e';
  print('All tests passed!');
}
