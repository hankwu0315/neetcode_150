// 0191. Number of 1 Bits
int hammingWeight(int n) {
  var c = 0;
  while (n != 0) {
    n &= n - 1;
    c++;
  }
  return c;
}
void main() {
  if (hammingWeight(11) != 3) throw 'a';
  if (hammingWeight(128) != 1) throw 'b';
  if (hammingWeight(0) != 0) throw 'c';
  if (hammingWeight(7) != 3) throw 'd';
  if (hammingWeight(1023) != 10) throw 'e';
  print('All tests passed!');
}
