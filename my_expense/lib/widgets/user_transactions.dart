import 'package:flutter/material.dart';

import './new_transaction.dart';
import './transaction_list.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({Key key}) : super(key: key);

  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(
        id: 't1', title: 'New shoes', amount: 50.30, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'Groceries', amount: 80.63, date: DateTime.now()),
    Transaction(id: 't3', title: 'Bike', amount: 240.0, date: DateTime.now()),
    Transaction(
        id: 't4', title: 'Groceries', amount: 51.63, date: DateTime.now()),
    Transaction(
        id: 't5', title: 'Groceries', amount: 57.63, date: DateTime.now()),
    Transaction(id: 't6', title: 'Shirts', amount: 57.63, date: DateTime.now()),
  ];

  void _addNewTransaction(String txtitle, double txamount) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: txtitle,
      amount: txamount,
      date: DateTime.now(),
    );
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTrasaction(addTx: _addNewTransaction),
        TransactionList(_userTransactions),
      ],
    );
  }
}
