import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'screens/home/events_widget.dart';
import 'screens/home/vote_for_me.dart';

class EventScreen extends StatelessWidget {
  //color
  Color color1 = const Color.fromRGBO(134, 112, 112, 1);
  Color color2 = const Color.fromRGBO(213, 180, 180, 1);
  Color color3 = const Color.fromRGBO(228, 208, 208, 1);
  Color color4 = const Color.fromRGBO(245, 235, 235, 1);
  // current user
  final currentUser = FirebaseAuth.instance.currentUser!;
  // user
  final userCollection = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VoteForMe(),
          Container(
              padding: EdgeInsets.all(15),
              child: Text(
                'Events',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              )),
          Expanded(
            child: Events(),
          )
        ],
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton(
      //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      //   elevation: 0,
      //   onPressed: () {},
      //   backgroundColor: Colors.black,
      //   child: Icon(Icons.add, size: 35),
      // ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: color4,
      elevation: 0,
      title: Row(
        children: [
          Container(
            height: 45,
            width: 45,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset('assets/Event_img/avatar.jpg'),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            'Hello ' + currentUser.email!.split('@')[0],
            style: TextStyle(
                color: Colors.black, fontSize: 26, fontWeight: FontWeight.bold),
          )
        ],
      ),
      actions: [
        Icon(
          Icons.more_vert,
          color: Colors.black,
          size: 40,
        )
      ],
    );
  }
}
