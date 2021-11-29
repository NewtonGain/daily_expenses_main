import 'package:flutter/material.dart';

class InputTransaction extends StatefulWidget {
  final Function addFinal;
  InputTransaction(this.addFinal);

  @override
  _InputTransactionState createState() => _InputTransactionState();
}

class _InputTransactionState extends State<InputTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitAll() {
    final addtitle = titleController.text;
    final addAmount = double.parse(amountController.text);
    if (addtitle.isEmpty || addAmount < 0) {
      return;
    }
    widget.addFinal(addtitle, addAmount);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      //margin: EdgeInsets.zero,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              child: TextField(
                decoration: InputDecoration(
                  labelText: "title",
                  hintText: "Enter title",
                ),
                controller: titleController,
                onSubmitted: (_) => submitAll,
              ),
            ),
            Container(
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Amount",
                  hintText: "Enter amount",
                ),
                controller: amountController,
                onSubmitted: (_) => submitAll,
              ),
            ),
            Container(
              child: ElevatedButton(
                onPressed: () {
                  submitAll();
                },
                child: Text('Add Transition'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
