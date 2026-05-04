"""
Problem: 0853. Car Fleet
Difficulty: Medium
URL: https://leetcode.com/problems/car-fleet/

解法演進：
1) 依 position 由大到小排序，計算每輛車到達 target 所需時間。
2) 掃描時維持 max_time；t > max_time 就成新車隊並更新；t <= max_time 合併。

最佳解核心思路：
- 離終點近的車先到；後面的車若到達時間 <= 前車，必定追上合併。

複雜度：O(n log n) / O(n)。
"""


class Solution:
    # 最佳解：排序 + 一次掃描
    def carFleet(self, target: int, position: list[int], speed: list[int]) -> int:
        cars = sorted(zip(position, speed), key=lambda x: -x[0])  # 由大到小
        fleets = 0
        max_time = 0.0
        for pos, sp in cars:
            t = (target - pos) / sp
            if t > max_time:
                fleets += 1
                max_time = t
            # else: 合併入前車隊
        return fleets

    # 解法 2：明確堆疊
    def carFleet_brute(self, target: int, position: list[int], speed: list[int]) -> int:
        cars = sorted(zip(position, speed), key=lambda x: -x[0])
        stack: list[float] = []
        for pos, sp in cars:
            t = (target - pos) / sp
            if not stack or t > stack[-1]:
                stack.append(t)
        return len(stack)


if __name__ == "__main__":
    sol = Solution()
    for fn in (sol.carFleet, sol.carFleet_brute):
        assert fn(12, [10, 8, 0, 5, 3], [2, 4, 1, 1, 3]) == 3
        assert fn(10, [3], [3]) == 1
        assert fn(100, [0, 2, 4], [4, 2, 1]) == 1
        # 完全分散
        assert fn(10, [6, 8], [3, 2]) == 2
        # 全部合成一隊
        assert fn(10, [0, 4, 2], [2, 1, 3]) == 1
        # 兩輛剛好同時到
        assert fn(10, [0, 5], [1, 1]) == 2  # 不同時：t1=10, t2=5
    print("All tests passed!")
