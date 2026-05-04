// Problem: 0355. Design Twitter
// Difficulty: Medium

class _MaxHeap {
  // entry: [time, tweetId, uid, idx]
  final List<List<int>> a = [];
  int get size => a.length;
  void push(List<int> e) {
    // TODO: implement
  }
  List<int> pop() {
    // TODO: implement
    return [];
  }
}

class Twitter {
  int _time = 0;
  final Map<int, List<List<int>>> tweets = {}; // [time, tweetId]
  final Map<int, Set<int>> follows = {};

  void postTweet(int userId, int tweetId) {
    // TODO: implement
  }

  List<int> getNewsFeed(int userId) {
    // TODO: implement
    return [];
  }

  void follow(int followerId, int followeeId) {
    // TODO: implement
  }

  void unfollow(int followerId, int followeeId) {
    // TODO: implement
  }
}


void main() {
  // Test 1
  // final result = solve(...);
  print('All tests passed!');
}
