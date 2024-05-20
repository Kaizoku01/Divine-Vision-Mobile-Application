import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleCard extends StatelessWidget {
  const TitleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 100),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12)
      ),
      child: Column(
        children: [
          Text("Divine Vision", style: GoogleFonts.yatraOne(fontSize: 28),),
          Text("Image Caption Generation for Indian Deities", style: GoogleFonts.yatraOne(fontSize: 13),),
        ],
      ),
    );
  }
}
