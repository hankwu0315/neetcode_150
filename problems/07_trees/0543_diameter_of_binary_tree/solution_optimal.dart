// Problem: 0543. Diameter of Binary Tree
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

int diameterOfBinaryTree(TreeNode? root) {
  var ans = 0;
  int depth(TreeNode? n) {
    if (n == null) return 0;
    final L = depth(n.left), R = depth(n.right);
    if (L + R > ans) ans = L + R;
    return 1 + (L > R ? L : R);
  }
  depth(root);
  return ans;
}

void _expect(int a, int e, String msg) {
  if (a != e) throw StateError('FAIL $msg: $a vs $e');
}

void main() {
  _expect(diameterOfBinaryTree(fromLevel([1, 2, 3, 4, 5])), 3, 'ex1');
  _expect(diameterOfBinaryTree(fromLevel([1, 2])), 1, 'ex2');
  _expect(diameterOfBinaryTree(fromLevel([])), 0, 'empty');
  _expect(diameterOfBinaryTree(fromLevel([1])), 0, 'one');
  _expect(diameterOfBinaryTree(fromLevel([1, 2, null, 3, null, 4, null, 5])), 4, 'skew');
  print('All tests passed!');
}
