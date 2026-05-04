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
  TreeNode? cur = root;
  while (cur != null) {
    if (cur.val == v) return cur;
    cur = v < cur.val ? cur.left : cur.right;
  }
  return null;
}

TreeNode lowestCommonAncestor(TreeNode root, TreeNode p, TreeNode q) {
  TreeNode? n = root;
  while (n != null) {
    if (p.val < n.val && q.val < n.val) n = n.left;
    else if (p.val > n.val && q.val > n.val) n = n.right;
    else return n;
  }
  throw StateError('not found');
}

void _expect(int a, int e, String msg) {
  if (a != e) throw StateError('FAIL $msg: $a vs $e');
}

void main() {
  final r = fromLevel([6, 2, 8, 0, 4, 7, 9, null, null, 3, 5])!;
  _expect(lowestCommonAncestor(r, find(r, 2)!, find(r, 8)!).val, 6, '2,8');
  _expect(lowestCommonAncestor(r, find(r, 2)!, find(r, 4)!).val, 2, '2,4');
  _expect(lowestCommonAncestor(r, find(r, 3)!, find(r, 5)!).val, 4, '3,5');
  _expect(lowestCommonAncestor(r, find(r, 0)!, find(r, 9)!).val, 6, '0,9');
  final r2 = fromLevel([2, 1])!;
  _expect(lowestCommonAncestor(r2, find(r2, 2)!, find(r2, 1)!).val, 2, 'parent');
  print('All tests passed!');
}
