import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DescriptionCard extends StatelessWidget {
  const DescriptionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 50),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Text(
        """Employing our custom dataset, Divine1K, comprising over 1000 images of Indian gods and goddesses, we employ five distinct deep learning models. Employing three diverse evaluation techniques, each model undergoes training across varying epochs. \n\nThis comprehensive approach ensures robustness and accuracy in generating descriptive captions, enriching the understanding and interpretation of religious imagery while embracing the nuances of Indian mythology and symbolism.""",
        style: GoogleFonts.laila(fontSize: 14,fontWeight: FontWeight.w500),
      ),
    );
  }
}
