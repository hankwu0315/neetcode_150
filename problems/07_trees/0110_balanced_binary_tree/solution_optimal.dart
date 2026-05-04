// Problem: 0110. Balanced Binary Tree
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

int _depth(TreeNode? n) {
  if (n == null) return 0;
  final L = _depth(n.left);
  if (L == -1) return -1;
  final R = _depth(n.right);
  if (R == -1 || (L - R).abs() > 1) return -1;
  return 1 + (L > R ? L : R);
}

bool isBalanced(TreeNode? root) => _depth(root) != -1;

void _expect(bool a, bool e, String msg) {
  if (a != e) throw StateError('FAIL $msg');
}

void main() {
  _expect(isBalanced(fromLevel([3, 9, 20, null, null, 15, 7])), true, 'ex1');
  _expect(isBalanced(fromLevel([1, 2, 2, 3, 3, null, null, 4, 4])), false, 'ex2');
  _expect(isBalanced(fromLevel([])), true, 'empty');
  _expect(isBalanced(fromLevel([1])), true, 'one');
  _expect(isBalanced(fromLevel([1, 2, null, 3, null, 4])), false, 'skew');
  print('All tests passed!');
}
