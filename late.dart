// The two jobs of late

// Job 1: Delay assignment (no initializer at declaration)
//   "I promise this non-nullable variable will have a value before I use it."

// late String name;
// void main() {
//   name = 'Aisha';
//   print(name);

// Job 2: Lazy initialization
//   "Don't compute this value until someone reads it for the first time."

class Report {
  late String summary = generateExpensiveSummary(); // imagine this takes 3 seconds

  String generateExpensiveSummary() {
    print('   Doing expensive work...');
    return 'Summary text';
  }
}

// ============================================================
// Job 1 examples: delayed assignment
// ============================================================

// Top-level late variable
late String appName;

// A field that can't be set in the constructor
// (e.g. set in an init() method — like initState() in Flutter)
class ProfileScreen {
  late String userName;
  late int followers;

  void init() {
    // pretend we loaded this from storage
    userName = 'Aisha';
    followers = 120;
  }

  void show() => print('   $userName has $followers followers');
}

// late vs nullable: without late you'd need String? and ! everywhere
class WithoutLate {
  String? token;
  void login() => token = 'abc';
  int tokenLength() => token!.length; // need ! every time
}

class WithLate {
  late String token;
  void login() => token = 'abc';
  int tokenLength() => token.length; // clean
}

// ============================================================
// Job 2 examples: lazy initialization
// ============================================================

class Counter {
  static int created = 0;
  // Lazy: each field is computed only when first read, then cached
  late final int id = ++created;
}

class Settings {
  final String userId;
  Settings(this.userId);

  // A late initializer CAN use `this` (normal field initializers can't)
  late String cacheKey = 'settings_$userId';
}

String loadConfig() {
  print('   loadConfig() called');
  return 'config-v1';
}

// ============================================================
// late final: assign once, later
// ============================================================
class Game {
  late final String winner;

  void finish(String name) {
    winner = name; // first time: OK
  }
}

void main() {
  // ------------------------------------------------------------
  // 0) Original lazy example
  // ------------------------------------------------------------
  print('0) Lazy initialization:');
  var report = Report();
  print('   Report created'); // expensive work didn't run yet!
  print('   ${report.summary}'); // runs NOW, on first access
  print('   ${report.summary}'); // cached — doesn't run again

  // ------------------------------------------------------------
  // 1) Top-level late
  // ------------------------------------------------------------
  appName = 'Flutter Course';
  print('1) $appName');

  // ------------------------------------------------------------
  // 2) Late fields set in an init method
  // ------------------------------------------------------------
  print('2) Late fields:');
  var screen = ProfileScreen();
  screen.init();
  screen.show();

  // ------------------------------------------------------------
  // 3) Reading before assigning -> LateInitializationError (runtime!)
  // ------------------------------------------------------------
  var screen2 = ProfileScreen();
  try {
    screen2.show(); // forgot to call init()
  } catch (e) {
    print('3) $e');
  }
  // The compiler trusts you — late moves the check from compile time to runtime.

  // ------------------------------------------------------------
  // 4) late vs nullable
  // ------------------------------------------------------------
  var a = WithoutLate()..login();
  var b = WithLate()..login();
  print('4) ${a.tokenLength()} vs ${b.tokenLength()}');

  // ------------------------------------------------------------
  // 5) Lazy local variable: never computed if never used
  // ------------------------------------------------------------
  print('5) Lazy local:');
  late String config = loadConfig();
  var needConfig = DateTime.now().year < 2000; // false
  if (needConfig) {
    print(config);
  }
  print('   loadConfig() was never called because config was never read');

  late String config2 = loadConfig();
  print('   before reading config2');
  print('   $config2');

  // ------------------------------------------------------------
  // 6) Lazy fields are computed per object, on first read
  // ------------------------------------------------------------
  var c1 = Counter();
  var c2 = Counter();
  print('6) created so far: ${Counter.created}'); // 0 — nothing read yet
  print('   c2.id = ${c2.id}'); // 1 — c2 read first
  print('   c1.id = ${c1.id}'); // 2
  print('   c1.id again = ${c1.id}'); // still 2 (cached)

  // ------------------------------------------------------------
  // 7) late initializer using `this`
  // ------------------------------------------------------------
  print('7) ${Settings('u42').cacheKey}');

  // ------------------------------------------------------------
  // 8) late final: can be assigned only ONCE
  // ------------------------------------------------------------
  var game = Game();
  game.finish('Ali');
  print('8) winner: ${game.winner}');
  try {
    game.finish('Sara'); // second assignment -> runtime error
  } catch (e) {
    print('8) $e');
  }

  // ------------------------------------------------------------
  // 9) late local with definite assignment in branches
  // ------------------------------------------------------------
  late String message;
  var hour = DateTime.now().hour;
  if (hour < 12) {
    message = 'Good morning';
  } else {
    message = 'Good afternoon';
  }
  print('9) $message');

  // ------------------------------------------------------------
  // Summary
  // ------------------------------------------------------------
  // late T x;            -> assign later, error if read before assignment
  // late T x = expr;     -> lazy: expr runs on first read, then cached
  // late final T x;      -> assign later, only once
  // late final T x = e;  -> lazy + read-only
  // Use late only when you're SURE it will be set before use;
  // otherwise prefer a nullable type (T?).
}
