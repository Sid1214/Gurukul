import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gurukul/Screens/Dashboard/components/cards/feesCard.dart';
import 'package:gurukul/Screens/feesScreen/actionRequiredContainer.dart';
import 'package:gurukul/Screens/feesScreen/cardList.dart';
import 'package:gurukul/Screens/feesScreen/feesScreenCard.dart';
import 'package:gurukul/other/bottomnavigationmenu.dart';
import 'package:gurukul/other/constraits.dart';
import 'package:gurukul/other/defaultScaffold.dart';

import '../SettingScreen/profileScreen.dart';
import '../drawer.dart';

class FeesScreen extends StatelessWidget {
  const FeesScreen({super.key});
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
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfileScreen(),
                ),
              );
            },
          ),
        ],
        title: Text(
          'Fees & Payments',
          style: GoogleFonts.ubuntu(
              color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Stack(fit: StackFit.expand, children: [
        // Image.asset(
        //   'assets/decoration/backgroundImage.png',
        //   fit: BoxFit.cover,
        // ),
        Padding(
            padding: const EdgeInsets.all(defaultPadding / 2),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(height: 230, child: CardList()),
                  const FeesScreenCard(
                    ammount: '50,000',
                    heading: 'Extending Date',
                  ),
                  const ActionRequiredContainer(
                    title: 'Action Required',
                  ),
                  const ActionRequiredContainer(title: 'Payment History'),
                ],
              ),
            ))
      ]),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
