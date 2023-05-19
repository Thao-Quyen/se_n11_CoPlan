import 'package:flutter/material.dart';
import 'package:my_app/Pages/Screen/ExpenseScreen/date_time_helper.dart';
import 'package:my_app/Pages/Screen/ExpenseScreen/expense_item.dart';
import 'package:my_app/data/expense_database.dart';

class Data extends ChangeNotifier {
  // Colors theme expense screen:
  Color Theme_exsc1 = const Color.fromRGBO(134, 112, 112, 1);
  Color Theme_exsc2 = const Color.fromRGBO(213, 180, 180, 1);
  Color Theme_exsc3 = const Color.fromRGBO(228, 208, 208, 1);
  Color Theme_exsc4 = const Color.fromRGBO(245, 235, 235, 1);

  // Colors theme EventScreen
  // Color kYellowLight = const Color(0xFFFFF7EC)
  // Color kYellow = const Color(0xFFFAF0DA);
  // Color kYellowDark = const Color(0xFFEBBB7F);

  // Color kRedLight = Color(0xFFFCF0F0);
  // Color kRed = const Color(0xFFFBE4E6);
  // Color kRedDark = const Color(0xFFF08A8E);

  // Color kBlueLight = const Color(0xFFEDF4FE);
  // Color kBlue = const Color(0xFFE1EDFC);
  // Color kBlueDark = const Color(0xFFC0D3F8);
  // list of all expense
  List<ExpenseItem> overallExpenseList = [];

  // get expense list
  List<ExpenseItem> getAllExpenseList() {
    return overallExpenseList;
  }

  final db = HiveDataBase();
  // prepare data to display
  void prepareData() {
    // if there exist data, get it
    if (db.readData().isNotEmpty) {
      overallExpenseList = db.readData();
    }
  }

  // add new expense
  void addNewExpense(ExpenseItem newExpense) {
    overallExpenseList.add(newExpense);
    notifyListeners();
    db.saveData(overallExpenseList);
  }

  //delete expense
  void deleteExpense(ExpenseItem expense) {
    overallExpenseList.remove(expense);
    notifyListeners();
    db.saveData(overallExpenseList);
  }

  //get weekday
  String getDayName(DateTime dateTime) {
    switch (dateTime.weekday) {
      case 1:
        return 'Mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wed';
      case 4:
        return 'Thur';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      case 7:
        return 'Sun';
      default:
        return '';
    }
  }

  //get the date for the start of the week (sunday)

  DateTime startOfWeekDate() {
    DateTime? startOfWeek;

    // get today date
    DateTime today = DateTime.now();
    // go backward from today to find sunday
    for (int i = 0; i < 7; i++) {
      if (getDayName(today.subtract(Duration(days: i))) == 'Sun') {
        startOfWeek = today.subtract(Duration(days: i));
      }
    }

    return startOfWeek!;
  }

  /*
  convert overall list of expense into daily expense summary

  overall expense list =
  [
    [food, 2023/04/11, 10k],
    [traveling, 2023/04/12, 10m]
  ]

  DailyExpenseSummary = 
  [
    [2023/04/11: 10k],
    [2023/04/12: 10m],
  ]

  */
  Map<String, double> calculateDailyExpenseSummary() {
    Map<String, double> dailyExpenseSummary = {
      // date (yyyy/mm/dd): amountTotaltoday
    };

    for (var expense in overallExpenseList) {
      String date = convertDateTimeToString(expense.dateTime);
      double amount = double.parse(expense.amount);

      if (dailyExpenseSummary.containsKey(date)) {
        double currentAmount = dailyExpenseSummary[date]!;
        currentAmount += amount;
        dailyExpenseSummary[date] = currentAmount;
      } else {
        dailyExpenseSummary.addAll({date: amount});
      }
    }

    return dailyExpenseSummary;
  }
}
