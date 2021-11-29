import 'package:flutter/material.dart';
import 'model/transition.dart';
import 'widget/new_transaction.dart';
import 'widget/transitionList.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      
      title: "Daily Expenses",
      theme: ThemeData(
        primarySwatch: Colors.red, accentColor: Colors.blue),
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
 
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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

  void _addnewTransaction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            child: NewTransaction(_addTransaction),
            onTap: () {},
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Daily Expenses"),
        actions: [
          IconButton(
              onPressed: () => _addnewTransaction(context),
              icon: Icon(Icons.add))
        ],
      ),
      backgroundColor: Colors.grey.shade400,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Transition(transaction: _product_transtion),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addnewTransaction(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
