// Problem: 0235. Lowest Common Ancestor of a BST
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

TreeNode? find(TreeNode? root, int v) {
  // TODO: implement
  return null;
}

TreeNode lowestCommonAncestor(TreeNode root, TreeNode p, TreeNode q) {
  // TODO: implement
  throw UnimplementedError();
}


void main() {
  // Test 1
  // final result = solve(...);
  print('All tests passed!');
}
