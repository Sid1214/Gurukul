import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:google_fonts/google_fonts.dart';

class AttendancePieChart extends StatelessWidget {
  final double presentPercentage;
  final double absentPercentage;

  AttendancePieChart(
      {required this.presentPercentage, required this.absentPercentage});

  @override
  Widget build(BuildContext context) {
    // double totalDays = presentPercentage + absentPercentage;
    // double percentagePresent = (presentPercentage / totalDays) * 100;
    // double percentageAbsent = (absentPercentage / totalDays) * 100;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(20),
          height: 200,
          width: 200,
          child: PieChart(
            PieChartData(
              borderData: FlBorderData(
                show: true,
              ),
              centerSpaceRadius: 5,
              sectionsSpace: 0,
              sections: [
                PieChartSectionData(
                  color: Colors.green,
                  value: presentPercentage,
                  title: '${presentPercentage.toStringAsFixed(1)}%',
                  radius: 80,
                  titleStyle: GoogleFonts.ubuntu(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xffffffff)),
                ),
                PieChartSectionData(
                  color: Colors.red,
                  value: absentPercentage.toDouble(),
                  title: '${absentPercentage.toStringAsFixed(1)}%',
                  radius: 80,
                  titleStyle: GoogleFonts.ubuntu(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xffffffff),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.check_circle_outline,
                    color: Colors.green,
                    size: 50,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Container(
                        color: Colors.green,
                        height: 20,
                        width: 80,
                        child: Center(
                          child: Text(
                            'Present',
                            style: GoogleFonts.ubuntu(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text('${presentPercentage.toStringAsFixed(1)} Days',
                          style: GoogleFonts.ubuntu(
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                              color: Colors.green)),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Icon(
                  //   Icons.clear,
                  //   color: Colors.red,
                  //   size: 50,
                  // ),
                  Container(
                    width: 50,
                    height: 40,
                    child: Image.asset('assets/icons/absent.png'),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Container(
                        color: Colors.red,
                        height: 20,
                        width: 80,
                        child: Center(
                          child: Text(
                            'Absent',
                            style: GoogleFonts.ubuntu(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text('${absentPercentage.toStringAsFixed(1)} Days',
                          style: GoogleFonts.ubuntu(
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                              color: Colors.red)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
