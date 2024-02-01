import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:personalexpensis/Models/expensesModel.dart';
import 'package:personalexpensis/Widgets/chartbar.dart';
class graph extends StatelessWidget {
   graph({super.key, required this.expensess});
final List<Expense>expensess;
 List <ExpenseBucket> Buckets(){
  return [
    ExpenseBucket.forcategory(expensess, Category.liesure),
    ExpenseBucket.forcategory(expensess, Category.travel),
    ExpenseBucket.forcategory(expensess, Category.work),
    ExpenseBucket.forcategory(expensess, Category.food),
  ];

}
   double getmaxbucket(){
     double mm=0;
     for(var e in Buckets()){
       if(e.sumexpense()>mm){
         mm=e.sumexpense();
       }
     }
     return mm;
   }
   void ff(ExpenseBucket gg){

     log(gg.sumexpense().toString());

   }
  @override
  Widget build(BuildContext context) {
    return Container(
    margin: EdgeInsets.all(16),
      padding: EdgeInsets.symmetric(vertical: 16,horizontal: 8),
      width: double.infinity,
      height: 175,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.0),
            Theme.of(context).colorScheme.primary.withOpacity(.3)
          ],
              begin:Alignment.bottomCenter,
            end: Alignment.topCenter,

        )
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
crossAxisAlignment: CrossAxisAlignment.end,
        children: [
        for (final ele in Buckets()) charbar(fill:ele.sumexpense()==0? 0:ele.sumexpense()/getmaxbucket()),
          ],
              
            ),
          ), SizedBox(
            height: 12,
          ),
           Row(
            children: Buckets().map((e) =>

              Expanded(child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: ElevatedButton(
                  onPressed: ()
                  {
                    log(e.sumexpense().toString());
                  },
                  child: Text("ok"),
                ),
              )

              )  ).toList()
            ),

        ],
      ),
    );
  }
}
