import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;

  NewTransaction(this.addTransaction);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  // const NewTransaction({Key key}) : super(key: key);
  final nameController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredName = nameController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredName.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget.addTransaction(enteredName, enteredAmount);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
        TextField(
          decoration: InputDecoration(hintText: 'On what did you spend?'),
          controller: nameController,
          onSubmitted: (_) => submitData(),
        ),
        TextField(
          decoration: InputDecoration(hintText: 'How much hryvnas?'),
          controller: amountController,
          keyboardType: TextInputType.number,
          onSubmitted: (_) => submitData(),
        ),
        TextButton(
          onPressed: submitData,
          style: TextButton.styleFrom(foregroundColor: Colors.purple),
          child: Text('Submit'),
        )
      ]),
    );
  }
}
