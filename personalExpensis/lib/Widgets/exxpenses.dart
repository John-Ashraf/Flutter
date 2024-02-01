import 'package:flutter/material.dart';
import 'package:personalexpensis/Models/expensesModel.dart';
import 'package:personalexpensis/Widgets/chart.dart';
import 'package:personalexpensis/Widgets/expensesItem.dart';

import 'new_expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> ReigesterdPersons = [
    Expense(
        category: Category.travel,
        title: "Maldif",
        amount: 700.0,
        date: DateTime.now()),
    Expense(
        category: Category.work,
        title: "fluttercourse",
        amount: 100.0,
        date: DateTime.now()),
    Expense(
        category: Category.liesure,
        title: "Dubai",
        amount: 200.0,
        date: DateTime.now()),
  ];

  @override
  void addExpense(Expense c) {
    setState(() {
      ReigesterdPersons.add(c);
    });
  }

  void removeexpense(Expense c) {
    setState(() {
      ReigesterdPersons.remove(c);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Expense Tracker"),
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (ctx) {
                      return New_expense(afk: addExpense);
                    });
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            graph(expensess:ReigesterdPersons),
            Expanded(
                child: ListView.builder(
                    itemCount: ReigesterdPersons.length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                          key: ValueKey(ReigesterdPersons[index]),
                          onDismissed: (diretion) =>
                              removeexpense(ReigesterdPersons[index]),
                          child: expenseitem(ReigesterdPersons[index]));
                    }))
          ],
        ),
      ),
    );
  }
}
