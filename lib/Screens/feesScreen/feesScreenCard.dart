import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gurukul/other/constraits.dart';

class FeesScreenCard extends StatelessWidget {
  const FeesScreenCard({
    super.key,
    required this.heading,
    required this.ammount,
  });
  final String heading;
  final String ammount;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Container(
          // padding: EdgeInsets.all(20),
          height: 60,
          // color: Colors.black,
          decoration: BoxDecoration(color: Colors.white),
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.calendar_month,
                          size: 25,
                          color: Colors.black,
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 5),
                            width: 50,
                            alignment: Alignment.center,
                            child: DefaultText(
                              title: '27, Nov',
                              color: Colors.black,
                              fontsize: 8,
                              weight: FontWeight.w600,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(heading,
                              style: GoogleFonts.ubuntu(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/icons/ruppee.png',
                          // color: Colors.green,
                          height: 25,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        DefaultText(
                          title: ammount,
                          color: Colors.red,
                          fontsize: 20,
                          weight: FontWeight.bold,
                        ),
                      ],
                    ),
                  )

                  // selectedIcon,
                ],
              ),
            ],
          )),
    );
  }
}
