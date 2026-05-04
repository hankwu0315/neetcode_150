// Problem: 0040. Combination Sum II
// Difficulty: Medium

List<List<int>> combinationSum2(List<int> candidates, int target) {
  final c = List<int>.from(candidates)..sort();
  final out = <List<int>>[];
  final path = <int>[];
  final n = c.length;
  void dfs(int i, int remain) {
    if (remain == 0) {
      out.add(List<int>.from(path));
      return;
    }
    for (var j = i; j < n; j++) {
      if (j > i && c[j] == c[j - 1]) continue;
      if (c[j] > remain) break;
      path.add(c[j]);
      dfs(j + 1, remain - c[j]);
      path.removeLast();
    }
  }
  dfs(0, target);
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
  if (!_eqLL(_norm(combinationSum2([10, 1, 2, 7, 6, 1, 5], 8)),
      _norm([[1, 1, 6], [1, 2, 5], [1, 7], [2, 6]]))) throw 'a';
  if (!_eqLL(_norm(combinationSum2([2, 5, 2, 1, 2], 5)),
      _norm([[1, 2, 2], [5]]))) throw 'b';
  if (combinationSum2([1, 1, 1], 5).isNotEmpty) throw 'c';
  if (!_eqLL(_norm(combinationSum2([1, 1, 1], 2)), _norm([[1, 1]]))) throw 'd';
  if (!_eqLL(_norm(combinationSum2([4, 4, 2, 1, 4, 2, 2, 1, 3], 6)),
      _norm([[1, 1, 4], [1, 2, 3], [2, 4], [2, 2, 2], [1, 1, 2, 2]]))) throw 'e';
  print('All tests passed!');
}
