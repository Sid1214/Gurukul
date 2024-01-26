import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gurukul/Screens/examinationScreen/resultscreen.dart';
import 'package:gurukul/model/examinationdata.dart';
import 'package:gurukul/provider/loginAuth_provider.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class ExamPopup extends ConsumerStatefulWidget {
  final String classid, examename, examstartdate, parentexamid, examresultdate;
  const ExamPopup(
      {super.key,
      required this.classid,
      required this.examename,
      required this.parentexamid,
      required this.examstartdate,
      required this.examresultdate});

  @override
  ConsumerState<ExamPopup> createState() => _ExamPopupState();
}

class _ExamPopupState extends ConsumerState<ExamPopup> {
  SubjectModel? subjectdata;

  StateProvider examdatapopuplodaerProvider = StateProvider((ref) => true);
  Future<SubjectModel?> getexamSubject() async {
    String accessToken = ref.read(authNotifierProvider).accessToken;
    log(widget.parentexamid);

    String tokenType = "bearer";
    final response = await http.get(
      Uri.parse(
          "$fastApiUrl/Exams/get_exam_by_parent_exam_id/?parent_exam_id=${widget.parentexamid}"),
      headers: {
        'Authorization': '$tokenType $accessToken',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      log(response.body);
      return SubjectModel.fromJson(json.decode(response.body));
    } else {
      SubjectModel();
    }
    return null;
  }

  String todayDate = "";
  Future callApi() async {
    DateTime now = DateTime.now();
    todayDate = DateFormat('yyyy-MM-dd').format(now);
    print(now.toString());
    log(widget.classid.toString());
    subjectdata = await getexamSubject().whenComplete(() {
      Future.delayed(const Duration(seconds: 2)).whenComplete(
          () => ref.watch(examdatapopuplodaerProvider.notifier).state = false);
    });
  }

  @override
  void initState() {
    callApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final loader = ref.watch(examdatapopuplodaerProvider);

    return loader
        ? const SizedBox.shrink()
        : Padding(
            padding: const EdgeInsets.all(10),
            child: Dialog(
                insetPadding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 30),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Exam Details",
                          style: GoogleFonts.ubuntu(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 30),
                        Container(
                            child: widget.examresultdate == todayDate ||
                                    DateTime.parse(todayDate).isAfter(
                                        DateTime.parse(widget.examresultdate))
                                ? Center(
                                    child: Column(
                                      children: [
                                        Image.asset(
                                            'assets/decoration/result_out.png',
                                            width: 60,
                                            height: 60),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              minimumSize: const Size(40, 40),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                            ),
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ResultScreen(
                                                          parentexamid: widget
                                                              .parentexamid
                                                              .toString(),
                                                        )),
                                              );
                                            },
                                            child: const Text('View Result',
                                                style: TextStyle(fontSize: 16)))
                                      ],
                                    ),
                                  )
                                : Center(
                                    child: Column(
                                      children: [
                                        Image.asset(
                                            'assets/decoration/result.png',
                                            width: 100,
                                            height: 100),
                                        Text(
                                          'Result will be declared on ${widget.examresultdate}',
                                          style: GoogleFonts.ubuntu(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  )),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Exam Name:',
                              style: GoogleFonts.ubuntu(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              widget.examename,
                              style: GoogleFonts.ubuntu(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Subjects:',
                              style: GoogleFonts.ubuntu(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                for (var i = 0;
                                    i < subjectdata!.response!.length;
                                    i++)
                                  Text(
                                    subjectdata!
                                        .response![i].subject!.subjectName
                                        .toString(),
                                    style: GoogleFonts.ubuntu(
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal),
                                  ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              'Close',
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )),
          );
  }
}
