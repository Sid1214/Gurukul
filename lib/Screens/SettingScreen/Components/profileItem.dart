import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:gurukul/Screens/Dashboard/dashboardScreen.dart';
import 'package:gurukul/other/constraits.dart';

class ProfileItem extends StatefulWidget {
  ProfileItem({
    super.key,
    required this.heading,
    required this.title,
    required this.photoUrl,
  });

  String heading;
  String title;
  final String photoUrl;

  @override
  State<ProfileItem> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.heading,
              style: GoogleFonts.ubuntu(
                  fontSize: 12,
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: kPrimaryLightColor),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.person,
                    color: kPrimaryColor,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    widget.title,
                    style:
                        GoogleFonts.ubuntu(color: Colors.black, fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
