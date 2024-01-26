import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AttendenceToggleButtons extends StatefulWidget {
  const AttendenceToggleButtons({super.key});
  @override
  _AttendenceButtonsExampleState createState() =>
      _AttendenceButtonsExampleState();
}

class _AttendenceButtonsExampleState extends State<AttendenceToggleButtons> {
  List<bool> isSelected = [true, false, false, false];
  List<String> days = [
    'This Week',
    'This Month',
    'This Year',
    'Custom',
  ];

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      children: [
        buildToggleButton(0),
        buildToggleButton(1),
        buildToggleButton(2),
        buildToggleButton(3),
      ],
      isSelected: isSelected,
      onPressed: (int index) {
        setState(() {
          isSelected[index] = !isSelected[index];
          for (int i = 0; i < isSelected.length; i++)
            if (i != index) isSelected[i] = !isSelected[index];
        });
      },
    );
  }

  Widget buildToggleButton(int index) {
    return Container(
      width: 90,
      height: 50,
      alignment: Alignment.center,

      color: isSelected[index] ? Color(0xFF655B96) : Color(0xFF9747FF),
      // borderRadius: BorderRadius.circular(25),

      child: Text(
        days[index],
        style: GoogleFonts.ubuntu(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
      ),
    );
  }
}
