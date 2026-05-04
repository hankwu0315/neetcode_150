// Problem: 0355. Design Twitter
// Difficulty: Medium

class _MaxHeap {
  // entry: [time, tweetId, uid, idx]
  final List<List<int>> a = [];
  int get size => a.length;
  void push(List<int> e) {
    a.add(e);
    var i = a.length - 1;
    while (i > 0) {
      final p = (i - 1) >> 1;
      if (a[p][0] >= a[i][0]) break;
      final t = a[p]; a[p] = a[i]; a[i] = t;
      i = p;
    }
  }
  List<int> pop() {
    final t0 = a[0];
    final last = a.removeLast();
    if (a.isNotEmpty) {
      a[0] = last;
      var i = 0; final n = a.length;
      while (true) {
        final l = 2 * i + 1, r = 2 * i + 2;
        var m = i;
        if (l < n && a[l][0] > a[m][0]) m = l;
        if (r < n && a[r][0] > a[m][0]) m = r;
        if (m == i) break;
        final t = a[i]; a[i] = a[m]; a[m] = t;
        i = m;
      }
    }
    return t0;
  }
}

class Twitter {
  int _time = 0;
  final Map<int, List<List<int>>> tweets = {}; // [time, tweetId]
  final Map<int, Set<int>> follows = {};

  void postTweet(int userId, int tweetId) {
    tweets.putIfAbsent(userId, () => <List<int>>[]).add([_time++, tweetId]);
  }

  List<int> getNewsFeed(int userId) {
    final fs = <int>{...?follows[userId], userId};
    final h = _MaxHeap();
    for (final u in fs) {
      final lst = tweets[u];
      if (lst != null && lst.isNotEmpty) {
        final idx = lst.length - 1;
        h.push([lst[idx][0], lst[idx][1], u, idx]);
      }
    }
    final out = <int>[];
    while (h.size > 0 && out.length < 10) {
      final e = h.pop();
      out.add(e[1]);
      final u = e[2], idx = e[3];
      if (idx > 0) {
        final lst = tweets[u]!;
        h.push([lst[idx - 1][0], lst[idx - 1][1], u, idx - 1]);
      }
    }
    return out;
  }

  void follow(int followerId, int followeeId) {
    if (followerId == followeeId) return;
    follows.putIfAbsent(followerId, () => <int>{}).add(followeeId);
  }

  void unfollow(int followerId, int followeeId) {
    follows[followerId]?.remove(followeeId);
  }
}

bool _eq(List<int> a, List<int> b) {
  if (a.length != b.length) return false;
  for (var i = 0; i < a.length; i++) if (a[i] != b[i]) return false;
  return true;
}

void main() {
  final tw = Twitter();
  tw.postTweet(1, 5);
  if (!_eq(tw.getNewsFeed(1), [5])) throw 'a';
  tw.follow(1, 2);
  tw.postTweet(2, 6);
  if (!_eq(tw.getNewsFeed(1), [6, 5])) throw 'b';
  tw.unfollow(1, 2);
  if (!_eq(tw.getNewsFeed(1), [5])) throw 'c';
  final tw2 = Twitter();
  for (var i = 0; i < 11; i++) tw2.postTweet(1, i);
  if (!_eq(tw2.getNewsFeed(1), [10, 9, 8, 7, 6, 5, 4, 3, 2, 1])) throw 'd';
  print('All tests passed!');
}
