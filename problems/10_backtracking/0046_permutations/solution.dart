// Problem: 0046. Permutations
// Difficulty: Medium

List<List<int>> permute(List<int> nums) {
  final n = nums.length;
  final out = <List<int>>[];
  final path = <int>[];
  final used = List<bool>.filled(n, false);
  void dfs() {
    if (path.length == n) {
      out.add(List<int>.from(path));
      return;
    }
    for (var i = 0; i < n; i++) {
      if (used[i]) continue;
      used[i] = true;
      path.add(nums[i]);
      dfs();
      path.removeLast();
      used[i] = false;
    }
  }
  dfs();
  return out;
}

List<List<int>> _sortLL(List<List<int>> xs) {
  final r = xs.map((s) => List<int>.from(s)).toList();
  r.sort((a, b) {
    final n = a.length < b.length ? a.length : b.length;
    for (var i = 0; i < n; i++) if (a[i] != b[i]) return a[i] - b[i];
    return a.length - b.length;
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
  if (!_eqLL(_sortLL(permute([1, 2, 3])),
      _sortLL([[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]]))) throw 'a';
  if (!_eqLL(_sortLL(permute([0, 1])), _sortLL([[0, 1], [1, 0]]))) throw 'b';
  if (!_eqLL(permute([1]), [[1]])) throw 'c';
  if (permute([1, 2, 3, 4]).length != 24) throw 'd';
  if (!_eqLL(_sortLL(permute([7, 8])), _sortLL([[7, 8], [8, 7]]))) throw 'e';
  print('All tests passed!');
}
