import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gurukul/other/bottomnavigationmenu.dart';
import 'package:gurukul/provider/fetch_info_provider.dart';
import 'package:gurukul/Screens/noticeScreen/components/noticeScreenCard.dart';
import 'package:gurukul/Screens/widgets/notice_activity_popup.dart';

import 'package:gurukul/other/constraits.dart';
import 'package:gurukul/other/defaultScaffold.dart';

import '../SettingScreen/profileScreen.dart';
import '../drawer.dart';
import '../erroScreen/errorScreen.dart';

class NoticeDetailScreen extends ConsumerStatefulWidget {
  const NoticeDetailScreen({super.key});

  @override
  ConsumerState<NoticeDetailScreen> createState() => _NoticeDetailScreenState();
}

class _NoticeDetailScreenState extends ConsumerState<NoticeDetailScreen> {
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
              //     builder: (context) => ProfileScreen(),
              //   ),
              // );
            },
          ),
        ],
        title: Text(
          'Notice',
          style: GoogleFonts.ubuntu(
              color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final noticeAsyncValue = ref.watch(noticeProvider);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/decoration/notice_banner.png",
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.contain,
              ),
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: DefaultText(
                    title: 'Notices',
                    color: Colors.black,
                    fontsize: 20,
                    weight: FontWeight.bold),
              ),
              Expanded(
                child: noticeAsyncValue.when(
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (error, stack) =>
                      ErrorScreen(errorMessage: '$error').build(context),
                  data: (notices) {
                    if (notices.isEmpty) {
                      return Center(
                        child: Image.asset(
                          "assets/decoration/no_data_found.png",
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.contain,
                        ),
                      );
                    } else {
                      return ListView.builder(
                        itemCount: notices.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              showDetailsPopup(
                                context,
                                notices[index]['notice_title'],
                                notices[index]['notice_description'],
                              );
                            },
                            child: NoticeScreenCard(
                                title: notices[index]['notice_title'],
                                date: notices[index]['notice_date'],
                                color: Colors.pink
                                // DateTime.parse(notices[index]['notice_date'])
                                //         .isBefore(DateTime.now())
                                //     ? Colors.red
                                //     : const Color.fromARGB(255, 4, 144, 8),
                                ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
