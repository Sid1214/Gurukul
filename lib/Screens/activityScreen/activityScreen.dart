import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:gurukul/Screens/activityScreen/components/activityScreenCard.dart';
import 'package:gurukul/Screens/activityScreen/components/activityScreenpopup.dart';
import 'package:gurukul/Screens/widgets/notice_activity_popup.dart';
import 'package:gurukul/other/bottomnavigationmenu.dart';
import 'package:gurukul/other/constraits.dart';
import 'package:gurukul/other/defaultScaffold.dart';
import 'package:gurukul/provider/fetch_info_provider.dart';

import '../SettingScreen/profileScreen.dart';
import '../drawer.dart';
import '../erroScreen/errorScreen.dart';

// final List<String> activitiesData = [
//   'Rohan Beating Ramesh',
//   'Lots of HomeWork',
//   'Fees Notice Details',
//   'Sports Day Activity',
//   'Football Match Today',
//   'Week Days Activity',
//   'Football Match Today',
//   // Add more notices as needed
// ];

// final List<String> activitiesDataDate = [
//   '7th Nov 2023',
//   '2nd Dec 2023',
//   '17th Nov 2023',
//   '7th May 2023',
//   '3rd Jan 2023',
//   '3rd Jan 2023',
//   '9th Nov 2023',
//   // Add more notices as needed
// ];

// final List<Icon> activitiesIcon = [
//   const Icon(
//     Icons.baby_changing_station,
//     size: 50,
//     color: Colors.pink,
//   ),
//   const Icon(
//     Icons.copy,
//     size: 50,
//     color: Colors.blue,
//   ),
//   const Icon(
//     Icons.money,
//     size: 50,
//     color: Colors.green,
//   ),
//   const Icon(
//     Icons.sports_baseball_rounded,
//     size: 50,
//     color: Colors.red,
//   ),
//   const Icon(
//     Icons.person,
//     size: 50,
//     color: Colors.blue,
//   ),
//   const Icon(
//     Icons.baby_changing_station,
//     size: 50,
//     color: Colors.green,
//   ),
//   const Icon(
//     Icons.sports_baseball,
//     size: 50,
//     color: Colors.red,
//   ),

//   // Add more notices as needed
// ];

final List<Color> activitiescolor = [
  Colors.pink, Colors.blue, Colors.green, Colors.red, Colors.blue, Colors.green,
  Colors.red
  // Add more notices as needed
];
// GestureDetector(
//     onTap: () {
//       showDetailsPopup(
//           context, activitiesData[index], 'Des');
//     },

class ActivityDetailScreen extends ConsumerStatefulWidget {
  const ActivityDetailScreen({super.key});

  @override
  ConsumerState<ActivityDetailScreen> createState() =>
      _ActivityDetailScreenState();
}

class _ActivityDetailScreenState extends ConsumerState<ActivityDetailScreen> {
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
            'Activity',
            style: GoogleFonts.ubuntu(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        bottomNavigationBar: const CustomBottomNavigationBar(),
        body: Consumer(builder: (context, ref, child) {
          final activityAsyncValue = ref.watch(activitiesProvider);
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/decoration/activity_banner.png",
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 20),
                Expanded(
                    child: activityAsyncValue.when(
                        loading: () =>
                            const Center(child: CircularProgressIndicator()),
                        error: (error, stack) =>
                            ErrorScreen(errorMessage: '$error').build(context),
                        data: (activities) {
                          if (activities.isEmpty) {
                            return Center(
                              child: Image.asset(
                                "assets/decoration/no_data_found.png",
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.contain,
                              ),
                            );
                          } else {
                            return ListView.builder(
                              itemCount: activities.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    ActivityPopup(
                                        activityname: activities[index]
                                            ['activity_name'],
                                        activitydate: activities[index]
                                            ['activity_date'],
                                        activitydescription: activities[index]
                                            ["activity_description"]);
                                  },
                                  child: ActivityScreenCard(
                                    imageUrl: "pink_circle",
                                    activitydescription: activities[index]
                                        ['activity_description'],
                                    activityname: activities[index]
                                        ['activity_name'],
                                    activitylocation: activities[index]
                                        ['activity_location'],
                                    activitydate: activities[index]
                                        ['activity_date'],
                                    color: const Color.fromARGB(255, 4, 144, 8),
                                    // DateTime.parse(activities[index]
                                    //             ['activity_date'])
                                    //         .isBefore(DateTime.now())
                                    //     ? Colors.red
                                    //     : const Color.fromARGB(255, 4, 144, 8),
                                  ),
                                );
                              },
                            );
                          }
                        }))
              ],
            ),
          );
        }));
  }
}
