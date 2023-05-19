import 'package:flutter/material.dart';

import 'Travel_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //color
  Color color1 = const Color.fromRGBO(134, 112, 112, 1);
  Color color2 = const Color.fromRGBO(213, 180, 180, 1);
  Color color3 = const Color.fromRGBO(228, 208, 208, 1);
  Color color4 = const Color.fromRGBO(245, 235, 235, 1);
  // place
  final List Place = [
    ['Hồ Gươm', 'assets/placeName/hoguom.jpg'],
    ['Bà Nà Hills', 'assets/placeName/banahill.jpg'],
    ['Vịnh Hạ Long', 'assets/placeName/halongbay.jpg'],
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color4,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 10, 0, 0),
            child: Container(
              height: 50,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  border: Border.all(color: color1),
                  borderRadius: BorderRadius.circular(12),
                  color: color3),
              child: Image.asset('assets/Icons/menu.png', color: color1),
            ),
          ),
          const SizedBox(height: 10),
          // new path
          Padding(
              padding: EdgeInsets.only(left: 25),
              child: Text(
                'Discovering',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 24, color: color1),
              )),
          const SizedBox(height: 10),

          // search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12)),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                        decoration: BoxDecoration(color: color4),
                        height: 30,
                        child: Image.asset('assets/Icons/search.png',
                            color: color1)),
                  ),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search for a place',
                          fillColor: Color.fromRGBO(245, 235, 235, 1),
                          filled: true),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 10),
          // For you traveling
          const Padding(
            padding: EdgeInsets.only(left: 25),
            child: Text('For you',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Color.fromRGBO(134, 112, 112, 1))),
          ),
          const SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Container(
              height: 160,
              child: ListView.builder(
                itemCount: Place.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return TravelingCard(
                    placeName: Place[index][0],
                    ImagePath: Place[index][1],
                  );
                },
              ),
            ),
          ),

          SizedBox(height: 20),

          //Must travel

          // Expanded(child: ListView.builder(itemBuilder: (context, index) {
          //   return MustTravelC();
          // }))
        ],
      ),
    );
  }
}
