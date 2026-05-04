// Problem: 0787. Cheapest Flights Within K Stops
// Difficulty: Medium

const int INF787 = 0x3FFFFFFFFFFFFFFF;

int findCheapestPrice(int n, List<List<int>> flights, int src, int dst, int k) {
  var dist = List<int>.filled(n, INF787);
  dist[src] = 0;
  for (var step = 0; step <= k; step++) {
    final nd = List<int>.from(dist);
    for (final f in flights) {
      if (dist[f[0]] != INF787 && dist[f[0]] + f[2] < nd[f[1]]) {
        nd[f[1]] = dist[f[0]] + f[2];
      }
    }
    dist = nd;
  }
  return dist[dst] == INF787 ? -1 : dist[dst];
}

void _expect(int a, int e, String msg) {
  if (a != e) throw StateError('FAIL $msg: $a vs $e');
}

void main() {
  _expect(findCheapestPrice(
      4, [[0, 1, 100], [1, 2, 100], [2, 0, 100], [1, 3, 600], [2, 3, 200]],
      0, 3, 1), 700, 'a');
  _expect(findCheapestPrice(
      3, [[0, 1, 100], [1, 2, 100], [0, 2, 500]], 0, 2, 1), 200, 'b');
  _expect(findCheapestPrice(
      3, [[0, 1, 100], [1, 2, 100], [0, 2, 500]], 0, 2, 0), 500, 'c');
  _expect(findCheapestPrice(2, [[0, 1, 100]], 0, 1, 1), 100, 'd');
  _expect(findCheapestPrice(2, [], 0, 1, 1), -1, 'e');
  _expect(findCheapestPrice(3, [[0, 1, 1], [1, 2, 1]], 0, 2, 0), -1, 'f');
  print('All tests passed!');
}
