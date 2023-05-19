import 'package:flutter/material.dart';
import 'package:my_app/Pages/Screen/EventScreen/constants/colors.dart';

class Event {
  IconData? iconData;
  String? title;
  Color? bgColor;
  Color? iconColor;
  Color? btnColor;
  num? left;
  num? done;
  List<Map<String, dynamic>>? desc;
  bool isLast;
  Event(
      {this.iconData,
      this.title,
      this.bgColor,
      this.iconColor,
      this.btnColor,
      this.left,
      this.done,
      this.desc,
      this.isLast = false});
  static List<Event> generateEvents() {
    return [
      Event(
          iconData: Icons.person_rounded,
          title: 'Personal',
          bgColor: kYellowLight,
          iconColor: kYellowDark,
          btnColor: kYellow,
          left: 3,
          done: 1,
          desc: [
            {
              'time': '9:00 am',
              'title': 'Have a date with Hieu',
              'slot': '9:00 - 10:00 am',
              'tlColor': kRedDark,
              'bgColor': kRedLight
            },
            {
              'time': '10:00 am',
              'title': 'Go to the cinema',
              'slot': '10:00 - 12:00 am',
              'tlColor': kBlueDark,
              'bgColor': kBlueLight
            },
            {
              'time': '',
              'title': '',
              'slot': '',
              'tlColor': kBlueDark,
            },
            {
              'time': '12:00 am',
              'title': '',
              'slot': '',
              'tlColor': Colors.grey.withOpacity(0.3),
            },
            {
              'time': '1:00 pm',
              'title': 'Go to sleep',
              'slot': '1:00 - 2:00 pm',
              'tlColor': kYellowDark,
              'bgColor': kYellowLight
            },
            {
              'time': '2:00 pm',
              'title': '',
              'slot': '',
              'tlColor': Colors.grey.withOpacity(0.3),
            },
            {
              'time': '3:00 pm',
              'title': '',
              'slot': '',
              'tlColor': Colors.grey.withOpacity(0.3),
            },
          ]),
      Event(
          iconData: Icons.cases_rounded,
          title: 'Work',
          bgColor: kRedLight,
          iconColor: kRedDark,
          btnColor: kRed,
          left: 0,
          done: 0),
      Event(
          iconData: Icons.favorite_rounded,
          title: 'Travel',
          bgColor: kBlueLight,
          iconColor: kBlueDark,
          btnColor: kBlue,
          left: 0,
          done: 0),
      Event(isLast: true)
    ];
  }
}
