import 'package:flutter/material.dart';
import 'package:my_app/Pages/Screen/EventScreen/models/event.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:my_app/Pages/Screen/EventScreen/screens/details/detail.dart';

class Events extends StatelessWidget {
  const Events({super.key});

  @override
  Widget build(BuildContext context) {
    final eventsList = Event.generateEvents();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: GridView.builder(
          itemCount: eventsList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
          itemBuilder: (context, index) => eventsList[index].isLast
              ? _buildAddEvent()
              : _buildEvent(context, eventsList[index])),
    );
  }

  Widget _buildAddEvent() {
    return DottedBorder(
        borderType: BorderType.RRect,
        radius: Radius.circular(10),
        dashPattern: [10, 10],
        color: Colors.grey,
        strokeWidth: 2,
        child: const Center(
          child: Text(
            '+ Add',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ));
  }

  Widget _buildEvent(BuildContext context, Event event) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => DetailPage(event)));
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: event.bgColor, borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(event.iconData, color: event.iconColor, size: 35),
            const SizedBox(height: 30),
            Text(
              event.title!,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                _buildEventStatus(
                    event.btnColor!, event.iconColor!, '${event.left} left'),
                const SizedBox(width: 10),
                _buildEventStatus(
                    Colors.white, event.iconColor!, '${event.done} done')
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildEventStatus(Color bgColor, Color txColor, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
          color: bgColor, borderRadius: BorderRadius.circular(20)),
      child: Text(
        text,
        style: TextStyle(color: txColor),
      ),
    );
  }
}
