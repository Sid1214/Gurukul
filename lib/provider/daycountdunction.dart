import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

int dayremain({required String startDateString}) {
  // Enter the start and end date in the desired format
  // Parse the dates
  DateTime startDate = DateFormat('yyyy-MM-dd').parse(startDateString);
  DateTime todayDate = DateTime.now();

  DateTime specificDate =
      DateTime(todayDate.year, todayDate.month, todayDate.day, 0, 0, 0);

  // Calculate the difference in days
  int daysRemaining = startDate.difference(specificDate).inDays;

  print('Number of days remaining: $daysRemaining ');
  return daysRemaining;
}

// Calculate({required String startDateString, endDateString}) {
//   DateTime startDate = DateFormat('yyyy-MM-dd').parse(startDateString);
//   DateTime todayDate = DateTime.now();
//   DateTime endDate = DateFormat('dd-MM-yyyy').parse(endDateString);
//   if (startDate.isBefore(todayDate)) {
//     return todayDate.difference(startDate).inDays;
//   } else if (startDate.isAtSameMomentAs(todayDate) &&
//       todayDate.isBefore(endDate)) {
//     return const Text("Ongoing");
//   } else if (todayDate.isAfter(endDate)) {
//     return const Text("Done");
//   }
//   return null;
// }
