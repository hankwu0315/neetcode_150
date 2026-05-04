// Problem: 0098. Validate Binary Search Tree
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

bool isValidBST(TreeNode? root) {
  bool valid(TreeNode? n, int lo, int hi) {
    if (n == null) return true;
    if (!(n.val > lo && n.val < hi)) return false;
    return valid(n.left, lo, n.val) && valid(n.right, n.val, hi);
  }
  // 用 int 邊界足夠（題目值 32-bit），這裡用 64-bit 範圍
  return valid(root, -9223372036854775807, 9223372036854775807);
}

void _expect(bool a, bool e, String msg) {
  if (a != e) throw StateError('FAIL $msg');
}

void main() {
  _expect(isValidBST(fromLevel([2, 1, 3])), true, 'ex1');
  _expect(isValidBST(fromLevel([5, 1, 4, null, null, 3, 6])), false, 'ex2');
  _expect(isValidBST(fromLevel([])), true, 'empty');
  _expect(isValidBST(fromLevel([1])), true, 'one');
  _expect(isValidBST(fromLevel([5, 4, 6, null, null, 3, 7])), false, 'right has 3');
  _expect(isValidBST(fromLevel([10, 5, 15, null, null, 6, 20])), false, 'ancestor');
  print('All tests passed!');
}
