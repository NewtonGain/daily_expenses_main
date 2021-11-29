import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:daily_expenses/model/transition.dart';

class Transition extends StatelessWidget {
  final List<ProductTrastion> transaction;
  Transition({required this.transaction});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
          itemCount: transaction.length,
          itemBuilder: (cxt, int index) {
            return Container(
              child: Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      transaction[index].amount.toStringAsFixed(2),
                      style: TextStyle(
                          backgroundColor: Theme.of(context).primaryColor),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(transaction[index].title),
                        Text(DateFormat.yMMMEd()
                            .format(transaction[index].addTime))
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
