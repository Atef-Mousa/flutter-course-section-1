// Lesson 15 — Error handling: try / catch / finally / throw

// Custom exception
class InsufficientFundsException implements Exception {
  final double requested;
  final double available;
  InsufficientFundsException(this.requested, this.available);

  @override
  String toString() =>
      'InsufficientFundsException: requested $requested, available $available';
}

double withdraw(double balance, double amount) {
  if (amount <= 0) {
    throw ArgumentError('Amount must be positive');
  }
  if (amount > balance) {
    throw InsufficientFundsException(amount, balance);
  }
  return balance - amount;
}

void main() {
  // Basic try / catch
  try {
    var n = int.parse('12a');
    print(n);
  } catch (e) {
    print('Caught: $e');
  }

  // Catch specific types with `on`
  try {
    withdraw(100, 500);
  } on InsufficientFundsException catch (e) {
    print('Custom error -> $e');
  } on ArgumentError catch (e) {
    print('Argument error -> ${e.message}');
  } catch (e, stackTrace) {
    print('Something else: $e');
    print(stackTrace);
  } finally {
    print('finally always runs (close files, connections, ...)');
  }

  try {
    withdraw(100, -5);
  } on ArgumentError catch (e) {
    print('Argument error -> ${e.message}');
  }

  // rethrow: handle partially, then pass the error up
  try {
    try {
      throw FormatException('Bad data');
    } catch (e) {
      print('Logging: $e');
      rethrow;
    }
  } on FormatException catch (e) {
    print('Handled at the top: ${e.message}');
  }

  print('New balance: ${withdraw(100, 30)}');
}
