import 'package:expenses_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';

final ColorScheme kColorScheme =
    ColorScheme.fromSeed(seedColor: Colors.deepPurple);

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
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        useMaterial3: true,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
          elevation: 8,
          shadowColor: Colors.black,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(vertical: 8),
          elevation: 2,
        ),
      ),
      home: const Expenses(),
    );
  }
}
