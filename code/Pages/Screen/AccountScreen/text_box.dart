import 'package:flutter/material.dart';

class MyTextBox extends StatelessWidget {
  final String text;
  final String sectionName;
  final void Function()? onPressed;
  final Color color1;
  final Color color4;
  const MyTextBox({
    super.key,
    required this.text,
    required this.sectionName,
    required this.onPressed,
    required this.color1,
    required this.color4,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(color: color1, borderRadius: BorderRadius.circular(8)),
      padding: EdgeInsets.only(left: 15, bottom: 10),
      margin: EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //section name
            Text(
              sectionName,
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: color4),
            ),
            //edit button
            IconButton(
                onPressed: onPressed,
                icon: Icon(
                  Icons.settings,
                  color: color4,
                ))
          ],
        ),
        Text(
          text,
          style: TextStyle(fontSize: 20, color: color4),
        )
      ]),
    );
  }
}
