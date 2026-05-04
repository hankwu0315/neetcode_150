// Problem: 0199. Binary Tree Right Side View
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

List<int> rightSideView(TreeNode? root) {
  if (root == null) return [];
  final out = <int>[];
  var q = <TreeNode>[root];
  while (q.isNotEmpty) {
    final nx = <TreeNode>[];
    for (final n in q) {
      if (n.left != null) nx.add(n.left!);
      if (n.right != null) nx.add(n.right!);
    }
    out.add(q.last.val);
    q = nx;
  }
  return out;
}

void _expect(List<int> a, List<int> e, String msg) {
  if (a.length != e.length || !List.generate(a.length, (i) => a[i] == e[i]).every((x) => x)) {
    throw StateError('FAIL $msg: $a vs $e');
  }
}

void main() {
  _expect(rightSideView(fromLevel([1, 2, 3, null, 5, null, 4])), [1, 3, 4], 'ex1');
  _expect(rightSideView(fromLevel([1, null, 3])), [1, 3], 'ex2');
  _expect(rightSideView(fromLevel([])), [], 'empty');
  _expect(rightSideView(fromLevel([1, 2])), [1, 2], 'left only');
  _expect(rightSideView(fromLevel([1, 2, 3, 4])), [1, 3, 4], 'mixed');
  print('All tests passed!');
}
