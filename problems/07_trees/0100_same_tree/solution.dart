// Problem: 0100. Same Tree
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

bool isSameTree(TreeNode? p, TreeNode? q) {
  if (p == null && q == null) return true;
  if (p == null || q == null) return false;
  return p.val == q.val && isSameTree(p.left, q.left) && isSameTree(p.right, q.right);
}

void _expect(bool a, bool e, String msg) {
  if (a != e) throw StateError('FAIL $msg');
}

void main() {
  _expect(isSameTree(fromLevel([1, 2, 3]), fromLevel([1, 2, 3])), true, 'ex1');
  _expect(isSameTree(fromLevel([1, 2]), fromLevel([1, null, 2])), false, 'ex2');
  _expect(isSameTree(fromLevel([1, 2, 1]), fromLevel([1, 1, 2])), false, 'ex3');
  _expect(isSameTree(fromLevel([]), fromLevel([])), true, 'empty');
  _expect(isSameTree(fromLevel([1]), fromLevel([])), false, 'one vs empty');
  print('All tests passed!');
}
