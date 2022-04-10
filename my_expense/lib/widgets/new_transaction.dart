import 'package:flutter/material.dart';

// import './user_transactions.dart';

class NewTrasaction extends StatefulWidget {
  final Function addTx;

  NewTrasaction({Function this.addTx});

  @override
  State<NewTrasaction> createState() => _NewTrasactionState();
}

class _NewTrasactionState extends State<NewTrasaction> {
  // const NewTrasaction({Key key}) : super(key: key);
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget.addTx(enteredTitle, enteredAmount);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) {
                submitData();
              },
              // onChanged: (String val) {
              //   titleInput = val;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) {
                submitData();
              },
              // onChanged: (String val) {
              //   amountInput = val;
              // },
            ),
            FlatButton(
              onPressed: () {
                submitData();
              },
              child: Text('Add Transaction'),
              textColor: Colors.purple,
            )
          ],
          crossAxisAlignment: CrossAxisAlignment.end,
        ),
        padding: EdgeInsets.all(10),
      ),
      elevation: 5,
    );
  }
}
