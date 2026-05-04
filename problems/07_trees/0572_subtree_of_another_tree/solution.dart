// Problem: 0572. Subtree of Another Tree
// Difficulty: Easy

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

bool _same(TreeNode? a, TreeNode? b) {
  if (a == null && b == null) return true;
  if (a == null || b == null) return false;
  return a.val == b.val && _same(a.left, b.left) && _same(a.right, b.right);
}

bool isSubtree(TreeNode? root, TreeNode? sub) {
  if (sub == null) return true;
  if (root == null) return false;
  if (_same(root, sub)) return true;
  return isSubtree(root.left, sub) || isSubtree(root.right, sub);
}

void _expect(bool a, bool e, String msg) {
  if (a != e) throw StateError('FAIL $msg');
}

void main() {
  _expect(isSubtree(fromLevel([3, 4, 5, 1, 2]), fromLevel([4, 1, 2])), true, 'ex1');
  _expect(isSubtree(fromLevel([3, 4, 5, 1, 2, null, null, null, null, 0]), fromLevel([4, 1, 2])), false, 'ex2');
  _expect(isSubtree(fromLevel([1, 1]), fromLevel([1])), true, 'small');
  _expect(isSubtree(fromLevel([]), fromLevel([1])), false, 'empty root');
  _expect(isSubtree(fromLevel([1, 2, 3]), fromLevel([])), true, 'empty sub');
  print('All tests passed!');
}
