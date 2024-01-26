import 'package:flutter/material.dart';

class AttendanceHeatmap extends StatelessWidget {
  // Placeholder data for demonstration purposes
  final List<bool> attendanceData = [
    true, // Present
    true, // Absent
    true, // Present
    false, // Absent
    true,
    true, // Present
    false, // Absent
    true, // Present
    true, // Present
    true, // Present
    false, // Absent
    true, true, // Present
    true, // Absent
    true, // Present
    false, // Absent
    true, true, // Present
    false, // Absent
    true, // Present
    // Absent
    // true,  Present
    // / Absent

    // ... add more data for each day
  ];
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final screenHeight = constraints.maxHeight;

        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            // crossAxisSpacing: 30.0,
            // mainAxisSpacing: 10.0,
            // childAspectRatio: 1.0, // Number of columns
          ),
          itemCount: attendanceData.length,
          itemBuilder: (context, index) {
            // Determine color based on attendance status
            Color color = attendanceData[index] ? Colors.green : Colors.red;

            return Container(
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8),
              ),
              // child: Center(child: Text('${index + 1}')),
            );
          },
        );
      },
    );
  }
}
