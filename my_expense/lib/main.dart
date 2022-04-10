import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import './widgets/new_transaction.dart';
import './models/transaction.dart';
import './widgets/transaction_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal expenses',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.green,
        fontFamily: 'Quicksand',
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // String titleInput;
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
    Transaction(
        id: 't6', title: 'Shirts', amount: 421.63, date: DateTime.now()),
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

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (bCtx) {
        return GestureDetector(
          child: NewTrasaction(addTx: _addNewTransaction),
          onTap: () {},
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expeneses',
            style: TextStyle(fontFamily: 'Opensands')),
        actions: <Widget>[
          IconButton(
            onPressed: () => _startAddNewTransaction(context),
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.green,
                child: Container(child: Text('CHART!')),
                elevation: 5,
              ),
            ),
            TransactionList(_userTransactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
