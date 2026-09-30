// Lesson 06 — Loops

void main() {
  // ---------- for ----------
  for (var i = 1; i <= 5; i++) {
    print('for: $i');
  }

  // ---------- for-in (iterate over a collection) ----------
  var fruits = ['Apple', 'Banana', 'Mango'];
  for (var fruit in fruits) {
    print('fruit: $fruit');
  }

  // ---------- forEach ----------
  fruits.forEach((f) => print('forEach: $f'));

  // ---------- while ----------
  var count = 3;
  while (count > 0) {
    print('while: $count');
    count--;
  }

  // ---------- do-while (runs at least once) ----------
  var n = 0;
  do {
    print('do-while: $n');
    n++;
  } while (n < 2);

  // ---------- break & continue ----------
  for (var i = 1; i <= 10; i++) {
    if (i % 2 == 0) continue; // skip even numbers
    if (i > 7) break; // stop the loop
    print('odd: $i');
  }

  // ---------- Labels (break out of nested loops) ----------
  outer:
  for (var i = 1; i <= 3; i++) {
    for (var j = 1; j <= 3; j++) {
      if (i * j == 4) {
        print('found i=$i, j=$j');
        break outer;
      }
    }
  }

  // ---------- Example: sum & multiplication table ----------
  var sum = 0;
  for (var i = 1; i <= 100; i++) {
    sum += i;
  }
  print('Sum 1..100 = $sum');

  for (var i = 1; i <= 3; i++) {
    print('3 x $i = ${3 * i}');
  }
}
