// 0329. Longest Increasing Path in a Matrix
int longestIncreasingPath(List<List<int>> matrix) {
  if (matrix.isEmpty || matrix[0].isEmpty) return 0;
  final m = matrix.length, n = matrix[0].length;
  final memo = List.generate(m, (_) => List<int>.filled(n, 0));
  const dirs = [[1, 0], [-1, 0], [0, 1], [0, -1]];
  int dfs(int i, int j) {
    if (memo[i][j] != 0) return memo[i][j];
    var best = 1;
    for (final d in dirs) {
      final ni = i + d[0], nj = j + d[1];
      if (ni >= 0 && ni < m && nj >= 0 && nj < n &&
          matrix[ni][nj] > matrix[i][j]) {
        final v = 1 + dfs(ni, nj);
        if (v > best) best = v;
      }
    }
    memo[i][j] = best;
    return best;
  }
  var ans = 0;
  for (var i = 0; i < m; i++) for (var j = 0; j < n; j++) {
    final v = dfs(i, j);
    if (v > ans) ans = v;
  }
  return ans;
}
void main() {
  if (longestIncreasingPath([[9, 9, 4], [6, 6, 8], [2, 1, 1]]) != 4) throw 'a';
  if (longestIncreasingPath([[3, 4, 5], [3, 2, 6], [2, 2, 1]]) != 4) throw 'b';
  if (longestIncreasingPath([[1]]) != 1) throw 'c';
  if (longestIncreasingPath([[]]) != 0) throw 'd';
  if (longestIncreasingPath([[1, 2]]) != 2) throw 'e';
  if (longestIncreasingPath([[7, 7, 7], [7, 7, 7]]) != 1) throw 'f';
  print('All tests passed!');
}
