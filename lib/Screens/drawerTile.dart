import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gurukul/Screens/calenderScreen/calenderScreen.dart';

class DrawerTile extends StatelessWidget {
  const DrawerTile(
      {super.key,
      required this.icon,
      required this.title,
      required this.onSelect});

  final String title;
  final Icon icon;
  final void Function() onSelect;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: GoogleFonts.ubuntu(fontWeight: FontWeight.bold),
      ),
      onTap: onSelect,
    );
  }
}
