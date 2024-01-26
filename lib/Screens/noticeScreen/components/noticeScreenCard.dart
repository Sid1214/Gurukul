import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl.dart';

class NoticeScreenCard extends StatelessWidget {
  const NoticeScreenCard(
      {super.key,
      required this.title,
      required this.date,
      required this.color});

  final String title;
  final String date;
  final Color color;

  @override
  Widget build(BuildContext context) {
    DateTime parsedDate = DateTime.parse(date);
    String formattedDate = DateFormat('dd-MM-yyyy').format(parsedDate);
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        height: 80,
        decoration: const BoxDecoration(color: Colors.white),
        child: Stack(children: [
          Positioned(
              left: 0,
              top: -2,
              child: Transform.rotate(
                angle: -1.57079632679,
                child: Image.asset(
                  'assets/decoration/upper.png',
                  color: color.withOpacity(0.3),
                  height: 90,
                ),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/decoration/speaker.png',
                // color: Colors.green,
                height: 50,
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      overflow: TextOverflow.ellipsis,
                      title,
                      style: GoogleFonts.ubuntu(
                          fontSize: 18,
                          color: color,
                          fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_month,
                        // color: color,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text('on $formattedDate',
                          style: GoogleFonts.ubuntu(
                              fontSize: 13,
                              // color: color,
                              fontWeight: FontWeight.w600)),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              // selectedIcon,
              // Padding(
              //     padding: const EdgeInsets.all(8),
              //     child: color == Colors.red
              //         ? Image.asset(
              //             'assets/decoration/expired.png',
              //             // color: Colors.red.withOpacity(0.4),
              //             height: 60,
              //           )
              //         : Image.asset(
              //             'assets/decoration/new.png',
              //             // color: Colors.red.withOpacity(0.4),
              //             height: 50,
              //           ))
            ],
          ),
        ]),
      ),
    );
  }
}
