import 'bank_account.dart';

void main()
{
    // var account = BankAccount();
    // // pirnt(account._balance);  // Error: _balance is private
    // print(account.getBalance());
    // account.deposit(100);
    // print(account.getBalance());

    var account = BankAccount();
    print(account.balance);  // getter

    account.balance = 100;  // setter
    print(account.balance);  // getter
    account.balance = -50;  // setter
    
    // var seePrivate = SeePrivate();
    // seePrivate.show();  

}