// Problem: 0104. Maximum Depth of Binary Tree
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

int maxDepth(TreeNode? root) {
  if (root == null) return 0;
  final l = maxDepth(root.left), r = maxDepth(root.right);
  return 1 + (l > r ? l : r);
}

void _expect(int a, int e, String msg) {
  if (a != e) throw StateError('FAIL $msg: $a vs $e');
}

void main() {
  _expect(maxDepth(fromLevel([3, 9, 20, null, null, 15, 7])), 3, 'ex1');
  _expect(maxDepth(fromLevel([1, null, 2])), 2, 'ex2');
  _expect(maxDepth(fromLevel([])), 0, 'empty');
  _expect(maxDepth(fromLevel([1])), 1, 'one');
  _expect(maxDepth(fromLevel([1, 2, 3, 4, 5])), 3, 'ex5');
  print('All tests passed!');
}
