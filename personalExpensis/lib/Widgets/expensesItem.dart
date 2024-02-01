import 'package:flutter/material.dart';
import 'exxpenses.dart';
import 'expensesItem.dart';
import 'package:personalexpensis/Models/expensesModel.dart';
class expenseitem extends StatelessWidget {
  expenseitem(this.V,{super.key});
Expense V;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10,horizontal:20 ),
          child: Column(children:[
            Text(V.title),
            Row(
              children: [
                Text('\$${V.amount.toString()}'),
                Spacer(),
                Row(
                  children: [
                    Icon(Icons.alarm),
                    SizedBox(width: 4,),
                    Text(V.formattedDate()),
                  ],
                )
              ],
            )

          ])
      ),
    );
  }
}
