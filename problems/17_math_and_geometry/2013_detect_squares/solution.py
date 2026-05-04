"""
Problem: 2013. Detect Squares
"""
from collections import defaultdict
from typing import List


class DetectSquares:
    def __init__(self):
        self.cnt = defaultdict(int)
        self.points = []

    def add(self, point: List[int]) -> None:
        self.cnt[(point[0], point[1])] += 1
        self.points.append(point)

    def count(self, point: List[int]) -> int:
        px, py = point
        total = 0
        for x, y in self.points:
            if abs(x - px) != abs(y - py) or x == px or y == py:
                continue
            total += self.cnt[(x, py)] * self.cnt[(px, y)]
        return total


if __name__ == "__main__":
    ds = DetectSquares()
    ds.add([3, 10]); ds.add([11, 2]); ds.add([3, 2])
    assert ds.count([11, 10]) == 1
    assert ds.count([14, 8]) == 0
    ds.add([11, 2])
    assert ds.count([11, 10]) == 2
    print("All tests passed!")
