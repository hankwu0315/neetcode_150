// 0202. Happy Number
int _sq(int x) {
  var s = 0;
  while (x > 0) { final d = x % 10; s += d * d; x ~/= 10; }
  return s;
}
bool isHappy(int n) {
  var slow = n, fast = _sq(n);
  while (fast != 1 && slow != fast) {
    slow = _sq(slow);
    fast = _sq(_sq(fast));
  }
  return fast == 1;
}
void main() {
  if (isHappy(19) != true) throw 'a';
  if (isHappy(2) != false) throw 'b';
  if (isHappy(1) != true) throw 'c';
  if (isHappy(7) != true) throw 'd';
  if (isHappy(20) != false) throw 'e';
  print('All tests passed!');
}
