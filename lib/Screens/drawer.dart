import 'package:flutter/material.dart';
import 'package:gurukul/Screens/Dashboard/dashboardScreen.dart';
import 'package:gurukul/Screens/SettingScreen/Components/profileItem.dart';
import 'package:gurukul/Screens/SettingScreen/profileScreen.dart';
import 'package:gurukul/Screens/activityScreen/activityScreen.dart';
import 'package:gurukul/Screens/assignmentScreen/assignmentScreen.dart';
import 'package:gurukul/Screens/attendenceScreen/attendenceScreen.dart';
import 'package:gurukul/Screens/calenderScreen/calenderScreen.dart';

import 'package:gurukul/Screens/drawerTile.dart';
import 'package:gurukul/Screens/examinationScreen/examScreen.dart';
import 'package:gurukul/Screens/feesScreen/feesScreen.dart';
import 'package:gurukul/Screens/noticeScreen/noticeScreen.dart';
import 'package:gurukul/Screens/salaryScreen/salaryScreen.dart';
import 'package:gurukul/Screens/transporatationScreen/transportationScreen.dart';
import 'package:gurukul/other/constraits.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    void onAssignment() {
      Navigator.pop(context);
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const AssignmentScreen()));
    }

    void onCalender() {
      Navigator.pop(context);
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const CalenderScreen()));
    }

    void onAttendance() {
      Navigator.pop(context);
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => AttendenceDetailScreen()));
    }

    void onExamination() {
      Navigator.pop(context);
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const ExamScreen()));
    }

    void onTransportation() {
      Navigator.pop(context);
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const TransportationScreen()));
    }

    void onFees() {
      Navigator.pop(context);
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const FeesScreen()));
    }

    void onSalary() {
      Navigator.pop(context);
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => SalaryScreen()));
    }

    void onNotice() {
      Navigator.pop(context);
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const NoticeDetailScreen()));
    }

    void onHome() {
      Navigator.pop(context);
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const DashboardScreen()));
    }

    void onActivity() {
      Navigator.pop(context);
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const ActivityDetailScreen()));
    }

    return Drawer(
      shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(0),
          side: const BorderSide(
            style: BorderStyle.none,
          )),
      backgroundColor: kPrimaryLightColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const SizedBox(
            height: 40,
          ),
          DrawerTile(
            icon: const Icon(Icons.home),
            title: 'Home',
            onSelect: onHome,
          ),
          DrawerTile(
            icon: const Icon(Icons.copy_sharp),
            title: 'Assignment',
            onSelect: onAssignment,
          ),

          DrawerTile(
            icon: const Icon(Icons.person),
            title: 'Attendence',
            onSelect: onAttendance,
          ),
          DrawerTile(
            icon: const Icon(Icons.notifications_active_outlined),
            title: 'Notice',
            onSelect: onNotice,
          ),
          DrawerTile(
            icon: const Icon(Icons.notification_add),
            title: 'Activities',
            onSelect: onActivity,
          ),
          DrawerTile(
              icon: const Icon(Icons.calendar_month),
              title: 'Calender',
              onSelect: onCalender),
          DrawerTile(
            icon: const Icon(Icons.book_outlined),
            title: 'Examination',
            onSelect: onExamination,
          ),
          DrawerTile(
            icon: const Icon(Icons.bus_alert),
            title: 'Transportation',
            onSelect: onTransportation,
          ),
          DrawerTile(
            icon: const Icon(Icons.payments),
            title: 'Fees',
            onSelect: onFees,
          ),
          // DrawerTile(
          //   icon: Icon(Icons.money_outlined),
          //   title: 'Salary',
          //   onSelect: onSalary,
          // ),
          // Add more list tiles for additional items in the drawer
          const SizedBox(
            height: 60,
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              alignment: Alignment.bottomCenter,
              'assets/gurukul.png',
              height: 30,
            ),
          ),
        ],
      ),
    );
  }
}
