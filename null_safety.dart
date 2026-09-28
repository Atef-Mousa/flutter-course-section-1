// Null safety prevents an error that results from unintentional access of variables set to null.
// The error is called a null dereference error. A null dereference error occurs when you access a property or call a method on an expression
// that evaluates to null. An exception to this rule is when null supports the property or method, like toString() or hashCode. With null safety,
// the Dart compiler detects these potential errors at compile time.

// The problem isn't that manual checking is impossible — it's
//  that manual checking is optional, easy to forget, and unenforceable at scale. Let me show you why that matters.

// String getUserName() {
//   return null;
// }
// void main()
// {

//     String x = getUserName();
//     print(x.length);

// }

String? getUserName() {
  return null;
}

void main() {
  String? x = getUserName();
  if (x != null) {
    print(x.length);
  } else {
    print("x is null");
  }
  // print(x.length);
}
