import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:gurukul/Screens/assignmentScreen/widgets/assignmentScreenBoard.dart';
import 'package:gurukul/Screens/assignmentScreen/widgets/assignmentToggleButtons.dart';
import 'package:gurukul/Screens/assignmentScreen/widgets/assignmentpopup.dart';
import 'package:gurukul/Screens/assignmentScreen/widgets/assignmentscreencard.dart';
import 'package:gurukul/Screens/erroScreen/errorScreen.dart';
import 'package:gurukul/other/bottomnavigationmenu.dart';

import 'package:gurukul/other/constraits.dart';
import 'package:gurukul/provider/fetch_info_provider.dart';

import '../SettingScreen/profileScreen.dart';
import '../drawer.dart';

class AssignmentScreen extends ConsumerStatefulWidget {
  const AssignmentScreen({super.key});

  @override
  ConsumerState<AssignmentScreen> createState() {
    return _AssignmentScreenState();
  }
}

class _AssignmentScreenState extends ConsumerState<AssignmentScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
          'Assignment',
          style: GoogleFonts.ubuntu(
              color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Consumer(builder: (context, ref, child) {
        final assignmentAsyncValue = ref.watch(assignmentProvider);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "assets/decoration/assignment_banner.png",
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.contain,
            ),
            const AssignmentToogleButtons(numberOfAssignment: 0),
            const SizedBox(height: 20),
            Expanded(
                child: assignmentAsyncValue.when(
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (error, stack) =>
                        ErrorScreen(errorMessage: '$error').build(context),
                    data: (assignments) {
                      if (assignments.isEmpty) {
                        return Center(
                          child: Image.asset(
                            "assets/decoration/no_data_found.png",
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.contain,
                          ),
                        );
                      } else {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: ListView.builder(
                            itemCount: assignments.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  AssignmentPopup(
                                      assignmentname: assignments[index]
                                          ['assignment_title'],
                                      assignmentdate: assignments[index]
                                          ['assignment_Date'],
                                      assignmentduedate: assignments[index]
                                          ["assignment_due_date"],
                                      assignmentdescription: assignments[index]
                                          ['assignment_details']);
                                },
                                child: AssignmentScreenCard(
                                    imageUrl: "pink_circle",
                                    assignmentname: assignments[index]
                                        ['assignment_title'],
                                    assignmentdate: assignments[index]
                                        ['assignment_Date'],
                                    assignmentduedate: assignments[index]
                                        ["assignment_due_date"],
                                    assignmentdescription: assignments[index]
                                        ['assignment_details'],
                                    color: Colors.red
                                    // DateTime.parse(assignments[index]
                                    //             ['assignment_Date'])
                                    //         .isAfter(DateTime.now())
                                    //     ? Colors.red
                                    //     : const Color.fromARGB(255, 4, 144, 8),
                                    ),
                              );
                            },
                          ),
                        );
                      }
                    }))
          ],
        );
      }),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
