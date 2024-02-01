//import 'package:flutter/foundation.dart';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personalexpensis/Models/expensesModel.dart';

class New_expense extends StatefulWidget {
   New_expense( {super.key,required this.afk});
  void Function (Expense c) afk;
  @override
  State<New_expense> createState() => _New_expenseState();
}

class _New_expenseState extends State<New_expense> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _titlecontroller.dispose();
  }

  DateTime? selectedtime;
  final _titlecontroller = TextEditingController();
  final _amountcontroller = TextEditingController();
  final now = DateTime.now();
  final formater = DateFormat.yMd();
  Category? _selectedcategory;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          TextField(
            controller: _titlecontroller,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text("Title"),

            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: TextField(

                  controller: _amountcontroller,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text("Amount"),
                    prefixText: '\$',
                  ),
                ),
              ),

              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  IconButton(
                      onPressed: () async {
                        final DateTime? pickeddate = await showDatePicker(
                            context: context,
                            initialDate: now,
                            firstDate:
                                DateTime(now.year - 5, now.month, now.day),
                            lastDate:
                                DateTime(now.year + 5, now.month, now.day));
                        setState(() {
                          selectedtime = pickeddate;
                        });
                      },
                      icon: Icon(Icons.calendar_month)),
                ],
              )),
              Text(selectedtime == null
                  ? 'no selected date'
                  : formater.format(selectedtime!))
            ],
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              DropdownButton(
                  value: _selectedcategory,
                  items: Category.values
                      .map(
                        (e) => DropdownMenuItem(
                          child: Text(e.name.toUpperCase()),
                          value: e,
                        ),
                      )
                      .toList(),
                  onChanged: (newcat) {
                    if (newcat == null) {
                      return;
                    }
                    setState(() {
                      _selectedcategory = newcat;
                    });
                  }),
              ElevatedButton(onPressed: () {
               final double? enteredamount=double.tryParse(_amountcontroller.text);
               final bool isinvalid=enteredamount==null||enteredamount<=0.0;
               if(isinvalid||selectedtime==null||_titlecontroller.text.trim().isEmpty){
                 showDialog(context: context, builder: (ctx){
                   return AlertDialog(
                     title: Text("Error"),
                     content:Text("Something Wrong"),
                     actions: [
                       ElevatedButton(onPressed: (){
                         Navigator.pop(ctx);
                       }, child: Text("Ok")),
                     ],
                   );
                 });
               }else{
                 widget.afk(Expense(
                     category: _selectedcategory!,
                     title: _titlecontroller.text,
                     amount: enteredamount,
                     date: selectedtime!));
               }
               Navigator.pop(context);

              }, child: Text("Save Expense")),
              ElevatedButton(
                  onPressed: () {
                    return Navigator.pop(context);
                  },
                  child: Text("Cancel"))
            ],
          )
        ],
      ),
    );
  }
}
