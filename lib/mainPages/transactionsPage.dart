// ignore_for_file: file_names, prefer_const_constructors, duplicate_ignore, avoid_unnecessary_containers, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PastTransactionsPage extends StatefulWidget {
  const PastTransactionsPage({super.key});

  @override
  State<PastTransactionsPage> createState() => _PastExpensesPageState();
}

class _PastExpensesPageState extends State<PastTransactionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Gastos Anteriores",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.greenAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ExpensesList(),
      ),
    );
  }
}

class ExpensesList extends StatefulWidget {
  const ExpensesList();

  @override
  State<ExpensesList> createState() => _ExpensesListState();
}

class _ExpensesListState extends State<ExpensesList> {
  // Exemplo de lista de gastos, substitua pelos dados reais
  final List<Map<String, dynamic>> expenses = [
    {'category': 'Lanche', 'amount': 36.00, 'date': DateTime(2024, 8, 28)},
    {
      'category': 'Supermercado',
      'amount': 120.50,
      'date': DateTime(2024, 8, 27)
    },
    {'category': 'Gasolina', 'amount': 15.75, 'date': DateTime(2024, 8, 26)},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: expenses.length,
      itemBuilder: (context, int index) {
        final expense = expenses[index];
        return SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: Colors.greenAccent, width: 0.25),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16.0),
              title: Text(
                '${expense['category']} - R\$${expense['amount'].toStringAsFixed(2)}',
                style: TextStyle(color: Colors.greenAccent, fontSize: 16),
              ),
              trailing: Text(
                DateFormat('dd MMMM yyyy').format(expense['date']),
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
          ),
        );
      },
    );
  }
}
