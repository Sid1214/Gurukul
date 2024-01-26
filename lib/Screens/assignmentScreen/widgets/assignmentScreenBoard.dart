import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gurukul/Screens/erroScreen/errorScreen.dart';
import 'package:gurukul/other/constraits.dart';
import 'package:gurukul/provider/fetch_info_provider.dart';
import 'package:gurukul/Screens/assignmentScreen/widgets/assignmentToggleButtons.dart';

class AssignmentScreenBoard extends ConsumerStatefulWidget {
  const AssignmentScreenBoard({super.key});

  @override
  ConsumerState<AssignmentScreenBoard> createState() {
    return _AssignmentScreenBoardState();
  }
}

class _AssignmentScreenBoardState extends ConsumerState<AssignmentScreenBoard> {
  String _getFirst10Words(String input) {
    List<String> words = input.split(' ');
    String result = words.take(4).join(' ');

    return '$result...';
  }

  void _showDetailsDialog(String title, String detail) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title,
            style: GoogleFonts.ubuntu(fontWeight: FontWeight.bold),
          ),
          actions: [
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      detail,
                      style: GoogleFonts.ubuntu(fontWeight: FontWeight.normal),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 60,
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.black)),
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          'Upload file must be in PDF Formate',
                          style: GoogleFonts.ubuntu(
                              fontWeight: FontWeight.normal, fontSize: 12),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Assignment File',
                      style: GoogleFonts.ubuntu(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                        width: 130,
                        height: 30,
                        child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.upload),
                            label: const Text('Upload'))),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const SizedBox(
                          width: 5,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'Submit',
                            style: GoogleFonts.ubuntu(
                                fontWeight: FontWeight.bold,
                                color: kPrimaryColor),
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final assignmentAsyncValue = ref.watch(assignmentProvider);
        return assignmentAsyncValue.when(
          data: (List<Map<String, dynamic>>? assignments) {
            if (assignments == null || assignments.isEmpty) {
              return const Center(
                child: Text('No data available',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              );
            }
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AssignmentToogleButtons(
                        numberOfAssignment: assignments.length),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 800,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: assignments.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {},
                                child: SizedBox(
                                  height: 80,
                                  child: Card(
                                    color: Colors.white,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          bottom: 0,
                                          child: Image.asset(
                                            'assets/decoration/lower.png',
                                            color: Colors.green.shade100,
                                            height: 60,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 18),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Icon(
                                                    Icons.alarm,
                                                    size: 30,
                                                  ),
                                                ],
                                              ),
                                              const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 8, vertical: 4),
                                                child: VerticalDivider(
                                                  thickness: 2,
                                                  color: Colors.black54,
                                                ),
                                              ),
                                              Expanded(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      assignments[index][
                                                              'assignment_title'] ??
                                                          '',
                                                      style: GoogleFonts.ubuntu(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18,
                                                      ),
                                                    ),
                                                    Text(
                                                      _getFirst10Words(assignments[
                                                                  index][
                                                              'assignment_details'] ??
                                                          ''),
                                                      style: GoogleFonts.ubuntu(
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const Icon(
                                                Icons.check_circle,
                                                color: Colors.green,
                                                size: 30,
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          error: (error, stackTrace) => Center(
            child: Text('Error in loading Data: $error'),
          ),
        );
      },
    );
  }
}
