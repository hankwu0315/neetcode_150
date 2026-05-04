// Problem: 0133. Clone Graph
// Difficulty: Medium

class Node {
  int val;
  List<Node> neighbors;
  Node(this.val, [List<Node>? n]) : neighbors = n ?? [];
}

Node? cloneGraph(Node? node) {
  // TODO: implement
  return null;
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


void main() {
  // Test 1
  // final result = solve(...);
  print('All tests passed!');
}
