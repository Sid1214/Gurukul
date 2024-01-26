import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gurukul/Screens/erroScreen/errorScreen.dart';
import 'package:gurukul/provider/fetch_info_provider.dart';

class AssignmentPopup extends ConsumerStatefulWidget {
  final String assignmentname,
      assignmentdate,
      assignmentdescription,
      assignmentduedate;
  const AssignmentPopup(
      {super.key,
      required this.assignmentname,
      required this.assignmentdate,
      required this.assignmentdescription,
      required this.assignmentduedate});

  @override
  ConsumerState<AssignmentPopup> createState() => _AssignmentPopupState();
}

class _AssignmentPopupState extends ConsumerState<AssignmentPopup> {
  AsyncValue<List<dynamic>>? assignmentAsyncValue;
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      assignmentAsyncValue = ref.watch(assignmentProvider);
      return assignmentAsyncValue!.when(
          data: (List<dynamic>? activites) {
            if (activites == null || activites.isEmpty) {
              return const Center(
                child: Text('No Assignments Available'),
              );
            }
            return Padding(
              padding: const EdgeInsets.all(10.0),
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
                          // Text(
                          //   "Assignment Details",
                          //   style: GoogleFonts.ubuntu(
                          //     color: Colors.black,
                          //     fontWeight: FontWeight.bold,
                          //   ),
                          // ),
                          // const SizedBox(height: 20),
                          Center(
                            child: Text(
                              widget.assignmentname.toString(),
                              style: GoogleFonts.ubuntu(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Assigned Date:',
                                style: GoogleFonts.ubuntu(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                widget.assignmentdate.toString(),
                                style: GoogleFonts.ubuntu(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                'Due Date:',
                                style: GoogleFonts.ubuntu(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              ),
                              const Spacer(),
                              Text(
                                widget.assignmentduedate.toString(),
                                textAlign: TextAlign.justify,
                                style: GoogleFonts.ubuntu(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Tasks :',
                            style: GoogleFonts.ubuntu(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            widget.assignmentdescription.toString(),
                            style: GoogleFonts.ubuntu(
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
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
          },
          error: (error, stackTrace) =>
              ErrorScreen(errorMessage: '$error').build(context),
          loading: () => const Center(
                child: CircularProgressIndicator(),
              ));
    });
  }
}
