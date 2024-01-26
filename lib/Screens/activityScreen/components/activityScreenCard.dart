import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gurukul/Screens/activityScreen/components/activityScreenpopup.dart';
import 'package:gurukul/other/constraits.dart';
import 'package:intl/intl.dart';

class ActivityScreenCard extends StatelessWidget {
  const ActivityScreenCard({
    super.key,
    required this.color,
    required this.activityname,
    required this.activitylocation,
    required this.imageUrl,
    required this.activitydate,
    required this.activitydescription,
  });

  final Color color;
  final String activityname;
  final String activitylocation;
  final String imageUrl;
  final String activitydate;
  final String activitydescription;

  @override
  Widget build(BuildContext context) {
    DateTime parsedDate = DateTime.parse(activitydate);
    String formattedDate = DateFormat('dd-MM-yyyy').format(parsedDate);
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: GestureDetector(
        onTap: () {
          showDialog(
              barrierDismissible: true,
              context: context,
              builder: (BuildContext context) => ActivityPopup(
                    activityname: activityname,
                    activitydate: activitydate,
                    activitydescription: activitydescription,
                  ));
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => ActivityPopup(
          //               activityname: activityname,
          //               activitydate: activitydate,
          //               activitydescription: activitydescription,
          //             )));
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
                          Text(activityname,
                              style: GoogleFonts.ubuntu(
                                  fontSize: 14,
                                  color: color,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text('in $activitylocation',
                                  style: GoogleFonts.ubuntu(
                                      fontSize: 12,
                                      // color: color,
                                      fontWeight: FontWeight.bold)),
                              const Spacer(),
                              Text('on $formattedDate',
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
