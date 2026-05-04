// 1899. Merge Triplets to Form Target Triplet
bool mergeTriplets(List<List<int>> triplets, List<int> target) {
  final g = [0, 0, 0];
  for (final t in triplets) {
    if (t[0] > target[0] || t[1] > target[1] || t[2] > target[2]) continue;
    for (var i = 0; i < 3; i++) if (t[i] > g[i]) g[i] = t[i];
  }
  return g[0] == target[0] && g[1] == target[1] && g[2] == target[2];
}
void main() {
  if (mergeTriplets([[2, 5, 3], [1, 8, 4], [1, 7, 5]], [2, 7, 5]) != true) throw 'a';
  if (mergeTriplets([[3, 4, 5], [4, 5, 6]], [3, 2, 5]) != false) throw 'b';
  if (mergeTriplets([[2, 5, 3], [2, 3, 4], [1, 2, 5], [5, 2, 3]], [5, 5, 5]) != true) throw 'c';
  if (mergeTriplets([[1, 1, 1]], [2, 2, 2]) != false) throw 'd';
  if (mergeTriplets([[2, 5, 3]], [2, 5, 3]) != true) throw 'e';
  print('All tests passed!');
}
