import 'package:flutter/material.dart';
import 'package:gurukul/Screens/Dashboard/dashboardScreen.dart';
import 'package:gurukul/Screens/SettingScreen/profileScreen.dart';
import 'package:gurukul/Screens/calenderScreen/calenderScreen.dart';
import 'package:gurukul/Screens/examinationScreen/examScreen.dart';
import 'package:gurukul/Screens/feesScreen/feesScreen.dart';
import 'package:gurukul/Screens/noticeScreen/noticeScreen.dart';
import 'package:gurukul/Screens/transporatationScreen/transportationScreen.dart';
import 'package:gurukul/model/studentData.dart';
import 'package:gurukul/other/constraits.dart';

// class BottomNavigationMenu extends StatefulWidget {
//   const BottomNavigationMenu({super.key});

//   @override
//   State<BottomNavigationMenu> createState() => _BottomNavigationMenuState();
// }

// class _BottomNavigationMenuState extends State<BottomNavigationMenu> {
//   int _currentIndex = 0;

//   final List<Widget> _screens = [
//     const DashboardScreen(),
//     const ExamScreen(),
//     const CalenderScreen(),
//     const TransportationScreen(),
//     const ProfileScreen(),
//   ];
//   void _updateIndex(int index) {
//     setState(() {
//       _currentIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: IndexedStack(index: _currentIndex, children: _screens),
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         enableFeedback: true,
//         showSelectedLabels: true,
//         showUnselectedLabels: false,
//         currentIndex: _currentIndex,
//         onTap: _updateIndex,
//         selectedItemColor: const Color.fromARGB(255, 42, 45, 116),
//         unselectedItemColor: Colors.black,
//         elevation: 0,
//         backgroundColor: kPrimaryLightColor,
//         iconSize: 22,
//         items: const [
//           BottomNavigationBarItem(
//               icon: Icon(Icons.home_outlined), label: "Home"),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.book_outlined), label: "Exams"),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.calendar_month), label: "Calender"),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.bus_alert), label: "Transportation"),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
//         ],
//       ),
//     );
//   }
// }

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56, // Adjust the height based on your design
      color: Colors.white, // Match your app's theme
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const DashboardScreen()));
            },
          ),
          IconButton(
            icon: const Icon(Icons.book_outlined),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const ExamScreen()));
            },
          ),
          IconButton(
            icon: const Icon(Icons.calendar_month),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const CalenderScreen()));
            },
          ),
          IconButton(
            icon: const Icon(Icons.payments),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const FeesScreen()));
            },
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ProfileScreen()));
            },
          ),
        ],
      ),
    );
  }
}
