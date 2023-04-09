import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  // const TransactionList({Key? key}) : super(key: key);

//   @override
//   State<TransactionList> createState() => _TransactionListState();
// }
//
// class _TransactionListState extends State<TransactionList> {
final List<Transaction> transactions;
TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      alignment: Alignment.center,
      child: transactions.isEmpty ? Column(
        children: <Widget>[
        Text('No transactions added yet',
        ),
        SizedBox(
          height: 50,
        ),
        Container(
          height: 300,
            child: Image.asset(
              'assets/images/waiting.png',
              fit: BoxFit.cover,)),
      ],): ListView.builder(
        itemBuilder: (ctx, index){
          return Card(
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.amber[800],
                          width: 2)),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    '\$${transactions[index].amount}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.amber[800],
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text(
                        transactions[index].title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,

                        ),),
                    ),
                    Container(
                      child: Text(
                        // DateFormat('yyyy/MM/dd hh:mm').format(tx.date),
                        DateFormat().add_yMd().add_jm().format(transactions[index].date),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.blueGrey
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        },
        itemCount: transactions.length,
        // children: transactions.map((tx) { }).toList(),
      ),
    );
  }
}
