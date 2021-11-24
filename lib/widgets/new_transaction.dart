import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  NewTransaction(this.addTx);
  final titleController = TextEditingController();
  final amountController = TextEditingController();
void submitData(){
  final enterTitle= titleController;
  final enterAmount= amountController;
  if (enterTitle.text.isEmpty || double.parse(enterAmount.text) < 0) return;
  addTx(
      enterTitle.text,
       double.parse(
       enterAmount.text,
                  ),
                );
}
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Product',
                hintText: 'Input Product Name',
              ),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Amount',
                hintText: 'Input Product Amount',
              ),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_)=> submitData(),
            ),
            TextButton(
              onPressed:submitData,
              child: Text(
                'Add Transaction',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  backgroundColor: Colors.blue,
                ),
              ),
            ),
          ],
        ));
  }
}
