import 'package:flutter/material.dart';
import 'package:daily_expenses/model/transition.dart';
import 'package:daily_expenses/widget/new_transaction.dart';
import 'package:daily_expenses/widget/transitionList.dart';
import 'package:google_fonts/google_fonts.dart';

class UserTransction extends StatefulWidget {
  const UserTransction({Key? key}) : super(key: key);

  @override
  _UserTransctionState createState() => _UserTransctionState();
}

class _UserTransctionState extends State<UserTransction> {
  // ignore: non_constant_identifier_names
  List<ProductTrastion> _product_transtion = [
    ProductTrastion(
      id: '1',
      title: "Python Book",
      amount: 450.0,
      addTime: DateTime.now(),
    ),
    ProductTrastion(
      id: '2',
      title: "Dart Book",
      amount: 650.0,
      addTime: DateTime.now(),
    ),
  ];
  void _addTransaction(String title, double amount) {
    final newTx = ProductTrastion(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      addTime: DateTime.now(),
    );
    setState(() {
      _product_transtion.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        NewTransaction(_addTransaction),
        Transition(transaction: _product_transtion),
      ],
    );
  }
}
