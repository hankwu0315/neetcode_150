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
        self.val = val
        self.neighbors = neighbors if neighbors is not None else []


class Solution:
    def cloneGraph(self, node: Optional[Node]) -> Optional[Node]:
        if node is None:
            return None
        mp: Dict[Node, Node] = {}

        def dfs(o: Node) -> Node:
            if o in mp:
                return mp[o]
            c = Node(o.val)
            mp[o] = c
            for nb in o.neighbors:
                c.neighbors.append(dfs(nb))
            return c

        return dfs(node)


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
    sol = Solution()
    r1 = _build([[2, 4], [1, 3], [2, 4], [1, 3]])
    c1 = sol.cloneGraph(r1)
    assert c1 is not r1 and _adj(c1) == [[2, 4], [1, 3], [2, 4], [1, 3]]
    r2 = _build([[]])
    c2 = sol.cloneGraph(r2)
    assert c2 is not r2 and _adj(c2) == [[]]
    assert sol.cloneGraph(None) is None
    r3 = Node(1)
    r3.neighbors = [r3]
    c3 = sol.cloneGraph(r3)
    assert c3 is not r3 and c3.val == 1 and c3.neighbors[0] is c3
    r4 = _build([[2], [1]])
    c4 = sol.cloneGraph(r4)
    assert _adj(c4) == [[2], [1]]
    print("All tests passed!")
