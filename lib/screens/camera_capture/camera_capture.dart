import 'dart:io';
import 'package:divine_deities/common/content_provider.dart';
import 'package:divine_deities/services/divine_deities_connection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


class CameraCaptureScreen extends StatefulWidget {
  const CameraCaptureScreen({super.key});

  @override
  State<CameraCaptureScreen> createState() => _CameraCaptureScreenState();
}

class _CameraCaptureScreenState extends State<CameraCaptureScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/backgroundImage.jpg'),
            colorFilter: ColorFilter.mode(Colors.blueGrey, BlendMode.modulate),
            fit: BoxFit.fitHeight),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: FutureBuilder(
            future: DivineDeitiesConnection.fetchCaption(context),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(color: Colors.white,),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Builder Error: ${snapshot.error}'),
                );
              }

              //instance of <ContentProvider> for using the values
              ContentProvider provider =
                  Provider.of<ContentProvider>(context, listen: false);

              if (provider.imageFileCaptured != null &&
                  provider.generatedCaption != null) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 30),
                    Center(
                      child: Image.file(
                        File(provider.imageFileCaptured!.path),
                        height: 400,
                        width: 280,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.only(left: 35.0, right: 15),
                      child: Text(
                        "Caption : ${provider.generatedCaption}",
                        style: GoogleFonts.laila(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                );
              } else {
                return Center(
                  child: Text(
                    "NOTHING CAPTURED",
                    style: GoogleFonts.baloo2(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              }
            }),
      ),
    );
  }
}
