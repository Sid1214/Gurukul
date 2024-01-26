import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gurukul/model/resultmodel.dart';
import 'package:gurukul/provider/fetch_info_provider.dart';
import 'package:gurukul/provider/loginAuth_provider.dart';
import 'package:http/http.dart' as http;

class ResultScreen extends ConsumerStatefulWidget {
  final String parentexamid;
  const ResultScreen({super.key, required this.parentexamid});

  @override
  ConsumerState<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends ConsumerState<ResultScreen> {
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
                return ResultBody(
                    studentid: student[0]['student_id'].toString(),
                    parentexamid: widget.parentexamid);
              }
            },
          );
        },
      ),
    );
  }
}

class ResultBody extends ConsumerStatefulWidget {
  final String studentid;
  final String parentexamid;
  const ResultBody(
      {super.key, required this.studentid, required this.parentexamid});

  @override
  ConsumerState<ResultBody> createState() => _ResultBodyState();
}

class _ResultBodyState extends ConsumerState<ResultBody> {
  ResultModel? resultdata;
  StateProvider resultdatapagelodaerProvider = StateProvider((ref) => true);
  Future getresultdetail() async {
    String accessToken = ref.read(authNotifierProvider).accessToken;
    String tokenType = "bearer";
    final response = await http.get(
      Uri.parse(
          "$fastApiUrl/Result/get_result_entry_by_student_id_and_parent_exam_id/?student_id=${widget.studentid}&parent_exam_id=${widget.parentexamid}"),
      headers: {
        'Authorization': '$tokenType $accessToken',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      log(response.body.toString());
      return ResultModel.fromJson(jsonDecode(response.body));
    } else {
      ResultModel();
    }
    return null;
  }

  Future callApi() async {
    log(widget.studentid.toString());
    log(widget.parentexamid.toString());

    resultdata = await getresultdetail().whenComplete(() {
      Future.delayed(const Duration(seconds: 2)).whenComplete(
          () => ref.watch(resultdatapagelodaerProvider.notifier).state = false);
    });
  }

  @override
  void initState() {
    callApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Result? result = resultdata?.response?.result;
    final loader = ref.watch(resultdatapagelodaerProvider);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'Result',
            style: GoogleFonts.ubuntu(
                color: Colors.black, fontWeight: FontWeight.w700),
          ),
        ),
        body: loader
            ? const SizedBox.shrink()
            : Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                    // scrollDirection: Axis.horizontal,
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Subject Wise Result :",
                        style: GoogleFonts.ubuntu(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 15,
                    ),
                    DataTable(
                      columnSpacing: 18,
                      border: TableBorder.all(
                          color: Colors.black45,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5))),
                      columns: [
                        DataColumn(
                            label: Text(
                          "Subjects",
                          style: GoogleFonts.ubuntu(
                              color: Colors.black, fontWeight: FontWeight.w600),
                        )),
                        DataColumn(
                            label: Text(
                          'F.M',
                          style: GoogleFonts.ubuntu(
                              color: Colors.black, fontWeight: FontWeight.w600),
                        )),
                        DataColumn(
                            label: Text(
                          'O.M',
                          style: GoogleFonts.ubuntu(
                              color: Colors.black, fontWeight: FontWeight.w600),
                        )),
                        DataColumn(
                            label: Text(
                          '%age',
                          style: GoogleFonts.ubuntu(
                              color: Colors.black, fontWeight: FontWeight.w600),
                        )),
                        DataColumn(
                            label: Text(
                          'Grd',
                          style: GoogleFonts.ubuntu(
                              color: Colors.black, fontWeight: FontWeight.w600),
                        )),
                      ],
                      rows: resultdata!.response!.result!.marks!.map((mark) {
                        return DataRow(cells: [
                          DataCell(Text(
                            mark.subjectName ?? 'N/A',
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.ubuntu(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          )),
                          DataCell(
                            Text(
                              mark.fullMark?.toString() ?? 'N/A',
                              style: GoogleFonts.ubuntu(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          DataCell(Text(
                            mark.obtainedMark?.toString() ?? 'N/A',
                            style: GoogleFonts.ubuntu(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          )),
                          DataCell(Text(
                            mark.percentage ?? 'N/A',
                            style: GoogleFonts.ubuntu(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          )),
                          DataCell(Text(
                            mark.grade ?? 'N/A',
                            style: GoogleFonts.ubuntu(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          )),
                        ]);
                      }).toList(),
                    ),
                    const SizedBox(height: 40),
                    Text("Overall Result :",
                        style: GoogleFonts.ubuntu(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 15,
                    ),
                    DataTable(
                      columnSpacing: 40,
                      border: TableBorder.all(
                          color: Colors.black45,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5))),
                      columns: [
                        DataColumn(
                            label: Text(
                          'F.M',
                          style: GoogleFonts.ubuntu(
                              color: Colors.black, fontWeight: FontWeight.w600),
                        )),
                        DataColumn(
                            label: Text(
                          'O.M',
                          style: GoogleFonts.ubuntu(
                              color: Colors.black, fontWeight: FontWeight.w600),
                        )),
                        DataColumn(
                            label: Text(
                          '%age',
                          style: GoogleFonts.ubuntu(
                              color: Colors.black, fontWeight: FontWeight.w600),
                        )),
                        DataColumn(
                            label: Text(
                          'Grade',
                          style: GoogleFonts.ubuntu(
                              color: Colors.black, fontWeight: FontWeight.w600),
                        )),
                      ],
                      rows: [
                        DataRow(cells: [
                          DataCell(
                            Text(
                              result!.totalFullMarks?.toString() ?? 'N/A',
                              style: GoogleFonts.ubuntu(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          DataCell(Text(
                            result.totalObtainedMarks?.toString() ?? 'N/A',
                            style: GoogleFonts.ubuntu(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          )),
                          DataCell(Text(
                            result.percentage ?? 'N/A',
                            style: GoogleFonts.ubuntu(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          )),
                          DataCell(Text(
                            result.grade ?? 'N/A',
                            style: GoogleFonts.ubuntu(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          )),
                        ])
                      ].toList(),
                    ),
                    const SizedBox(height: 40),

                    // Container(

                    //     // padding: EdgeInsets.all(20),
                    //     height: 250,
                    //     decoration: BoxDecoration(
                    //       border: Border.all(color: Colors.grey, width: 2),
                    //       borderRadius: BorderRadius.circular(10),
                    //       color: Colors.blue.withOpacity(0.2),
                    //     ),
                    //     child: Padding(
                    //       padding: const EdgeInsets.symmetric(
                    //           vertical: 15, horizontal: 20),
                    //       child: Column(
                    //         mainAxisAlignment: MainAxisAlignment.center,
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: [
                    //           Text("Result",
                    //               style: GoogleFonts.ubuntu(
                    //                   color: Colors.black,
                    //                   fontSize: 20,
                    //                   fontWeight: FontWeight.bold)),
                    //           const SizedBox(
                    //             height: 20,
                    //           ),
                    //           Text(
                    //               'Total Full Marks:  ${result?.totalFullMarks ?? 'N/A'}',
                    //               style: GoogleFonts.ubuntu(
                    //                   color: Colors.black,
                    //                   fontSize: 18,
                    //                   fontWeight: FontWeight.w600)),
                    //           const SizedBox(
                    //             height: 10,
                    //           ),
                    //           Text(
                    //               'Total Obt. Marks:  ${result?.totalObtainedMarks ?? 'N/A'}',
                    //               style: GoogleFonts.ubuntu(
                    //                   color: Colors.black,
                    //                   fontSize: 18,
                    //                   fontWeight: FontWeight.w600)),
                    //           const SizedBox(
                    //             height: 10,
                    //           ),
                    //           Text(
                    //               'Percentage:  ${result?.percentage ?? 'N/A'}',
                    //               style: GoogleFonts.ubuntu(
                    //                   color: Colors.black,
                    //                   fontSize: 18,
                    //                   fontWeight: FontWeight.w600)),
                    //           const SizedBox(
                    //             height: 10,
                    //           ),
                    //           Text('Grade:  ${result?.grade ?? 'N/A'}',
                    //               style: GoogleFonts.ubuntu(
                    //                   color: Colors.black,
                    //                   fontSize: 18,
                    //                   fontWeight: FontWeight.w600)),
                    //           const SizedBox(
                    //             height: 10,
                    //           ),
                    //         ],
                    //       ),
                    //     )),
                    //
                  ],
                )),
              ));
  }
}
