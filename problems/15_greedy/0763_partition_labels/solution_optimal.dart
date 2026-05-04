// 0763. Partition Labels
List<int> partitionLabels(String s) {
  final last = <String, int>{};
  for (var i = 0; i < s.length; i++) last[s[i]] = i;
  final res = <int>[];
  var start = 0, end = 0;
  for (var i = 0; i < s.length; i++) {
    final v = last[s[i]]!;
    if (v > end) end = v;
    if (i == end) { res.add(end - start + 1); start = i + 1; }
  }
  return res;
}
bool eq(List<int> a, List<int> b) {
  if (a.length != b.length) return false;
  for (var i = 0; i < a.length; i++) if (a[i] != b[i]) return false;
  return true;
}
void main() {
  if (!eq(partitionLabels("ababcbacadefegdehijhklij"), [9, 7, 8])) throw 'a';
  if (!eq(partitionLabels("eccbbbbdec"), [10])) throw 'b';
  if (!eq(partitionLabels("a"), [1])) throw 'c';
  if (!eq(partitionLabels("abc"), [1, 1, 1])) throw 'd';
  if (!eq(partitionLabels("aaabbb"), [3, 3])) throw 'e';
  print('All tests passed!');
}
