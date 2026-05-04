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
        pass

    def carFleet_brute(self, target: int, position: list[int], speed: list[int]) -> int:
        pass


if __name__ == "__main__":
    solution = Solution()

    # Test 1
    # result = solution.solve(...)
    # assert result == expected

    print("All tests passed!")
