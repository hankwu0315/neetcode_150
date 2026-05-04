// Problem: 0105. Construct Binary Tree from Preorder and Inorder
// Difficulty: Medium

class TreeNode {
  int val; TreeNode? left, right;
  TreeNode([this.val = 0, this.left, this.right]);
}

List<int?> toLevel(TreeNode? root) {
  if (root == null) return [];
  final out = <int?>[];
  final q = <TreeNode?>[root];
  var i = 0;
  while (i < q.length) {
    final n = q[i++];
    if (n == null) { out.add(null); continue; }
    out.add(n.val);
    q.add(n.left); q.add(n.right);
  }
  while (out.isNotEmpty && out.last == null) out.removeLast();
  return out;
}

TreeNode? buildTree(List<int> preorder, List<int> inorder) {
  final idx = <int, int>{};
  for (var i = 0; i < inorder.length; i++) idx[inorder[i]] = i;
  TreeNode? build(int pl, int pr, int il, int ir) {
    if (pl > pr) return null;
    final root = TreeNode(preorder[pl]);
    final i = idx[preorder[pl]]!;
    final ls = i - il;
    root.left = build(pl + 1, pl + ls, il, i - 1);
    root.right = build(pl + ls + 1, pr, i + 1, ir);
    return root;
  }
  return build(0, preorder.length - 1, 0, inorder.length - 1);
}

void _expect(List<int?> a, List<int?> e, String msg) {
  if (a.length != e.length || !List.generate(a.length, (i) => a[i] == e[i]).every((x) => x)) {
    throw StateError('FAIL $msg: $a vs $e');
  }
}

void main() {
  _expect(toLevel(buildTree([3, 9, 20, 15, 7], [9, 3, 15, 20, 7])), [3, 9, 20, null, null, 15, 7], 'ex1');
  _expect(toLevel(buildTree([-1], [-1])), [-1], 'one');
  _expect(toLevel(buildTree([1, 2], [2, 1])), [1, 2], 'left only');
  _expect(toLevel(buildTree([1, 2], [1, 2])), [1, null, 2], 'right only');
  _expect(toLevel(buildTree([], [])), [], 'empty');
  print('All tests passed!');
}
