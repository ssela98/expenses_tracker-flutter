import 'package:expenses_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          children: [
            Text(expense.title),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('${expense.amount.toStringAsFixed(2)}€'),
                Row(
                  children: [
                    const Icon(
                      Icons.hot_tub_outlined,
                      size: 24,
                    ),
                    Text(expense.date.toString()),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
