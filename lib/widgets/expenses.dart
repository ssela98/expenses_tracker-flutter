import 'package:expenses_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expenses_tracker/models/expense.dart';
import 'package:expenses_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Arduino Guitar',
      amount: 145.90,
      date: DateTime(2023, 8, 14, 23, 30),
      category: Category.leisure,
    ),
    Expense(
      title: 'Groceries',
      amount: 70.95,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: 'DALL E',
      amount: 17.67,
      date: DateTime(2023, 8, 15, 22, 30),
      category: Category.leisure,
    ),
    Expense(
      title: 'Wedding',
      amount: 237.22,
      date: DateTime(2023, 8, 25, 6, 30),
      category: Category.travel,
    )
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => const NewExpense(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses Tracker'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 115, 30, 255),
      ),
      body: Column(
        children: [
          const Text('The chart...'),
          Expanded(child: ExpensesList(expenses: _registeredExpenses)),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _openAddExpenseOverlay,
        label: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
