import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gurukul/model/lecturemodel.dart';
import 'package:gurukul/provider/loginAuth_provider.dart';
import 'package:http/http.dart' as http;

class CalenderCard extends ConsumerStatefulWidget {
  final String calenderid;
  const CalenderCard({super.key, required this.calenderid});

  @override
  ConsumerState<CalenderCard> createState() => _CalenderCardState();
}

class _CalenderCardState extends ConsumerState<CalenderCard> {
  LectureModel? lecturedata;
  StateProvider lecturedatapagelodaerProvider = StateProvider((ref) => true);
  Future getlecturedetail() async {
    String accessToken = ref.read(authNotifierProvider).accessToken;
    String tokenType = "bearer";
    final response = await http.get(
      Uri.parse(
          "$fastApiUrl/Calender/get_calender_by_id/?calender_id=${widget.calenderid}"),
      headers: {
        'Authorization': '$tokenType $accessToken',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      log(response.body);
      return LectureModel.fromJson(jsonDecode(response.body));
    } else {
      LectureModel();
      throw Exception('Failed to load calender data: ${response.statusCode}');
    }
  }

  Future callApi() async {
    log(widget.calenderid.toString());

    lecturedata = await getlecturedetail().whenComplete(() {
      Future.delayed(const Duration(seconds: 2)).whenComplete(() =>
          ref.watch(lecturedatapagelodaerProvider.notifier).state = false);
    });
  }

  @override
  void initState() {
    callApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final loader = ref.watch(lecturedatapagelodaerProvider);
    return loader
        ? const Center(child: SizedBox.shrink())
        : Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: Card(
              color: Colors.white,
              margin: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              // color: Colors.white,
              elevation: 2,
              child: Stack(children: [
                Positioned(
                  child: Image.asset(
                    'assets/decoration/lower.png',
                    color: Colors.blue.withOpacity(0.2),
                    height: 90,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          const Icon(
                            Icons.access_alarm,
                            size: 30,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            lecturedata!.response![0].startTime.toString(),
                            style: GoogleFonts.ubuntu(
                                // color: color,
                                fontSize: 15),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              "Subject ",
                              style: GoogleFonts.ubuntu(
                                  color: const Color.fromARGB(255, 20, 61, 94),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              lecturedata!.response![0].subjects!.subjectName
                                  .toString(),
                              style: GoogleFonts.ubuntu(
                                  color: const Color.fromARGB(255, 20, 61, 94),
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      // const SizedBox(
                      //   width: 5,
                      // ),
                      Expanded(
                          child: Column(
                        children: [
                          Text(
                            "Staff Name",
                            style: GoogleFonts.ubuntu(
                                color: const Color.fromARGB(255, 20, 61, 94),
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            lecturedata!.response![0].staffs!.staffName
                                .toString(),
                            style: GoogleFonts.ubuntu(
                                color: const Color.fromARGB(255, 20, 61, 94),
                                fontSize: 16,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ))
                    ],
                  ),
                ),
              ]),
            ),
          );
  }
}
