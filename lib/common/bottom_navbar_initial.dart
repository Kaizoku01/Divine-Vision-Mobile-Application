import 'dart:developer';

import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:divine_deities/common/content_provider.dart';
import 'package:divine_deities/screens/about_us/about_us.dart';
import 'package:divine_deities/screens/project_introduction/project_introduction.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../screens/camera_capture/camera_capture.dart';

class BottomNavBarInitial extends StatefulWidget {
  const BottomNavBarInitial({Key? key}) : super(key: key);

  @override
  State<BottomNavBarInitial> createState() => _BottomNavBarInitialState();
}

class _BottomNavBarInitialState extends State<BottomNavBarInitial> {
  final _pageController = PageController(initialPage: 0);

  final NotchBottomBarController _controller =
      NotchBottomBarController(index: 0);

  int maxCount = 3;

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> bottomBarPages = [
      ProjectIntroScreen(),
      const CameraCaptureScreen(),
      const AboutUsScreen()
    ];
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
            bottomBarPages.length, (index) => bottomBarPages[index]),
      ),
      extendBody: true,
      bottomNavigationBar: (bottomBarPages.length <= maxCount)
          ? AnimatedNotchBottomBar(
              notchBottomBarController: _controller,
              color: Colors.white,
              showLabel: true,
              textOverflow: TextOverflow.visible,
              maxLine: 1,
              shadowElevation: 5,
              kBottomRadius: 28.0,
              notchColor: Colors.black87,
              removeMargins: false,
              bottomBarWidth: 500,
              showShadow: false,
              durationInMilliSeconds: 300,
              itemLabelStyle: const TextStyle(fontSize: 10),
              elevation: 1,
              bottomBarItems: const [
                BottomBarItem(
                  inActiveItem: Icon(
                    FontAwesomeIcons.solidHeart,
                    color: Colors.redAccent,
                  ),
                  activeItem: Icon(
                    FontAwesomeIcons.solidHeart,
                    color: Colors.blueAccent,
                  ),
                  itemLabel: 'Project',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    FontAwesomeIcons.cameraRetro,
                    color: Colors.redAccent,
                  ),
                  activeItem: Icon(
                    FontAwesomeIcons.cameraRetro,
                    color: Colors.blueAccent,
                  ),
                  itemLabel: 'Camera',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    FontAwesomeIcons.peopleGroup,
                    color: Colors.redAccent,
                  ),
                  activeItem: Icon(
                    FontAwesomeIcons.peopleGroup,
                    color: Colors.blueAccent,
                  ),
                  itemLabel: 'Contributors',
                ),
              ],
              onTap: (index) async {
                log('current selected index $index');
                if(index == 1){
                  final ImagePicker picker = ImagePicker();
                  final XFile? photo =
                  await picker.pickImage(source: ImageSource.camera);
                  if (photo != null) {
                    if (!context.mounted) return;

                    Provider.of<ContentProvider>(context, listen: false)
                        .setImageFile(photo);
                  }
                }
                _pageController.jumpToPage(index);
              },
              kIconSize: 24.0,
            )
          : null,
    );
  }
}
