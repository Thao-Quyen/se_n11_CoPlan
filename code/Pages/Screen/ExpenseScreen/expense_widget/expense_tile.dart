import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:my_app/data/DATA_model.dart';
import 'package:provider/provider.dart';

class ExpenseTile extends StatelessWidget {
  final String name;
  final String amount;
  final DateTime dateTime;
  void Function(BuildContext)? deleteTapped;
  ExpenseTile(
      {super.key,
      required this.name,
      required this.amount,
      required this.dateTime,
      required this.deleteTapped});

  @override
  Widget build(BuildContext context) {
    return Consumer<Data>(
      builder: (context, value, child) => Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
            onPressed: deleteTapped,
            icon: Icons.delete,
            foregroundColor: value.Theme_exsc1,
            backgroundColor: value.Theme_exsc2,
            borderRadius: BorderRadius.circular(4),
          )
        ]),
        child: ListTile(
            title: Text(
              name,
              style: TextStyle(color: value.Theme_exsc1),
            ),
            subtitle: Text(
              '${dateTime.day} / ${dateTime.month} / ${dateTime.year}',
              style: TextStyle(color: value.Theme_exsc1),
            ),
            trailing: Text(
              '$amount VND',
              style: TextStyle(color: value.Theme_exsc1),
            )),
      ),
    );
  }
}
