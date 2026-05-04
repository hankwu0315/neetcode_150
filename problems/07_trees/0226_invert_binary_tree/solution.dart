// Problem: 0226. Invert Binary Tree
// Difficulty: Easy

class TreeNode {
  int val;
  TreeNode? left, right;
  TreeNode([this.val = 0, this.left, this.right]);
}

TreeNode? fromLevel(List<int?> a) {
  if (a.isEmpty) return null;
  final root = TreeNode(a[0]!);
  final q = <TreeNode>[root];
  var qi = 0, i = 1;
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
    out.add(n.val);
    q.add(n.left); q.add(n.right);
  }
  while (out.isNotEmpty && out.last == null) out.removeLast();
  return out;
}

TreeNode? invertTree(TreeNode? root) {
  if (root == null) return null;
  final l = invertTree(root.right);
  final r = invertTree(root.left);
  root.left = l; root.right = r;
  return root;
}

void _expect(List<int?> a, List<int?> e, String msg) {
  if (a.length != e.length || !List.generate(a.length, (i) => a[i] == e[i]).every((x) => x)) {
    throw StateError('FAIL $msg: $a vs $e');
  }
}

void main() {
  _expect(toLevel(invertTree(fromLevel([4, 2, 7, 1, 3, 6, 9]))), [4, 7, 2, 9, 6, 3, 1], 'ex1');
  _expect(toLevel(invertTree(fromLevel([2, 1, 3]))), [2, 3, 1], 'ex2');
  _expect(toLevel(invertTree(fromLevel([]))), [], 'empty');
  _expect(toLevel(invertTree(fromLevel([1]))), [1], 'one');
  print('All tests passed!');
}
