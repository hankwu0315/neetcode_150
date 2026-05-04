"""
Problem: 0043. Multiply Strings
"""


class Solution:
    def multiply(self, num1: str, num2: str) -> str:
        if num1 == "0" or num2 == "0":
            return "0"
        m, n = len(num1), len(num2)
        buf = [0] * (m + n)
        for i in range(m - 1, -1, -1):
            a = ord(num1[i]) - 48
            for j in range(n - 1, -1, -1):
                b = ord(num2[j]) - 48
                p = buf[i + j + 1] + a * b
                buf[i + j + 1] = p % 10
                buf[i + j] += p // 10
        s = "".join(str(d) for d in buf).lstrip("0")
        return s or "0"


if __name__ == "__main__":
    sol = Solution()
    assert sol.multiply("2", "3") == "6"
    assert sol.multiply("123", "456") == "56088"
    assert sol.multiply("0", "12345") == "0"
    assert sol.multiply("999", "999") == "998001"
    assert sol.multiply("1", "1") == "1"
    print("All tests passed!")
