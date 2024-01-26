// AssignmentScreen.dart
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gurukul/Screens/attendenceScreen/attendencePieChart.dart';
import 'package:gurukul/Screens/attendenceScreen/attendenceToggleButtons.dart';
import 'package:gurukul/Screens/attendenceScreen/heatMap/attendanceHeatMap.dart';
import 'package:gurukul/Screens/drawer.dart';
import 'package:gurukul/other/constraits.dart';
import 'package:gurukul/provider/fetch_info_provider.dart';

import '../SettingScreen/profileScreen.dart';
import '../erroScreen/errorScreen.dart';

class AttendenceDetailScreen extends StatelessWidget {
  AttendenceDetailScreen({super.key});

  final int daysPresent = 85;
  final int daysAbsent = 15;

  final Map<DateTime, int> attendanceData = {
    DateTime(2023, 12, 1): 2,
    DateTime(2023, 12, 2): 1,
    DateTime(2024, 1, 1): 3,
    DateTime(2024, 1, 2): 2,
    // Add more entries for each day and month
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      backgroundColor: kPrimaryLightColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Attendence',
          style: GoogleFonts.ubuntu(
              fontWeight: FontWeight.bold, color: Colors.black),
        ),
        iconTheme: IconThemeData(
          color: Colors.black, // Change this color to your desired color
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Your other widgets...

            SizedBox(
              height: 16,
            ),
            AttendenceToggleButtons(),
            SizedBox(
              height: 16,
            ),

            Consumer(builder: (context, ref, child) {
              final studentAttendance = ref.watch(studentAttendanceProvider);
              return studentAttendance.when(
                  data: (data) {
                    return Container(
                      width: 360,
                      decoration: const BoxDecoration(color: Colors.white),
                      child: Stack(
                        children: [
                          AttendancePieChart(
                              presentPercentage:
                                  data['student_attendance_percentage']
                                      ['present_percentage'],
                              absentPercentage:
                                  data['student_attendance_percentage']
                                      ['absent_percentage']),
                        ],
                      ),
                    );
                  },
                  error: (error, stack) =>
                      ErrorScreen(errorMessage: '$error').build(context),
                  loading: () {
                    return Text("Loading data");
                  });
            }),

            // HeatmapCalendar(attendanceData: attendanceData),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                  height: 370,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Attendance Heat Map',
                          style: GoogleFonts.ubuntu(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(child: AttendanceHeatmap()),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
