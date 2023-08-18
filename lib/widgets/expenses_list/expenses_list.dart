import 'package:expenses_tracker/main.dart';
import 'package:expenses_tracker/models/expense.dart';
import 'package:expenses_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    required this.expenses,
    required this.removeExpense,
    super.key,
  });

  final List<Expense> expenses;
  final void Function(Expense expense) removeExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, i) => Dismissible(
        key: ValueKey(expenses[i]),
        background: Container(
          color: kColorScheme.error,
          margin: Theme.of(context).cardTheme.margin,
        ),
        onDismissed: (direction) {
          removeExpense(expenses[i]);
        },
        child: ExpenseItem(expenses[i]),
      ),
    );
  }
}
