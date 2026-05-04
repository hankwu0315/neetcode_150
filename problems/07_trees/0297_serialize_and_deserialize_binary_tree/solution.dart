// Problem: 0297. Serialize and Deserialize Binary Tree
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

List<int?> toLevel(TreeNode? root) {
  // TODO: implement
  return [];
}

class Codec {
  String serialize(TreeNode? root) {
    // TODO: implement
    return "";
  }

  TreeNode? deserialize(String data) {
    // TODO: implement
    return null;
  }
}


void main() {
  // Test 1
  // final result = solve(...);
  print('All tests passed!');
}
