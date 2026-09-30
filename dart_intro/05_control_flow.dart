// Lesson 05 — Control flow: if / else, switch

void main() {
  // ---------- if / else if / else ----------
  var temperature = 28;

  if (temperature > 35) {
    print('Very hot');
  } else if (temperature > 25) {
    print('Warm');
  } else if (temperature > 15) {
    print('Nice');
  } else {
    print('Cold');
  }

  // ---------- Classic switch statement ----------
  var day = 'Sat';
  switch (day) {
    case 'Fri':
    case 'Sat':
      print('Weekend');
    case 'Sun':
      print('Start of the week');
    default:
      print('Weekday');
  }
  // Note: since Dart 3 you don't need `break` — cases don't fall through
  // unless they are empty (like 'Fri' above).

  // ---------- switch expression (Dart 3) ----------
  var score = 83;
  var letter = switch (score) {
    >= 90 => 'A',
    >= 80 => 'B',
    >= 70 => 'C',
    >= 50 => 'D',
    _ => 'F', // _ = anything else
  };
  print('Score $score -> $letter');

  // ---------- Patterns with && in cases ----------
  var hour = 14;
  var period = switch (hour) {
    >= 0 && < 12 => 'Morning',
    >= 12 && < 18 => 'Afternoon',
    _ => 'Evening',
  };
  print(period);

  // ---------- assert (only runs with --enable-asserts / in debug) ----------
  assert(score >= 0, 'Score must not be negative');
}
