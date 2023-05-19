import 'package:flutter/material.dart';

class EventTitle extends StatelessWidget {
  const EventTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          'Events',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            children: [
              Text(
                'Time line',
                style: TextStyle(
                    color: Colors.grey[700], fontWeight: FontWeight.bold),
              ),
              Icon(Icons.keyboard_arrow_down_outlined)
            ],
          ),
        )
      ]),
    );
  }
}
