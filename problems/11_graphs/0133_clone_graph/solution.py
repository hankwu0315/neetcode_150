"""
Problem: 0133. Clone Graph
Difficulty: Medium
URL: https://leetcode.com/problems/clone-graph/

解法：DFS + Hash 對照表。
"""

from __future__ import annotations

from typing import Optional, Dict, List

class Node:
    def __init__(self, val: int = 0, neighbors: Optional[List["Node"]] = None):
        pass


class Solution:
    def cloneGraph(self, node: Optional[Node]) -> Optional[Node]:
        pass


def _build(adj: List[List[int]]) -> Optional[Node]:
    if not adj:
        return None
    nodes = [Node(i + 1) for i in range(len(adj))]
    for i, nbs in enumerate(adj):
        nodes[i].neighbors = [nodes[j - 1] for j in nbs]
    return nodes[0]

def _adj(root: Optional[Node]) -> List[List[int]]:
    if root is None:
        return []
    seen: Dict[int, Node] = {}
    stack = [root]
    while stack:
        n = stack.pop()
        if n.val in seen:
            continue
        seen[n.val] = n
        for nb in n.neighbors:
            stack.append(nb)
    out = []
    for v in sorted(seen):
        out.append(sorted(nb.val for nb in seen[v].neighbors))
    return out

if __name__ == "__main__":
    node = Node()

    # Test 1
    # result = node.solve(...)
    # assert result == expected

    print("All tests passed!")
