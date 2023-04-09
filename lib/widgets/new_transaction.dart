import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  // const NewTransaction({Key? key}) : super(key: key);
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData(){
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    // check if there is value or not
    if (enteredTitle.isEmpty || enteredAmount<=0){
      return;
    }

    widget.addTx(
      enteredTitle,
      enteredAmount
    );

    //close the pop screen when done one record
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(5),
        child: Column(children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: 'Title'),
            controller: titleController,
            // onChanged: (val){
            //   titleInput = val;
            // },
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Amount'),
            controller: amountController,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            onSubmitted: (_)=>submitData(), //the underscore here means I got an
            // argument but I don't really care

            // onChanged: (val) => amountInput=val,
          ),
          TextButton(
            onPressed: (){
              // print(titleInput);
              // print(amountInput);
              // print(titleController.text);
              submitData;
            },
            child: Text('Add Transaction'),
            style: TextButton.styleFrom(
                foregroundColor:Colors.amber[800],
                textStyle: TextStyle(
                    fontSize: 18)),
          )
        ],
        ),
      ),
    );
  }
}
