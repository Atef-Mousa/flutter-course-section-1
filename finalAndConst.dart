// If you never intend to change a variable, use final or const, either instead of var or in addition to a type.
// A final variable can be set only once; a const variable is a compile-time constant. (Const variables are implicitly final.)

// final: set once, but the value can be determined at runtime.
// const: set once, and the value must be known at compile time — before the program even runs.

// ============================================================
// Top-level and class-level constants
// ============================================================
const double pi = 3.14159; // top-level const
final appStartTime = DateTime.now(); // top-level final (runtime value)

class AppConfig {
  // Inside a class, a const field must be `static const`
  static const String appName = 'Flutter Course';
  static const int maxLoginAttempts = 3;

  // `final` instance fields: each object gets its own value, set once
  final String userName;
  final DateTime createdAt;

  AppConfig(this.userName) : createdAt = DateTime.now();
}

// A class with a const constructor: ALL fields must be final
class Point {
  final int x;
  final int y;
  const Point(this.x, this.y);

  @override
  String toString() => 'Point($x, $y)';
}

// Flutter uses this a lot: const widgets are built once and reused
class Color {
  final int r, g, b;
  const Color(this.r, this.g, this.b);

  static const Color red = Color(255, 0, 0);
  static const Color black = Color(0, 0, 0);

  @override
  String toString() => 'Color($r, $g, $b)';
}

String getUserNameFromServer() => 'Ali';

void main() {
  // ------------------------------------------------------------
  // 1) Basic final vs const
  // ------------------------------------------------------------
  final String nickname = 'Bobby';
  final city = 'Cairo'; // type inferred as String
  const int maxStudents = 40;
  const courseName = 'Dart'; // type inferred as String

  // nickname = 'Bob'; // Error: a final variable can only be set once
  // maxStudents = 50; // Error: constant variables can't be assigned
  print('1) $nickname $city $maxStudents $courseName');

  // ------------------------------------------------------------
  // 2) Runtime vs compile-time values
  // ------------------------------------------------------------
  final now = DateTime.now(); // fine — runtime value, only known when the app actually runs
  // const now2 = DateTime.now(); // Error: not a compile-time constant

  final userName = getUserNameFromServer(); // fine — result of a function call
  // const userName2 = getUserNameFromServer(); // Error: function calls are not constant

  print('2) now: $now, user: $userName');

  // ------------------------------------------------------------
  // 3) const can be built from other consts (compile-time expressions)
  // ------------------------------------------------------------
  const secondsPerMinute = 60;
  const secondsPerHour = secondsPerMinute * 60; // OK: const * const
  const circleArea = pi * 2 * 2; // OK
  const greeting = 'Welcome to $courseName'; // OK: interpolating a const

  // final x = 10;
  // const y = x * 2; // Error: x is final, not const

  print('3) $secondsPerHour sec/hour, area: $circleArea, $greeting');

  // ------------------------------------------------------------
  // 4) final LIST: the variable is fixed, but the CONTENT can change
  // ------------------------------------------------------------
  final List<String> fruits = ['Apple', 'Banana'];
  fruits.add('Mango'); // OK: we modify the list itself
  fruits[0] = 'Orange'; // OK
  // fruits = ['Kiwi']; // Error: can't point the variable to a new list
  print('4) final list: $fruits');

  // ------------------------------------------------------------
  // 5) const LIST: the variable AND the content are fixed (deeply immutable)
  // ------------------------------------------------------------
  const List<int> primes = [2, 3, 5, 7];
  // primes = [11]; // Error: compile time
  try {
    primes.add(11); // compiles, but throws at runtime
  } catch (e) {
    print('5) const list cannot change -> $e');
  }

  // Same idea for maps and sets
  const Map<String, int> ages = {'Ali': 20, 'Sara': 22};
  try {
    ages['Omar'] = 19;
  } catch (e) {
    print('5) const map cannot change -> ${e.runtimeType}');
  }

  // ------------------------------------------------------------
  // 6) Mixed: a final variable holding a const value
  // ------------------------------------------------------------
  var colors = const ['red', 'green']; // variable can change, list can't
  colors = ['blue']; // OK: point var to a new list
  print('6) var with const value reassigned: $colors');

  final numbers = const [1, 2, 3]; // same as const in behavior for the list
  print('6) final with const value: $numbers');

  // ------------------------------------------------------------
  // 7) final fields in a class
  // ------------------------------------------------------------
  var c1 = AppConfig('Ali');
  var c2 = AppConfig('Sara');
  // c1.userName = 'Omar'; // Error: userName is final
  print('7) ${AppConfig.appName} (max attempts ${AppConfig.maxLoginAttempts})');
  print('7) ${c1.userName} created at ${c1.createdAt}');
  print('7) ${c2.userName} created at ${c2.createdAt}');

  // ------------------------------------------------------------
  // 8) const objects are canonicalized: same values -> SAME object in memory
  // ------------------------------------------------------------
  const p1 = Point(1, 2);
  const p2 = Point(1, 2);
  final p3 = Point(1, 2); // not const -> new object
  var p4 = const Point(1, 2); // const on the value

  print('8) p1 identical p2: ${identical(p1, p2)}'); // true
  print('8) p1 identical p3: ${identical(p1, p3)}'); // false
  print('8) p1 identical p4: ${identical(p1, p4)}'); // true

  // Same for const lists
  const a = [1, 2];
  const b = [1, 2];
  print('8) const lists identical: ${identical(a, b)}'); // true
  print('8) normal lists identical: ${identical([1, 2], [1, 2])}'); // false

  // ------------------------------------------------------------
  // 9) Static const objects (like Colors.red in Flutter)
  // ------------------------------------------------------------
  print('9) ${Color.red}, ${Color.black}');

  // ------------------------------------------------------------
  // 10) final can be assigned later — but only once (definite assignment)
  // ------------------------------------------------------------
  final String level;
  var score = 85;
  if (score >= 50) {
    level = 'Pass';
  } else {
    level = 'Fail';
  }
  // level = 'Excellent'; // Error: already assigned
  print('10) level: $level');

  // ------------------------------------------------------------
  // 11) final in loops: a NEW final variable for every iteration
  // ------------------------------------------------------------
  for (final fruit in fruits) {
    // fruit = 'x'; // Error
    print('11) $fruit');
  }

  print('App started at: $appStartTime');

  // ------------------------------------------------------------
  // Summary
  // ------------------------------------------------------------
  // | keyword | reassign? | value known at | content of list/object |
  // |---------|-----------|----------------|------------------------|
  // | var     | yes       | runtime        | mutable                |
  // | final   | no        | runtime        | mutable                |
  // | const   | no        | compile time   | immutable              |
}
