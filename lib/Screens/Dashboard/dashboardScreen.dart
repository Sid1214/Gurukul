import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gurukul/Screens/Dashboard/components/cards/attendence.dart';
import 'package:gurukul/Screens/Dashboard/components/lowerDashboardCard.dart';

import 'package:gurukul/Screens/Dashboard/components/cards/activityCard.dart';
import 'package:gurukul/Screens/Dashboard/components/cards/feesCard.dart';

import 'package:gurukul/Screens/Dashboard/components/upperBanner.dart';

import 'package:gurukul/Screens/SettingScreen/profileScreen.dart';
import 'package:gurukul/Screens/assignmentScreen/assignmentScreen.dart';
import 'package:gurukul/Screens/drawer.dart';
import 'package:gurukul/Screens/feesScreen/feesScreen.dart';
import 'package:gurukul/Screens/noticeScreen/noticeScreen.dart';
import 'package:gurukul/model/usermodel.dart';

import 'package:gurukul/other/bottomnavigationmenu.dart';

import 'package:gurukul/other/constraits.dart';
import 'package:gurukul/Screens/Dashboard/components/newAssignmentBoard.dart';
import 'package:gurukul/provider/fetch_info_provider.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() {
    return _DashboardScreenState();
  }
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  void onNoticeBoard() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const NoticeDetailScreen()));
  }

  void onAssignment() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const AssignmentScreen()));
  }

  void OnFees() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const FeesScreen()));
  }

  void onProfile() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const ProfileScreen(
            // userid: widget.userid,
            )));
  }

  // @override
  // void initState() {
  //   super.initState();
  //   getuserDetail(ref: ref);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const MyDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const ProfileScreen(),
                //   ),
                // );
              },
            ),
          ],
          title: Text(
            'Dashboard',
            style: GoogleFonts.ubuntu(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            Padding(
              padding: const EdgeInsets.all(defaultPadding / 2),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    UpperBanner(),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const AttendenceCard(
                            selectedText: 'Present',
                            cardText: 'Attendence',
                            image: 'assets/icons/tickicon.png',
                            imageUrl: AssetImage('assets/cards/green.png'),
                            selectedColor: Colors.green,
                            selectedIcon: Icon(
                              Icons.check_circle,
                              color: Colors.green,
                            )),
                        FeesCard(
                          selectedText: '20,000',
                          cardText: 'Next Dues',
                          image: 'assets/icons/ruppee.png',
                          imageUrl:
                              const AssetImage('assets/cards/redcard.png'),
                          selectedColor: const Color(0xFFFF3131),
                          selectedIcon: const Icon(
                            Icons.check_circle,
                            color: Color(0xFFFF3131),
                          ),
                          onFees: OnFees,
                        ),
                        const ActivityCard(
                            selectedText: '70+',
                            cardText: 'Activites',
                            image: 'assets/images/notification_mobile_icon.png',
                            imageUrl: AssetImage('assets/cards/bluecard.png'),
                            selectedColor: Color.fromARGB(255, 0, 140, 255),
                            selectedIcon: Icon(
                              Icons.local_activity,
                              color: Color.fromARGB(255, 0, 140, 255),
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const LowerDashboardCard(),
                    const SizedBox(
                      height: 10,
                    ),
                    NewAssignmentBoard(
                      title: 'Notice Board',
                      onSelect: onNoticeBoard,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    NewAssignmentBoard(
                      title: 'Assignment',
                      onSelect: onAssignment,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: const CustomBottomNavigationBar());
  }
}
