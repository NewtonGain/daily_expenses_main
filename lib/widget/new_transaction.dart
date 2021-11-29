import 'package:flutter/material.dart';
import 'package:daily_expenses/widget/input_transaction.dart';
import 'package:google_fonts/google_fonts.dart';

class NewTransaction extends StatelessWidget {
  final Function addTxTr;
  NewTransaction(this.addTxTr);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(40),
      color: Theme.of(context).primaryColor,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            child: Card(
              child: Text(
                'Chart',
                style: GoogleFonts.quicksand(
    textStyle: Theme.of(context).textTheme.headline4,
    
    fontSize: 48,
    
    
  )
                
              ),
            ),
          ),
          InputTransaction(this.addTxTr)
        ],
      ),
    );
  }
}
