import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gurukul/Screens/erroScreen/errorScreen.dart';
import 'package:gurukul/provider/fetch_info_provider.dart';
// import 'package:intl/intl.dart';

class ActivityPopup extends ConsumerStatefulWidget {
  final String activityname, activitydate, activitydescription;

  const ActivityPopup(
      {super.key,
      required this.activityname,
      required this.activitydate,
      required this.activitydescription});

  @override
  ConsumerState<ActivityPopup> createState() => _ActivityPopupState();
}

class _ActivityPopupState extends ConsumerState<ActivityPopup> {
  AsyncValue<List<dynamic>>? activityAsyncValue;
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      activityAsyncValue = ref.watch(activitiesProvider);
      return activityAsyncValue!.when(
          data: (List<dynamic>? activites) {
            if (activites == null || activites.isEmpty) {
              return const Center(
                child: Text('No Activities Available'),
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
                          //   "Activity Details",
                          //   style: GoogleFonts.ubuntu(
                          //     color: Colors.black,
                          //     fontWeight: FontWeight.bold,
                          //   ),
                          // ),
                          // const SizedBox(height: 20),
                          Center(
                            child: Text(
                              widget.activityname.toString(),
                              style: GoogleFonts.ubuntu(
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
                                'Activity Date:',
                                style: GoogleFonts.ubuntu(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                widget.activitydate.toString(),
                                style: GoogleFonts.ubuntu(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            widget.activitydescription.toString(),
                            textAlign: TextAlign.justify,
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
//
  }
}
