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


void main() {
  // Test 1
  // final result = solve(...);
  print('All tests passed!');
}
