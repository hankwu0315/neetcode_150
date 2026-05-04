// Problem: 1448. Count Good Nodes in Binary Tree
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

int goodNodes(TreeNode? root) {
  int dfs(TreeNode? n, int mx) {
    if (n == null) return 0;
    var cnt = n.val >= mx ? 1 : 0;
    final nmx = mx > n.val ? mx : n.val;
    return cnt + dfs(n.left, nmx) + dfs(n.right, nmx);
  }
  return dfs(root, -1 << 31);
}

void _expect(int a, int e, String msg) {
  if (a != e) throw StateError('FAIL $msg: $a vs $e');
}

void main() {
  _expect(goodNodes(fromLevel([3, 1, 4, 3, null, 1, 5])), 4, 'ex1');
  _expect(goodNodes(fromLevel([3, 3, null, 4, 2])), 3, 'ex2');
  _expect(goodNodes(fromLevel([1])), 1, 'one');
  _expect(goodNodes(fromLevel([2, null, 4, 10, 8, null, null, 4])), 4, 'ex4');
  print('All tests passed!');
}
