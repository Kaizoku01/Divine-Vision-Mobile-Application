import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkCard extends StatelessWidget {
  const LinkCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                const Icon(FontAwesomeIcons.github),
                const SizedBox(width: 20),
                GestureDetector(
                  child: Text("Repository", style: GoogleFonts.baloo2(fontSize: 15, decoration: TextDecoration.underline,decorationColor: Colors.blue.shade300,decorationThickness: 2,),),
                  onTap: () async{
                    await launchUrl(Uri.parse("https://github.com/Kaizoku01/Divine-Vision-Deep-Learning-Based-Image-Caption-Generation-for-Indian-Deities"));
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                const Icon(FontAwesomeIcons.solidFile),
                const SizedBox(width: 20),
                GestureDetector(
                  child: Text("Report" ,style: GoogleFonts.baloo2(fontSize: 15, decoration: TextDecoration.underline,decorationColor: Colors.blue.shade300,decorationThickness: 2,),),
                  onTap: () async{
                    await launchUrl(Uri.parse("https://docs.google.com/document/d/17tYbGJc2BtSx4YraGbYdpgGfJG2reOGb/edit?usp=sharing&ouid=113241999829031886409&rtpof=true&sd=true"));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
