// The two jobs of late

// Job 1: Delay assignment (no initializer at declaration)


// late String name;  
// void main() {
//   name = 'Aisha';    
//   print(name);    


// Job 2: Lazy initialization (the part you quoted)


class Report {
  late String summary = generateExpensiveSummary();  // imagine this takes 3 seconds

  String generateExpensiveSummary() {
    print('Doing expensive work...');
    return 'Summary text';
  }
}

void main() {
  var report = Report();   
  print('Report created');

  print(report.summary);   
}