import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'contributor_card.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/backgroundImage.jpg'),
            fit: BoxFit.fitHeight,
            colorFilter: ColorFilter.mode(Colors.blueGrey, BlendMode.modulate)),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: ListView(
            children:  [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Center(
                  child: Text("CONTRIBUTORS",style: GoogleFonts.baloo2(fontSize: 32,fontWeight: FontWeight.w500,color: Colors.yellowAccent),),
                ),
              ),
              const ContributorCard(
                name: "Sarvagya Saxena",
                enrollment: "9920103123",
                linkedInUrl: "https://www.linkedin.com/in/sarvagya-saxena-513a841b6/",
                imagePath: "assets/sarvagya.jpeg",
              ),
              const SizedBox(height: 20),
              const ContributorCard(
                name: "Shubham Singh",
                enrollment: "9920103111",
                linkedInUrl: "https://www.linkedin.com/in/shubham-singh-96b4751b4/",
                imagePath: "assets/shubham.jpeg",
              ),
              const SizedBox(height: 20),
              const ContributorCard(
                name: "Honey Baranwal",
                enrollment: "9920103169",
                linkedInUrl: "https://www.linkedin.com/in/honey-baranwal-398904202/",
                imagePath: "assets/honey.jpeg",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
