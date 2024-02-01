import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';
enum Category { food, work, liesure, travel }
final datetime=DateFormat.yMMMd();
class Expense {
  static const uuid = Uuid();
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  Expense(
      {required this.category,
      required this.title,
      required this.amount,
      required this.date})
      : id = uuid.v4();
  String formattedDate(){
    return datetime.format(date);
  }

}

class ExpenseBucket{
  final List<Expense> expenses;
  final Category category;

  ExpenseBucket(this.expenses, this.category);
  ExpenseBucket.forcategory(List<Expense> allexpense, this.category):
        expenses=allexpense.where((element) => element.category==category).toList();
double sumexpense () {
double sum=0.0;
for(var e in expenses)
  sum+=e.amount;
return sum;
}

}
