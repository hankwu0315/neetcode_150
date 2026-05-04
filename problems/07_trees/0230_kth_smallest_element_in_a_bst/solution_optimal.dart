// Problem: 0230. Kth Smallest Element in a BST
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

int kthSmallest(TreeNode? root, int k) {
  final stack = <TreeNode>[];
  TreeNode? cur = root;
  while (true) {
    while (cur != null) { stack.add(cur); cur = cur.left; }
    final n = stack.removeLast();
    k--;
    if (k == 0) return n.val;
    cur = n.right;
  }
}

void _expect(int a, int e, String msg) {
  if (a != e) throw StateError('FAIL $msg: $a vs $e');
}

void main() {
  _expect(kthSmallest(fromLevel([3, 1, 4, null, 2]), 1), 1, 'k1');
  _expect(kthSmallest(fromLevel([3, 1, 4, null, 2]), 2), 2, 'k2');
  _expect(kthSmallest(fromLevel([3, 1, 4, null, 2]), 3), 3, 'k3');
  _expect(kthSmallest(fromLevel([5, 3, 6, 2, 4, null, null, 1]), 3), 3, 'big');
  _expect(kthSmallest(fromLevel([1]), 1), 1, 'one');
  print('All tests passed!');
}
