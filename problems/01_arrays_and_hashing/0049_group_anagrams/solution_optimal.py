"""
Problem: 49. Group Anagrams
Difficulty: Medium
URL: https://leetcode.com/problems/group-anagrams/

【解法演進】排序當 key O(n·k log k) → 26 元組計數當 key O(n·k)（最佳）
【最佳解核心思路】
    對每個字串建立長度 26 的計數陣列，將 tuple(count) 作為 dict key 分組。
【複雜度】時間：O(n · k)  空間：O(n · k)
"""
from collections import defaultdict
from typing import List


class Solution:
    # 最佳解：計數元組作 key
    def groupAnagrams(self, strs: List[str]) -> List[List[str]]:
        groups: dict[tuple, List[str]] = defaultdict(list)
        for s in strs:
            count = [0] * 26
            for c in s:
                count[ord(c) - ord('a')] += 1
            groups[tuple(count)].append(s)
        return list(groups.values())

    # 暴力解：排序當 key
    def groupAnagrams_brute(self, strs: List[str]) -> List[List[str]]:
        groups: dict[str, List[str]] = defaultdict(list)
        for s in strs:
            groups["".join(sorted(s))].append(s)
        return list(groups.values())


def _norm(groups: List[List[str]]) -> List[List[str]]:
    """將群組順序標準化以便比對。"""
    return sorted([sorted(g) for g in groups])


if __name__ == "__main__":
    s = Solution()

    out = s.groupAnagrams(["eat", "tea", "tan", "ate", "nat", "bat"])
    expected = [["bat"], ["nat", "tan"], ["ate", "eat", "tea"]]
    assert _norm(out) == _norm(expected), f"Test 1 failed: {out}"

    assert _norm(s.groupAnagrams([""])) == [[""]], "Test 2 failed (empty string)"
    assert _norm(s.groupAnagrams(["a"])) == [["a"]], "Test 3 failed (single)"
    assert _norm(s.groupAnagrams(["abc", "bca", "cab"])) == [["abc", "bca", "cab"]], "Test 4 failed"
    assert _norm(s.groupAnagrams(["a", "b", "c"])) == [["a"], ["b"], ["c"]], "Test 5 failed (no anagrams)"

    # 暴力解驗證
    assert _norm(s.groupAnagrams_brute(["eat", "tea", "ate"])) == [["ate", "eat", "tea"]], "Brute Test failed"

    print("All tests passed!")
