// Problem: 0078. Subsets
// Difficulty: Medium

List<List<int>> subsets(List<int> nums) {
  final out = <List<int>>[];
  final path = <int>[];
  final n = nums.length;
  void dfs(int i) {
    if (i == n) {
      out.add(List<int>.from(path));
      return;
    }
    dfs(i + 1);
    path.add(nums[i]);
    dfs(i + 1);
    path.removeLast();
  }
  dfs(0);
  return out;
}

List<List<int>> _norm(List<List<int>> xs) {
  final r = xs.map((s) {
    final c = List<int>.from(s);
    c.sort();
    return c;
  }).toList();
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
  final got = _norm(subsets([1, 2, 3]));
  final exp = _norm([[], [1], [2], [3], [1, 2], [1, 3], [2, 3], [1, 2, 3]]);
  if (!_eqLL(got, exp)) throw 'a';
  if (!_eqLL(_norm(subsets([0])), _norm([[], [0]]))) throw 'b';
  if (!_eqLL(_norm(subsets([])), _norm([[]]))) throw 'c';
  if (subsets([1, 2, 3, 4]).length != 16) throw 'd';
  if (!_eqLL(_norm(subsets([5, 6])), _norm([[], [5], [6], [5, 6]]))) throw 'e';
  print('All tests passed!');
}
