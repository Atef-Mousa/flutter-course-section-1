// Lesson 03 — Strings

void main() {
  String single = 'single quotes';
  String double = "double quotes";
  String multi = '''
This is
a multi-line string''';
  String raw = r'Raw string: \n is not a new line here';

  print(single);
  print(double);
  print(multi);
  print(raw);

  // ---------- Interpolation ----------
  var first = 'Sara';
  var score = 95;
  print('Student: $first, score: $score');
  print('Score + 5 = ${score + 5}');
  print('Name length: ${first.length}');

  // ---------- Concatenation ----------
  var full = 'Hello, ' + first + '!';
  print(full);

  // ---------- Common methods ----------
  var text = '  Dart Programming  ';
  print(text.trim());
  print(text.toUpperCase());
  print(text.toLowerCase());
  print(text.contains('Dart'));
  print(text.trim().startsWith('Dart'));
  print(text.trim().endsWith('ing'));
  print(text.trim().replaceAll('Dart', 'Flutter'));
  print(text.trim().split(' ')); // [Dart, Programming]
  print(text.trim().substring(0, 4)); // Dart
  print(text.trim().indexOf('P'));
  print('ab' * 3); // ababab
  print('5'.padLeft(3, '0')); // 005

  // ---------- Strings are immutable ----------
  var s = 'abc';
  var upper = s.toUpperCase(); // returns a NEW string
  print('$s -> $upper');

  // ---------- StringBuffer for building strings efficiently ----------
  var buffer = StringBuffer();
  for (var i = 1; i <= 3; i++) {
    buffer.write('Item $i; ');
  }
  print(buffer.toString());
}
