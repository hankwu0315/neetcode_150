// Problem: 0332. Reconstruct Itinerary
// Difficulty: Hard

List<String> findItinerary(List<List<String>> tickets) {
  final g = <String, List<String>>{};
  for (final t in tickets) {
    g.putIfAbsent(t[0], () => <String>[]).add(t[1]);
  }
  // 反向排序，pop end == 字典序最小
  for (final k in g.keys) {
    g[k]!.sort((a, b) => b.compareTo(a));
  }
  final out = <String>[];
  void dfs(String u) {
    final lst = g[u];
    while (lst != null && lst.isNotEmpty) {
      final v = lst.removeLast();
      dfs(v);
    }
    out.add(u);
  }
  dfs("JFK");
  return out.reversed.toList();
}

bool _eq(List<String> a, List<String> b) {
  if (a.length != b.length) return false;
  for (var i = 0; i < a.length; i++) if (a[i] != b[i]) return false;
  return true;
}

void main() {
  if (!_eq(findItinerary([
    ["MUC", "LHR"], ["JFK", "MUC"], ["SFO", "SJC"], ["LHR", "SFO"]
  ]), ["JFK", "MUC", "LHR", "SFO", "SJC"])) throw 'a';
  if (!_eq(findItinerary([
    ["JFK", "SFO"], ["JFK", "ATL"], ["SFO", "ATL"],
    ["ATL", "JFK"], ["ATL", "SFO"]
  ]), ["JFK", "ATL", "JFK", "SFO", "ATL", "SFO"])) throw 'b';
  if (!_eq(findItinerary([["JFK", "KUL"], ["JFK", "NRT"], ["NRT", "JFK"]]),
      ["JFK", "NRT", "JFK", "KUL"])) throw 'c';
  if (!_eq(findItinerary([["JFK", "A"]]), ["JFK", "A"])) throw 'd';
  if (!_eq(findItinerary([["JFK", "B"], ["JFK", "A"], ["A", "JFK"]]),
      ["JFK", "A", "JFK", "B"])) throw 'e';
  print('All tests passed!');
}
