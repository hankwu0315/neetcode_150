// Problem: 0102. Binary Tree Level Order Traversal
// Difficulty: Medium

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

List<List<int>> levelOrder(TreeNode? root) {
  if (root == null) return [];
  final out = <List<int>>[];
  var q = <TreeNode>[root];
  while (q.isNotEmpty) {
    final layer = <int>[];
    final nx = <TreeNode>[];
    for (final n in q) {
      layer.add(n.val);
      if (n.left != null) nx.add(n.left!);
      if (n.right != null) nx.add(n.right!);
    }
    out.add(layer);
    q = nx;
  }
  return out;
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
  if (!_eq(levelOrder(fromLevel([3, 9, 20, null, null, 15, 7])), [[3], [9, 20], [15, 7]])) throw 'ex1';
  if (!_eq(levelOrder(fromLevel([1])), [[1]])) throw 'one';
  if (!_eq(levelOrder(fromLevel([])), [])) throw 'empty';
  if (!_eq(levelOrder(fromLevel([1, 2, 3, 4, 5, 6, 7])), [[1], [2, 3], [4, 5, 6, 7]])) throw 'full';
  print('All tests passed!');
}
