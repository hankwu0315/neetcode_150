// Problem: 0297. Serialize and Deserialize Binary Tree
// Difficulty: Hard

class TreeNode {
  int val; TreeNode? left, right;
  TreeNode([this.val = 0, this.left, this.right]);
}

TreeNode? fromLevel(List<int?> a) {
  if (a.isEmpty) return null;
  final root = TreeNode(a[0]!);
  final q = <TreeNode>[root]; var qi = 0, i = 1;
  while (qi < q.length && i < a.length) {
    final n = q[qi++];
    if (i < a.length && a[i] != null) { n.left = TreeNode(a[i]!); q.add(n.left!); }
    i++;
    if (i < a.length && a[i] != null) { n.right = TreeNode(a[i]!); q.add(n.right!); }
    i++;
  }
  return root;
}

List<int?> toLevel(TreeNode? root) {
  if (root == null) return [];
  final out = <int?>[];
  final q = <TreeNode?>[root];
  var i = 0;
  while (i < q.length) {
    final n = q[i++];
    if (n == null) { out.add(null); continue; }
    out.add(n.val); q.add(n.left); q.add(n.right);
  }
  while (out.isNotEmpty && out.last == null) out.removeLast();
  return out;
}

class Codec {
  String serialize(TreeNode? root) {
    final out = <String>[];
    void dfs(TreeNode? n) {
      if (n == null) { out.add('#'); return; }
      out.add('${n.val}');
      dfs(n.left); dfs(n.right);
    }
    dfs(root);
    return out.join(' ');
  }

  TreeNode? deserialize(String data) {
    if (data.isEmpty) return null;
    final tokens = data.split(' ');
    var idx = 0;
    TreeNode? dfs() {
      final v = tokens[idx++];
      if (v == '#') return null;
      final n = TreeNode(int.parse(v));
      n.left = dfs(); n.right = dfs();
      return n;
    }
    return dfs();
  }
}

bool _eq(List<int?> a, List<int?> b) {
  if (a.length != b.length) return false;
  for (var i = 0; i < a.length; i++) if (a[i] != b[i]) return false;
  return true;
}

void main() {
  final c = Codec();
  final cases = <List<int?>>[
    [1, 2, 3, null, null, 4, 5],
    [],
    [1],
    [-1, -2, -3],
    [3, 9, 20, null, null, 15, 7],
    [1, 2, null, 3, null, 4, null, 5],
  ];
  for (final a in cases) {
    final t = fromLevel(a);
    final s = c.serialize(t);
    final t2 = c.deserialize(s);
    if (!_eq(toLevel(t2), a)) throw 'FAIL $a / $s / ${toLevel(t2)}';
  }
  print('All tests passed!');
}
