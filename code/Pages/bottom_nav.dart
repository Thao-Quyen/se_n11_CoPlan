import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'Screen/ExpenseScreen/Expense_screen.dart';
import 'Screen/EventScreen/Event_screen.dart';
import 'Screen/HomeScreen/Home_screen.dart';
import 'Screen/AccountScreen/account_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color color1 = const Color.fromRGBO(134, 112, 112, 1);
  int _selectedIndex = 0;

  static final List<Widget> _screens = <Widget>[
    HomeScreen(),
    EventScreen(),
    ExpenseScreen(),
    AccountScreen(),
  ];

  void _onTabChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _screens.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        color: color1,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          child: GNav(
            curve: Curves.bounceIn,
            backgroundColor: color1,
            color: Colors.black87,
            activeColor: Colors.black87,
            tabBackgroundColor: color1,
            gap: 8,
            padding: EdgeInsets.all(16),
            selectedIndex: _selectedIndex,
            onTabChange: _onTabChanged,
            tabs: [
              GButton(icon: Icons.home, text: 'Home'),
              GButton(icon: Icons.event, text: 'Events'),
              GButton(icon: Icons.wallet, text: 'Expense Tracker'),
              GButton(icon: Icons.account_circle_rounded, text: 'Account'),
            ],
          ),
        ),
      ),
    );
  }
}
