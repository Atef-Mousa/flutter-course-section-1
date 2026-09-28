class BankAccount {
  double _balance = 0;   // underscore = private

  // void deposit(double amount) {
  //   _balance += amount;
  // }

  set balance(double amount) {
    if (amount < 0) {
      print('Cannot set negative balance');
    } else {
      _balance = amount;
    }
  }

  // double getBalance() {
  //   return _balance;
  // }

  double get balance => _balance;  // getter
  
}

class SeePrivate {
  void show() {
    var account = BankAccount();
    print(account._balance);  // Error: _balance is private
  }

}