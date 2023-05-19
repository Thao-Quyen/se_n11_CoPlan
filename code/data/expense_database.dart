import 'package:hive/hive.dart';

import '../Pages/Screen/ExpenseScreen/expense_item.dart';

class HiveDataBase {
  //reference box
  final _myBox = Hive.box("expense_database1");
  //write data
  void saveData(List<ExpenseItem> allExpense) {
    List<List<dynamic>> allExpenseFormatted = [];
    for (var expense in allExpense) {
      List<dynamic> expenseFormatted = [
        expense.name,
        expense.amount,
        expense.dateTime
      ];
      allExpenseFormatted.add(expenseFormatted);
    }

    _myBox.put("ALL_EXPENSE", allExpenseFormatted);
  }

  // read data
  List<ExpenseItem> readData() {
    List savedExpense = _myBox.get("ALL_EXPENSE") ?? [];
    List<ExpenseItem> allExpense = [];

    for (int i = 0; i < savedExpense.length; i++) {
      String name = savedExpense[i][0];
      String amount = savedExpense[i][1];
      DateTime dateTime = savedExpense[i][2];

      ExpenseItem expense =
          ExpenseItem(name: name, amount: amount, dateTime: dateTime);
      allExpense.add(expense);
    }
    return allExpense;
  }
}
