// Problem: 0133. Clone Graph
// Difficulty: Medium

class Node {
  int val;
  List<Node> neighbors;
  Node(this.val, [List<Node>? n]) : neighbors = n ?? [];
}

Node? cloneGraph(Node? node) {
  if (node == null) return null;
  final mp = <Node, Node>{};
  Node dfs(Node o) {
    final ex = mp[o];
    if (ex != null) return ex;
    final c = Node(o.val);
    mp[o] = c;
    for (final nb in o.neighbors) {
      c.neighbors.add(dfs(nb));
    }
    return c;
  }
  return dfs(node);
}

Node? _build(List<List<int>> adj) {
  if (adj.isEmpty) return null;
  final nodes = List.generate(adj.length, (i) => Node(i + 1));
  for (var i = 0; i < adj.length; i++) {
    nodes[i].neighbors = adj[i].map((j) => nodes[j - 1]).toList();
  }
  return nodes[0];
}

List<List<int>> _adj(Node? root) {
  if (root == null) return [];
  final seen = <int, Node>{};
  final st = <Node>[root];
  while (st.isNotEmpty) {
    final n = st.removeLast();
    if (seen.containsKey(n.val)) continue;
    seen[n.val] = n;
    for (final nb in n.neighbors) st.add(nb);
  }
  final keys = seen.keys.toList()..sort();
  return keys.map((v) {
    final nbs = seen[v]!.neighbors.map((n) => n.val).toList()..sort();
    return nbs;
  }).toList();
}

bool _eq(List<List<int>> a, List<List<int>> b) {
  if (a.length != b.length) return false;
  for (var i = 0; i < a.length; i++) {
    if (a[i].length != b[i].length) return false;
    for (var j = 0; j < a[i].length; j++) if (a[i][j] != b[i][j]) return false;
  }
  return true;
}

void main() {
  final r1 = _build([[2, 4], [1, 3], [2, 4], [1, 3]]);
  final c1 = cloneGraph(r1);
  if (identical(c1, r1) || !_eq(_adj(c1), [[2, 4], [1, 3], [2, 4], [1, 3]])) throw 'a';
  final r2 = _build([[]]);
  final c2 = cloneGraph(r2);
  if (identical(c2, r2) || !_eq(_adj(c2), [[]])) throw 'b';
  if (cloneGraph(null) != null) throw 'c';
  final r3 = Node(1);
  r3.neighbors = [r3];
  final c3 = cloneGraph(r3)!;
  if (identical(c3, r3) || c3.val != 1 || !identical(c3.neighbors[0], c3)) throw 'd';
  final r4 = _build([[2], [1]]);
  if (!_eq(_adj(cloneGraph(r4)), [[2], [1]])) throw 'e';
  print('All tests passed!');
}
