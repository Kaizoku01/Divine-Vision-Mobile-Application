import 'dart:developer';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../common/content_provider.dart';
import 'package:http/http.dart' as http;

///[DivineDeitiesConnection] This class holds all the api call methods for communicating with divine-deities Flask Backend
class DivineDeitiesConnection {

  ///[fetchCaption] This method makes a post call to the divine-deities and receives a caption in response.
  static Future<void> fetchCaption(BuildContext context) async {
    XFile? imageFile =
        Provider.of<ContentProvider>(context, listen: false).imageFileCaptured;

    if (imageFile != null) {
      // Create a multipart request
      var request = http.MultipartRequest(
          'POST', Uri.parse('http://192.168.1.8:5000/predict'));

      // Add the image file to the request
      request.files
          .add(await http.MultipartFile.fromPath('file', imageFile.path));

      try {
        // Send the request
        var response = await request.send();

        // Check the response status code
        if (response.statusCode == 200) {
          // Parse the response body
          var caption = await response.stream.bytesToString();

          if (!context.mounted) return;

          Provider.of<ContentProvider>(context, listen: false)
              .setCaption(caption);

        } else {
          log('Request failed with status: ${response.statusCode}');
        }
      } catch (e) {
        log('API ERROR: $e');
      }
    }
  }

}