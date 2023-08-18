import 'package:expenses_tracker/widgets/charts/chart.dart';
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
      isScrollControlled: true,
      constraints: BoxConstraints.expand(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height),
      context: context,
      builder: (ctx) => NewExpense(addExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final int expenseIndex = _registeredExpenses.indexOf(expense);

    setState(() {
      _registeredExpenses.remove(expense);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense deleted.'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final bool isSmallScreen = width < 601;

    Widget mainContent = const Center(
      child: Text('No expenses. Time to add some!'),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        removeExpense: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses Tracker'),
        centerTitle: true,
        actions: !isSmallScreen
            ? [
                IconButton(
                  onPressed: _openAddExpenseOverlay,
                  icon: const Icon(Icons.add),
                ),
              ]
            : [],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 24,
          horizontal: 12,
        ),
        child: isSmallScreen
            ? Column(
                children: [
                  Chart(expenses: _registeredExpenses),
                  Expanded(child: mainContent),
                ],
              )
            : Row(
                children: [
                  Expanded(child: Chart(expenses: _registeredExpenses)),
                  Expanded(child: mainContent),
                ],
              ),
      ),
      floatingActionButton: isSmallScreen
          ? FloatingActionButton.extended(
              onPressed: _openAddExpenseOverlay,
              label: const Icon(Icons.add),
            )
          : null,
    );
  }
}
