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
  // var stopwatch = Stopwatch();
  // stopwatch.start();

  var coffee = await makeCoffee();
  var toast = await makeToast();

  print("Breakfast ready: $coffee, $toast");
  print("Took ${stopwatch.elapsed.inSeconds} seconds");
}
