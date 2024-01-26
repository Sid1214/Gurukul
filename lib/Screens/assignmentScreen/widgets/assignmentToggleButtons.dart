import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AssignmentToogleButtons extends StatefulWidget {
  const AssignmentToogleButtons({super.key, required this.numberOfAssignment});
  final int numberOfAssignment;
  @override
  State<AssignmentToogleButtons> createState() =>
      _ToggleButtonsWithContainerState();
}

class _ToggleButtonsWithContainerState extends State<AssignmentToogleButtons> {
  List<bool> isSelected = [true, false];

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      onPressed: (int index) {
        setState(() {
          isSelected[index] = !isSelected[index];
          for (int i = 0; i < isSelected.length; i++) {
            if (i != index) isSelected[i] = !isSelected[index];
          }
        });
      },
      isSelected: isSelected,
      children: [
        Container(
          width: 180,
          height: 50,
          decoration: BoxDecoration(
            color: isSelected[0]
                ? const Color.fromARGB(255, 77, 70, 111)
                : const Color(0xFF9747FF),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 40,
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${widget.numberOfAssignment}',
                      style: GoogleFonts.ubuntu(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Submitted',
                      style: GoogleFonts.ubuntu(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Container(
          width: 180,
          height: 50,
          decoration: BoxDecoration(
            color: isSelected[1]
                ? const Color(0xFF655B96)
                : const Color(0xFF9747FF),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.clear_rounded,
                  color: Colors.red,
                  size: 40,
                ),
                const SizedBox(
                  width: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '1',
                      style: GoogleFonts.ubuntu(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Not Submitted',
                      style: GoogleFonts.ubuntu(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
