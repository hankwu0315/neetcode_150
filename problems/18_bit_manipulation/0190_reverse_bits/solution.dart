// 0190. Reverse Bits
int reverseBitsFn(int n) {
  var res = 0;
  for (var i = 0; i < 32; i++) {
    res = (res << 1) | (n & 1);
    n >>= 1;
  }
  return res;
}
void main() {
  if (reverseBitsFn(43261596) != 964176192) throw 'a';
  if (reverseBitsFn(4294967293) != 3221225471) throw 'b';
  if (reverseBitsFn(0) != 0) throw 'c';
  if (reverseBitsFn(1) != 0x80000000) throw 'd';
  print('All tests passed!');
}
