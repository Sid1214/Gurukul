import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gurukul/Screens/erroScreen/errorScreen.dart';
import 'package:gurukul/other/bottomnavigationmenu.dart';
import 'package:gurukul/provider/fetch_info_provider.dart';
import 'package:gurukul/Screens/transporatationScreen/transportationTile.dart';

import 'package:gurukul/other/constraits.dart';
import 'package:gurukul/other/defaultScaffold.dart';

import '../SettingScreen/profileScreen.dart';
import '../drawer.dart';

class TransportationScreen extends ConsumerStatefulWidget {
  const TransportationScreen({super.key});

  @override
  ConsumerState<TransportationScreen> createState() =>
      _TransportationScreenState();
}

class _TransportationScreenState extends ConsumerState<TransportationScreen> {
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
          'Transportation',
          style: GoogleFonts.ubuntu(
              color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Stack(fit: StackFit.expand, children: [
        Padding(
            padding: const EdgeInsets.all(defaultPadding / 2),
            child: Column(children: [
              Expanded(
                child: Consumer(
                  builder: (context, ref, child) {
                    final transportAsyncValue =
                        ref.watch(transportationProvider);

                    return transportAsyncValue.when(
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      error: (error, stack) =>
                          ErrorScreen(errorMessage: '$error').build(context),
                      data: (transportDetails) {
                        if (transportDetails.isDeleted) {
                          return Center(
                            child: Text(
                              "Transport Not Assigned",
                              style: GoogleFonts.ubuntu(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          );
                        }

                        return Content(
                          transportDetails.vehicleNumber,
                          transportDetails.vehicleDetails,
                          transportDetails.transportName,
                        );
                      },
                    );
                  },
                ),
              )
            ]))
      ]),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}

Widget Content(String vno, String driverName, String route) {
  return SingleChildScrollView(
    child: Column(
      children: [
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
            child: DefaultText(
                title: vno,
                color: Colors.black,
                fontsize: 18,
                weight: FontWeight.bold)),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              child: Image.asset(
                'assets/decoration/bus.png',
                alignment: Alignment.bottomCenter,
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TransportationTile(
              imageUrl: 'assets/decoration/driver.png',
              headingTitle: 'Driver',
              secondText: driverName,
              thirdText: '',
              color: Colors.black,
            ),
            TransportationTile(
              imageUrl: 'assets/decoration/locationpin.png',
              headingTitle: 'Route',
              secondText: route,
              thirdText: '',
              color: Colors.black,
            ),
          ],
        )
      ],
    ),
  );
}
