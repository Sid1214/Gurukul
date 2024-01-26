import 'dart:convert';
import 'dart:developer';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gurukul/Screens/calenderScreen/widgets/calenderCard.dart';
import 'package:gurukul/Screens/calenderScreen/widgets/weekButtons.dart';
import 'package:gurukul/model/calendarmodel.dart';
import 'package:gurukul/other/bottomnavigationmenu.dart';
import 'package:gurukul/other/constraits.dart';
import 'package:gurukul/provider/fetch_info_provider.dart';
import 'package:gurukul/provider/loginAuth_provider.dart';
import 'package:http/http.dart' as http;
import '../drawer.dart';

class CalenderScreen extends ConsumerStatefulWidget {
  const CalenderScreen({super.key});

  @override
  ConsumerState<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends ConsumerState<CalenderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, ref, child) {
          final studentAsyncValue = ref.watch(studentProvider);

          return studentAsyncValue.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stack) => Center(child: Text('Error: $error')),
            data: (student) {
              if (student.isEmpty) {
                return const Center(
                    child: Text('No data available, Try Again After Sometime'));
              } else {
                return CalenderBody(
                  classid: student[0]['class_id'].toString(),
                  sectionid: student[0]['section_id'].toString(),
                );
              }
            },
          );
        },
      ),
    );
  }
}

class CalenderBody extends ConsumerStatefulWidget {
  final String classid, sectionid;
  const CalenderBody(
      {super.key, required this.classid, required this.sectionid});

  @override
  ConsumerState<CalenderBody> createState() => _CalenderBodyState();
}

class _CalenderBodyState extends ConsumerState<CalenderBody> {
  CalenderModel? calenderdata;
  StateProvider calenderloaderProvider = StateProvider((ref) => true);
  List<String> days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday'
  ];
  String dayname = 'Monday';
  Future getcalenderDetail() async {
    String accessToken = ref.read(authNotifierProvider).accessToken;
    String tokenType = "bearer";
    final response = await http.get(
      Uri.parse(
          "$fastApiUrl/Calender/get_calender_by_class&section/?class_id=${widget.classid}&section_id=${widget.sectionid}"),
      headers: {
        'Authorization': '$tokenType $accessToken',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      log(response.body);
      return CalenderModel.fromJson(jsonDecode(response.body));
    } else {
      CalenderModel();
      throw Exception('Failed to load calender data: ${response.statusCode}');
    }
  }

  Future callApi() async {
    log(widget.classid.toString());
    log(widget.sectionid.toString());

    calenderdata = await getcalenderDetail().whenComplete(() {
      Future.delayed(const Duration(seconds: 2)).whenComplete(
          () => ref.watch(calenderloaderProvider.notifier).state = false);
    });
  }

  @override
  void initState() {
    callApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color color = Colors.blue;
    final loader = ref.watch(calenderloaderProvider);
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
          'Calender',
          style: GoogleFonts.ubuntu(
              color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: loader
          ? const Center(child: CircularProgressIndicator())
          : Stack(fit: StackFit.expand, children: [
              SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // const WeekToggleButtons(),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: days.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      dayname = days[index];
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 18, vertical: 5),
                                    decoration: BoxDecoration(
                                      color: dayname == days[index]
                                          ? const Color.fromARGB(
                                              255, 105, 55, 147)
                                          : const Color.fromARGB(
                                              255, 164, 92, 212),
                                      // borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Center(
                                      child: Text(
                                        days[index],
                                        style: GoogleFonts.ubuntu(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                        const SizedBox(height: 20),
                        Center(
                          child: Text(
                            "Lecture Details",
                            style: GoogleFonts.ubuntu(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 20),
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: calenderdata!.response!.length,
                            itemBuilder: ((context, index) {
                              return calenderdata!.response![index].day
                                          .toString() ==
                                      dayname
                                  ? CalenderCard(
                                      calenderid: calenderdata!
                                          .response![index].calenderId
                                          .toString(),
                                    )
                                  : const SizedBox.shrink();
                            })),
                      ]))
            ]),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
