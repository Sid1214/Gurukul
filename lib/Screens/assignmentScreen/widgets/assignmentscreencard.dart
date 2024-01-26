import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gurukul/Screens/activityScreen/components/activityScreenpopup.dart';
import 'package:gurukul/Screens/assignmentScreen/widgets/assignmentpopup.dart';
import 'package:gurukul/other/constraits.dart';
import 'package:intl/intl.dart';

class AssignmentScreenCard extends StatelessWidget {
  const AssignmentScreenCard({
    super.key,
    required this.color,
    required this.assignmentname,
    required this.assignmentduedate,
    required this.imageUrl,
    required this.assignmentdate,
    required this.assignmentdescription,
  });

  final Color color;
  final String assignmentname;
  final String assignmentduedate;
  final String imageUrl;
  final String assignmentdate;
  final String assignmentdescription;

  @override
  Widget build(BuildContext context) {
    DateTime parsedDate1 = DateTime.parse(assignmentdate);
    String formattedDate = DateFormat('dd-MM-yyyy').format(parsedDate1);
    DateTime parsedDate2 = DateTime.parse(assignmentduedate);
    String formattedDate1 = DateFormat('dd-MM-yyyy').format(parsedDate2);
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: GestureDetector(
        onTap: () {
          showDialog(
              barrierDismissible: true,
              context: context,
              builder: (BuildContext context) => AssignmentPopup(
                    assignmentname: assignmentname,
                    assignmentduedate: assignmentduedate,
                    assignmentdescription: assignmentdescription,
                    assignmentdate: assignmentdate,
                  ));
        },
        child: Container(

            // padding: EdgeInsets.all(20),
            height: 80,
            // color: Colors.black,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              // borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Stack(
              children: [
                Positioned(
                    top: 0,
                    right: 0,
                    child: Image.asset(
                      'assets/decoration/upper.png',
                      color: color.withOpacity(0.2),
                      height: 100,
                    )),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/circles/$imageUrl.png',
                            color: color,
                          ),
                          SizedBox(
                            height: 20,
                            child: DefaultVerticleDivider(
                              thickness: 2,
                              color: color,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 240,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(assignmentname,
                              style: GoogleFonts.ubuntu(
                                  fontSize: 14,
                                  color: color,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.calendar_month),
                                  Text(' $formattedDate',
                                      style: GoogleFonts.ubuntu(
                                          fontSize: 12,
                                          // color: color,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              const Spacer(),
                              Text('due on ',
                                  style: GoogleFonts.ubuntu(
                                      fontSize: 12,
                                      // color: color,
                                      fontWeight: FontWeight.w400)),
                              Text(' $formattedDate1',
                                  style: GoogleFonts.ubuntu(
                                      fontSize: 12,
                                      // color: color,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // selectedIcon,
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
