import 'package:expenses_tracker/expenses.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ExpensesTracker());
}

class ExpensesTracker extends StatelessWidget {
  const ExpensesTracker({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expenses Tracker',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Expenses(),
    );
  }
}
