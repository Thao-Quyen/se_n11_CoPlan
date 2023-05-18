import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_app/Intro_page/onBoarding_screen.dart';
import 'package:my_app/Pages/Screen/EventScreen/Event_screen.dart';
import 'package:my_app/data/DATA_model.dart';
import 'package:my_app/Pages/bottom_nav.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Pages/Screen/ExpenseScreen/Expense_screen.dart';
import 'Pages/welcome_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  await Hive.openBox("expense_database1");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Data(),
      builder: (context, child) => MaterialApp(
          title: 'Coplan_demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primarySwatch: Colors.blue),
          //home: WelcomePage()),
          //home: HomePage()),
          //home: EventScreen()),
          home: OnBoardingScreen()),
    );
  }
}
