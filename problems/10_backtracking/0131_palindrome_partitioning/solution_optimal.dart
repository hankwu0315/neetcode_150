// Problem: 0131. Palindrome Partitioning
// Difficulty: Medium

List<List<String>> partition(String s) {
  final n = s.length;
  final out = <List<String>>[];
  final path = <String>[];
  bool isPal(int l, int r) {
    while (l < r) {
      if (s[l] != s[r]) return false;
      l++; r--;
    }
    return true;
  }
  void dfs(int start) {
    if (start == n) {
      out.add(List<String>.from(path));
      return;
    }
    for (var end = start; end < n; end++) {
      if (isPal(start, end)) {
        path.add(s.substring(start, end + 1));
        dfs(end + 1);
        path.removeLast();
      }
    }
  }
  dfs(0);
  return out;
}

List<List<String>> _norm(List<List<String>> xs) {
  final r = xs.map((s) => List<String>.from(s)).toList();
  r.sort((a, b) {
    final n = a.length < b.length ? a.length : b.length;
    for (var i = 0; i < n; i++) {
      final c = a[i].compareTo(b[i]);
      if (c != 0) return c;
    }
    return a.length - b.length;
  });
  return r;
}

bool _eqLLS(List<List<String>> a, List<List<String>> b) {
  if (a.length != b.length) return false;
  for (var i = 0; i < a.length; i++) {
    if (a[i].length != b[i].length) return false;
    for (var j = 0; j < a[i].length; j++) if (a[i][j] != b[i][j]) return false;
  }
  return true;
}

void main() {
  if (!_eqLLS(_norm(partition("aab")), _norm([["a", "a", "b"], ["aa", "b"]]))) throw 'a';
  if (!_eqLLS(_norm(partition("a")), _norm([["a"]]))) throw 'b';
  if (!_eqLLS(_norm(partition("aa")), _norm([["a", "a"], ["aa"]]))) throw 'c';
  if (!_eqLLS(_norm(partition("aba")), _norm([["a", "b", "a"], ["aba"]]))) throw 'd';
  if (partition("efe").length != 2) throw 'e';
  print('All tests passed!');
}
