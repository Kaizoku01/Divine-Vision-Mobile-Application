import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContributorCard extends StatelessWidget {
  const ContributorCard({
    super.key,
    required this.imagePath,
    required this.name,
    required this.enrollment,
    required this.linkedInUrl,
  });
  final String imagePath;
  final String name;
  final String enrollment;
  final String linkedInUrl;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      tileColor: Colors.white,
      leading: CircleAvatar(
        backgroundImage: AssetImage(imagePath),
      ),
      title: Text(name),
      subtitle: Text(enrollment),
      trailing: IconButton(
          onPressed: () async {
            await launchUrl(Uri.parse(linkedInUrl));
          },
          icon: const Icon(Icons.link_rounded)),
    );
  }
}
