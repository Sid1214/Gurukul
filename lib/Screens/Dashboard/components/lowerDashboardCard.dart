import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gurukul/other/constraits.dart';

class LowerDashboardCard extends StatelessWidget {
  const LowerDashboardCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 9,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 26.0, right: 6),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '90%',
                    style: GoogleFonts.ubuntu(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  Text(
                    'Attendence',
                    style: GoogleFonts.ubuntu(
                        fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
          const DefaultVerticleDivider(
            color: Colors.black,
            thickness: 2,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.calendar_month,
                size: 30,
              ),
              const SizedBox(
                height: 4,
              ),
              SizedBox(
                width: 50,
                child: Text(
                  '20 Nov, 2023',
                  style: GoogleFonts.ubuntu(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Upcomming Exams',
                    style: GoogleFonts.ubuntu(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        'Semester #2',
                        style: GoogleFonts.ubuntu(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
