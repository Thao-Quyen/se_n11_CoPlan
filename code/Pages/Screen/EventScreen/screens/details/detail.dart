import 'package:flutter/material.dart';
import 'package:my_app/Pages/Screen/EventScreen/models/event.dart';
import 'package:my_app/Pages/Screen/EventScreen/screens/details/widgets/event_tile.dart';

import 'widgets/date_picker.dart';
import 'widgets/event_tl.dart';

class DetailPage extends StatelessWidget {
  final Event event;
  DetailPage(this.event);

  @override
  Widget build(BuildContext context) {
    final detailList = event.desc;
    return Scaffold(
        backgroundColor: Colors.black,
        body: CustomScrollView(
          slivers: [
            _buildAppBar(context),
            SliverToBoxAdapter(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DatePicker(),
                    EventTitle(),
                  ],
                ),
              ),
            ),
            detailList == null
                ? SliverFillRemaining(
                    child: Container(
                        color: Colors.white,
                        child: Center(
                            child: Text(
                          'No event today',
                          style: TextStyle(color: Colors.grey, fontSize: 18),
                        ))),
                  )
                : SliverList(
                    delegate: SliverChildBuilderDelegate(
                        (_, index) => EventTimeLine(detailList[index]),
                        childCount: detailList.length))
          ],
        ));
  }

  Widget _buildAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 90,
      backgroundColor: Colors.black,
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: Icon(Icons.arrow_back_ios),
        iconSize: 20,
      ),
      actions: [Icon(Icons.more_vert, size: 40)],
      flexibleSpace: FlexibleSpaceBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${event.title}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              'You have ${event.left} tasks for today!',
              style: TextStyle(fontSize: 12, color: Colors.grey[700]),
            )
          ],
        ),
      ),
    );
  }
}
