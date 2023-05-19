import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TravelingCard extends StatelessWidget {
  final String placeName;
  final String ImagePath;
  const TravelingCard(
      {super.key, required this.placeName, required this.ImagePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(placeName,
              style: GoogleFonts.pacifico(
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                  color: const Color.fromRGBO(134, 112, 112, 1))),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              width: 200,
              color: Colors.grey[200],
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(ImagePath), fit: BoxFit.cover)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
