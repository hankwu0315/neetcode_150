// Problem: 0124. Binary Tree Maximum Path Sum
// Difficulty: Hard

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

int maxPathSum(TreeNode? root) {
  var ans = -1 << 31;
  int gain(TreeNode? n) {
    if (n == null) return 0;
    final L = gain(n.left);
    final R = gain(n.right);
    final l = L > 0 ? L : 0;
    final r = R > 0 ? R : 0;
    final cur = n.val + l + r;
    if (cur > ans) ans = cur;
    return n.val + (l > r ? l : r);
  }
  gain(root);
  return ans;
}

void _expect(int a, int e, String msg) {
  if (a != e) throw StateError('FAIL $msg: $a vs $e');
}

void main() {
  _expect(maxPathSum(fromLevel([1, 2, 3])), 6, 'ex1');
  _expect(maxPathSum(fromLevel([-10, 9, 20, null, null, 15, 7])), 42, 'ex2');
  _expect(maxPathSum(fromLevel([-3])), -3, 'one neg');
  _expect(maxPathSum(fromLevel([2, -1])), 2, 'pos+neg');
  _expect(maxPathSum(fromLevel([-2, -1])), -1, 'all neg');
  _expect(maxPathSum(fromLevel([1, -2, -3, 1, 3, -2, null, -1])), 3, 'mixed');
  print('All tests passed!');
}
