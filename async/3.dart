Future<String> makeCoffee() async {
  print("Starting coffee...");
  await Future.delayed(Duration(seconds: 3));
  print("Coffee is ready!");
  return "Coffee";
}

Future<String> makeToast() async {
  print("Starting toast...");
  await Future.delayed(Duration(seconds: 2));
  print("Toast is ready!");
  return "Toast";
}

void main() async {
  var stopwatch = Stopwatch()..start();

  await makeCoffee(); // waits 3s
  await makeToast(); // then waits 2s — same mistake as Version 1!

  print("Took ${stopwatch.elapsed.inSeconds} seconds");
}
