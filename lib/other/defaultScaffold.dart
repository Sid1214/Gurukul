import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// import 'package:gurukul/constraits.dart';

class DefaultScaffold extends StatelessWidget {
  const DefaultScaffold(
      {super.key,
      required this.title,
      required this.child,
      this.color,
      this.elevation});

  final String title;
  final Widget child;
  final Color? color;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: color == null ? Color(0xFFDADCDE) : color,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: elevation == null ? 0 : elevation,
          iconTheme: IconThemeData(
            color: Colors.black, // Change this color to your desired color
          ),
          title: Text(
            title,
            style: GoogleFonts.ubuntu(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: child);
  }
}
