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

  var coffeeFuture = makeCoffee(); // starts immediately, don't wait yet
  var toastFuture =
      makeToast(); // starts immediately too, runs alongside coffee

  var coffee = await coffeeFuture; // now wait for coffee to finish
  var toast = await toastFuture; // toast is probably already done by now

  print("Breakfast ready: $coffee, $toast");
  print("Took ${stopwatch.elapsed.inSeconds} seconds");
}
