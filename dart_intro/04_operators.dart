// Lesson 04 — Operators

void main() {
  int a = 17, b = 5;

  // ---------- Arithmetic ----------
  print('a + b = ${a + b}');
  print('a - b = ${a - b}');
  print('a * b = ${a * b}');
  print('a / b = ${a / b}'); // always a double: 3.4
  print('a ~/ b = ${a ~/ b}'); // integer division: 3
  print('a % b = ${a % b}'); // remainder: 2

  // ---------- Increment / decrement ----------
  var x = 1;
  print(x++); // prints 1, then x becomes 2
  print(++x); // x becomes 3, then prints 3
  x--;
  print(x); // 2

  // ---------- Assignment ----------
  var y = 10;
  y += 5; // 15
  y -= 3; // 12
  y *= 2; // 24
  y ~/= 5; // 4
  print('y = $y');

  // ---------- Comparison ----------
  print(a == b);
  print(a != b);
  print(a > b);
  print(a <= b);

  // ---------- Logical ----------
  bool isStudent = true, hasId = false;
  print(isStudent && hasId); // AND
  print(isStudent || hasId); // OR
  print(!isStudent); // NOT

  // ---------- Conditional expression (ternary) ----------
  var grade = 72;
  var result = grade >= 50 ? 'Pass' : 'Fail';
  print(result);

  // ---------- Null-aware operators ----------
  String? nickname;
  print(nickname ?? 'No nickname'); // if null, use the right side
  nickname ??= 'Buddy'; // assign only if null
  print(nickname);
  String? maybe;
  print(maybe?.length); // null instead of crash

  // ---------- Type test / cast ----------
  Object value = 'Dart';
  if (value is String) {
    print(value.length); // smart cast to String
  }
  var asString = value as String;
  print(asString.toUpperCase());

  // ---------- Cascade (..) ----------
  var list = <int>[]
    ..add(1)
    ..add(2)
    ..addAll([3, 4]);
  print(list);
}
