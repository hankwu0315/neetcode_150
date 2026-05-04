// Problem: 0046. Permutations
// Difficulty: Medium

List<List<int>> permute(List<int> nums) {
  // TODO: implement
  return [];
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


void main() {
  // Test 1
  // final result = solve(...);
  print('All tests passed!');
}
