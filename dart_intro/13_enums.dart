// Lesson 13 — Enums

// Simple enum
enum Weekday { sun, mon, tue, wed, thu, fri, sat }

// Enhanced enum: fields, constructor, methods
enum OrderStatus {
  pending('Waiting for payment'),
  shipped('On the way'),
  delivered('Delivered');

  final String label;
  const OrderStatus(this.label);

  bool get isDone => this == OrderStatus.delivered;
}

void main() {
  var today = Weekday.fri;
  print(today); // Weekday.fri
  print(today.name); // fri
  print(today.index); // 5
  print(Weekday.values); // all values

  // Enums work great with switch (the compiler checks all cases)
  var type = switch (today) {
    Weekday.fri || Weekday.sat => 'Weekend',
    _ => 'Workday',
  };
  print(type);

  for (var status in OrderStatus.values) {
    print('${status.name}: ${status.label}, done: ${status.isDone}');
  }

  // Look up by name
  var s = OrderStatus.values.byName('shipped');
  print(s.label);
}
