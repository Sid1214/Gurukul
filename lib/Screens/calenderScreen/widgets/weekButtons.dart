import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WeekToggleButtons extends StatefulWidget {
  const WeekToggleButtons({super.key});

  @override
  State<WeekToggleButtons> createState() => _ToggleButtonsWithContainerState();
}

class _ToggleButtonsWithContainerState extends State<WeekToggleButtons> {
// List<bool> isSelected = [true, false, false, false, false, false];
  List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
  String dayname = 'Mon';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: days.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                setState(() {
                  dayname = days[index];
                });
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                decoration: BoxDecoration(
                  color: dayname == days[index]
                      ? const Color.fromARGB(255, 105, 55, 147)
                      : const Color.fromARGB(255, 164, 92, 212),
                  // borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                  child: Text(
                    days[index],
                    style: GoogleFonts.ubuntu(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  ),
                ),
              ),
            );
          }),
    );
    // ToggleButtons(
    //   onPressed: (int index) {
    //     setState(() {
    //       isSelected[index] = !isSelected[index];
    //       for (int i = 0; i < isSelected.length; i++) {
    //         if (i != index) isSelected[i] = !isSelected[index];
    //       }
    //     });
    //   },
    //   isSelected: isSelected,
    //   children: List.generate(
    //     6,
    //     (index) => Container(
    //       width: MediaQuery.sizeOf(context).width / 6.15,
    //       height: 50,
    //       decoration: BoxDecoration(
    //         color: isSelected[index]
    //             ? const Color.fromARGB(255, 105, 55, 147)
    //             : const Color.fromARGB(255, 164, 92, 212),
    //         // borderRadius: BorderRadius.circular(4),
    //       ),
    //       child: Center(
    //         child: Text(
    //           days[index],
    //           style: GoogleFonts.ubuntu(
    //               color: Colors.white,
    //               fontWeight: FontWeight.bold,
    //               fontSize: 12),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
