import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gurukul/other/constraits.dart';

void showDetailsPopup(
    BuildContext context, String activity, String description) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        // backgroundColor: kPrimaryLightColor,
        title: DefaultText(
          title: '$activity',
          color: Colors.black,
          fontsize: 20,
          weight: FontWeight.bold,
        ),
        content: DefaultText(
          title: '$description',
          color: Colors.black54,
          fontsize: 15,
          weight: FontWeight.normal,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'Close',
              style: GoogleFonts.ubuntu(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      );
    },
  );
}
