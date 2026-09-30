// Lesson 18 — Mini project: Student grade manager
// Puts together: classes, enums, collections, null safety,
// extensions, exceptions, async and records.

enum Level { excellent, good, pass, fail }

extension LevelFromScore on double {
  Level get level => switch (this) {
        >= 90 => Level.excellent,
        >= 75 => Level.good,
        >= 50 => Level.pass,
        _ => Level.fail,
      };
}

class Student {
  final String id;
  final String name;
  final List<double> _scores = [];

  Student(this.id, this.name);

  void addScore(double score) {
    if (score < 0 || score > 100) {
      throw RangeError.range(score.toInt(), 0, 100, 'score');
    }
    _scores.add(score);
  }

  double? get average =>
      _scores.isEmpty ? null : _scores.reduce((a, b) => a + b) / _scores.length;

  @override
  String toString() {
    var avg = average;
    return avg == null
        ? '$name: no scores yet'
        : '$name: avg ${avg.toStringAsFixed(1)} (${avg.level.name})';
  }
}

class Classroom {
  final Map<String, Student> _students = {};

  void add(Student s) => _students[s.id] = s;

  Student? find(String id) => _students[id];

  (Student, double)? topStudent() {
    (Student, double)? best;
    for (var s in _students.values) {
      var avg = s.average;
      if (avg != null && (best == null || avg > best.$2)) {
        best = (s, avg);
      }
    }
    return best;
  }

  Iterable<Student> get all => _students.values;

  // Simulate saving to a server
  Future<void> save() async {
    print('Saving ${_students.length} students...');
    await Future.delayed(Duration(seconds: 1));
    print('Saved!');
  }
}

Future<void> main() async {
  var room = Classroom()
    ..add(Student('1', 'Ali'))
    ..add(Student('2', 'Sara'))
    ..add(Student('3', 'Omar'))
    ..add(Student('4', 'Mona'));

  var data = {
    '1': [80.0, 92.0, 70.0],
    '2': [95.0, 98.0],
    '3': [40.0, 55.0, 30.0],
  };

  data.forEach((id, scores) {
    for (var score in scores) {
      room.find(id)?.addScore(score);
    }
  });

  try {
    room.find('1')!.addScore(150);
  } on RangeError catch (e) {
    print('Rejected: ${e.message}');
  }

  room.all.forEach(print);

  if (room.topStudent() case (var student, var avg)) {
    print('Top student: ${student.name} with ${avg.toStringAsFixed(1)}');
  }

  var passed = room.all
      .where((s) => (s.average ?? 0) >= 50)
      .map((s) => s.name)
      .toList();
  print('Passed: $passed');

  await room.save();
}
