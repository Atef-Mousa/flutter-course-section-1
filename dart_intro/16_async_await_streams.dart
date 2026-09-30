// Lesson 16 — Asynchronous programming: Future, async/await, Stream

// A Future represents a value that will be available later
Future<String> fetchUser() async {
  await Future.delayed(Duration(seconds: 1)); // simulate a network call
  return 'Ali';
}

Future<int> fetchScore(String user) {
  return Future.delayed(Duration(milliseconds: 500), () => 90);
}

Future<void> failingCall() async {
  await Future.delayed(Duration(milliseconds: 200));
  throw Exception('Server error 500');
}

// A Stream delivers many values over time
Stream<int> countDown(int from) async* {
  for (var i = from; i >= 0; i--) {
    await Future.delayed(Duration(milliseconds: 300));
    yield i; // emit a value
  }
}

// Synchronous generator
Iterable<int> evens(int max) sync* {
  for (var i = 0; i <= max; i += 2) {
    yield i;
  }
}

Future<void> main() async {
  print('1) Start');

  // ---------- then() style ----------
  fetchUser().then((user) => print('then(): got $user'));

  // ---------- async/await style ----------
  var user = await fetchUser();
  var score = await fetchScore(user);
  print('2) await: $user scored $score');

  // ---------- Errors in async code ----------
  try {
    await failingCall();
  } catch (e) {
    print('3) Caught async error: $e');
  }

  // ---------- Run in parallel ----------
  var results = await Future.wait([fetchUser(), fetchScore('x')]);
  print('4) Future.wait: $results');

  // ---------- Streams ----------
  await for (var n in countDown(3)) {
    print('5) countdown: $n');
  }

  var doubled = await countDown(3).map((n) => n * 2).toList();
  print('6) stream map: $doubled');

  // ---------- sync* generator ----------
  print('7) evens: ${evens(10).toList()}');

  print('8) End');
}
