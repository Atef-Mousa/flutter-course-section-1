// Lesson 02 — Variables & built-in types

void main() {
  // ---------- Type inference with var ----------
  var name = 'Ali'; // inferred as String
  var age = 20; // inferred as int
  print('$name is $age years old (${name.runtimeType}, ${age.runtimeType})');

  // name = 5; // Error: once inferred as String, it stays a String

  // ---------- Explicit types ----------
  int students = 30;
  double price = 9.99;
  num anyNumber = 10; // num can hold int or double
  anyNumber = 10.5;
  bool isOpen = true;
  String course = 'Flutter';

  print('$students $price $anyNumber $isOpen $course');

  // ---------- dynamic vs Object ----------
  dynamic anything = 'text';
  anything = 42; // allowed: dynamic turns off static type checking
  print('dynamic value: $anything');

  Object obj = 'hello';
  obj = 3.14; // also allowed, but you can only call Object methods on it
  print('Object value: $obj');

  // ---------- Type conversion ----------
  int parsedInt = int.parse('123');
  double parsedDouble = double.parse('3.5');
  String fromInt = 42.toString();
  String fixed = 3.14159.toStringAsFixed(2);
  int fromDouble = 9.8.toInt(); // truncates -> 9
  print('$parsedInt $parsedDouble $fromInt $fixed $fromDouble');

  // tryParse returns null instead of throwing
  int? bad = int.tryParse('abc');
  print('int.tryParse("abc") = $bad');

  // ---------- Type checks ----------
  print(age is int); // true
  print(price is! int); // true
}
