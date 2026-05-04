// Problem: 0039. Combination Sum
// Difficulty: Medium

List<List<int>> combinationSum(List<int> candidates, int target) {
  final c = List<int>.from(candidates)..sort();
  final out = <List<int>>[];
  final path = <int>[];
  void dfs(int i, int remain) {
    if (remain == 0) {
      out.add(List<int>.from(path));
      return;
    }
    for (var j = i; j < c.length; j++) {
      if (c[j] > remain) break;
      path.add(c[j]);
      dfs(j, remain - c[j]);
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
  if (!_eqLL(_norm(combinationSum([2, 3, 6, 7], 7)), _norm([[2, 2, 3], [7]]))) throw 'a';
  if (!_eqLL(_norm(combinationSum([2, 3, 5], 8)), _norm([[2, 2, 2, 2], [2, 3, 3], [3, 5]]))) throw 'b';
  if (combinationSum([2], 1).isNotEmpty) throw 'c';
  if (!_eqLL(_norm(combinationSum([1], 2)), _norm([[1, 1]]))) throw 'd';
  if (!_eqLL(_norm(combinationSum([8, 7, 4, 3], 11)), _norm([[3, 4, 4], [3, 8], [4, 7]]))) throw 'e';
  print('All tests passed!');
}
