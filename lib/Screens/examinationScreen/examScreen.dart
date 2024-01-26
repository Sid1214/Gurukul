import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gurukul/Screens/examinationScreen/examScreenCard.dart';
import 'package:gurukul/Screens/examinationScreen/examScreenPopUp.dart';
import 'package:gurukul/model/examinationdata.dart';
import 'package:gurukul/other/bottomnavigationmenu.dart';
import 'package:gurukul/other/constraits.dart';
import 'package:gurukul/other/defaultScaffold.dart';
import 'package:gurukul/provider/fetch_info_provider.dart';
import 'package:gurukul/provider/loginAuth_provider.dart';
import 'package:intl/intl.dart';
import '../SettingScreen/profileScreen.dart';
import '../drawer.dart';
import 'package:http/http.dart' as http;

class ExamScreen extends ConsumerStatefulWidget {
  const ExamScreen({super.key});

  @override
  ConsumerState<ExamScreen> createState() => _ExamScreenState();
}

class _ExamScreenState extends ConsumerState<ExamScreen> {
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
                return ExaminationBody(
                  classid: student[0]['class_id'].toString(),
                );
              }
            },
          );
        },
      ),
    );
  }
}

class ExaminationBody extends ConsumerStatefulWidget {
  final String classid;
  const ExaminationBody({
    super.key,
    required this.classid,
  });

  @override
  ConsumerState<ExaminationBody> createState() => _ExaminationBodyState();
}

class _ExaminationBodyState extends ConsumerState<ExaminationBody> {
  ExaminationData? examdata;
  StateProvider examdatapagelodaerProvider = StateProvider((ref) => true);
  Future<ExaminationData?> getexamDetail() async {
    String accessToken = ref.read(authNotifierProvider).accessToken;
    String tokenType = "bearer";
    final response = await http.get(
      Uri.parse(
          "$fastApiUrl/ParentExams/get_parent_exam_by_class_id?class_id=${widget.classid}"),
      headers: {
        'Authorization': '$tokenType $accessToken',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return ExaminationData.fromJson(json.decode(response.body));
    } else {
      ExaminationData();
    }
    return null;
  }

  Future callApi() async {
    log(widget.classid.toString());
    examdata = await getexamDetail().whenComplete(() {
      Future.delayed(const Duration(seconds: 2)).whenComplete(
          () => ref.watch(examdatapagelodaerProvider.notifier).state = false);
    });
  }

  @override
  void initState() {
    callApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final loader = ref.watch(examdatapagelodaerProvider);
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
          'Examination',
          style: GoogleFonts.ubuntu(
              color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: loader
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              // physics: const NeverScrollableScrollPhysics(),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/decoration/exam_banner.png",
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: examdata!.upcomingParentExam!.length,
                              itemBuilder: (context, index) {
                                OldParentExams data =
                                    examdata!.upcomingParentExam![index];
                                return GestureDetector(
                                  onTap: () {
                                    showDialog(
                                        barrierDismissible: true,
                                        context: context,
                                        builder: (BuildContext context) =>
                                            ExamPopup(
                                              parentexamid:
                                                  data.parentExamId.toString(),
                                              classid: widget.classid,
                                              examstartdate:
                                                  data.startDate.toString(),
                                              examename: data.parentExamName
                                                  .toString(),
                                              examresultdate:
                                                  data.resultDate.toString(),
                                            ));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: const Color.fromARGB(
                                                    255, 207, 205, 205)),
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        height: 60,
                                        padding: const EdgeInsets.all(4),
                                        child: ExamScreenCard(
                                            comefrom: "remain",
                                            examdata: data,
                                            color: const Color.fromARGB(
                                                255, 20, 132, 56))),
                                  ),
                                );
                              }),
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: examdata!.oldParentExams!.length,
                              itemBuilder: (context, index) {
                                OldParentExams data =
                                    examdata!.oldParentExams![index];
                                return GestureDetector(
                                  onTap: () {
                                    showDialog(
                                        barrierDismissible: true,
                                        context: context,
                                        builder: (BuildContext context) =>
                                            ExamPopup(
                                              parentexamid:
                                                  data.parentExamId.toString(),
                                              classid: widget.classid,
                                              examstartdate:
                                                  data.startDate.toString(),
                                              examename: data.parentExamName
                                                  .toString(),
                                              examresultdate:
                                                  data.resultDate.toString(),
                                            ));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: const Color.fromARGB(
                                                    255, 207, 205, 205)),
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        height: 60,
                                        padding: const EdgeInsets.all(4),
                                        child: ExamScreenCard(
                                          comefrom: "done",
                                          examdata: data,
                                          color: const Color.fromARGB(
                                              255, 132, 27, 20),
                                        )),
                                  ),
                                );
                              }),
                        ],
                      ),
                    ),
                  ]),
            ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
