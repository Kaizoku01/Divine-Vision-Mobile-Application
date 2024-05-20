import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:divine_deities/screens/project_introduction/title_card.dart';
import 'package:flutter/material.dart';
import 'description_card.dart';
import 'link_card.dart';

class ProjectIntroScreen extends StatelessWidget {
  const ProjectIntroScreen({ super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/backgroundImage.jpg'),
          colorFilter: ColorFilter.mode(Colors.blueGrey, BlendMode.modulate),
          fit: BoxFit.fitHeight,
        ),
      ),
      child: const Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              TitleCard(),
              DescriptionCard(),
              LinkCard(),
            ],
          ),
        )
      ),
    );
  }
}
