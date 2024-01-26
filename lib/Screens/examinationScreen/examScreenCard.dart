import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gurukul/model/examinationdata.dart';
import 'package:gurukul/other/constraits.dart';
import 'package:gurukul/provider/daycountdunction.dart';

class ExamScreenCard extends StatelessWidget {
  final OldParentExams examdata;
  final String comefrom;
  const ExamScreenCard(
      {super.key,
      required this.color,
      required this.examdata,
      required this.comefrom});

  final Color color;

  @override
  Widget build(BuildContext context) {
    DateTime currentDate = DateTime.now();

    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'assets/icons/exam_icon.png',
          height: 40,
        ),
        Container(
          // width: 220,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(examdata.parentExamName.toString(),
                  style: GoogleFonts.ubuntu(
                      fontSize: 12, color: color, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.calendar_month,
                    // color: color,
                    size: 10,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text('FROM ${examdata.startDate}',
                      style: GoogleFonts.ubuntu(
                          fontSize: 8,
                          // color: color,
                          fontWeight: FontWeight.w600)),
                  const SizedBox(
                    width: 5,
                  ),
                  Text('TO ${examdata.endDate}',
                      style: GoogleFonts.ubuntu(
                          fontSize: 8,
                          // color: color,
                          fontWeight: FontWeight.w600)),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
            height: 80,
            child: DefaultVerticleDivider(
              color: Colors.black54,
              thickness: 2,
            )),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DefaultText(
                title: comefrom == "remain"
                    ? examdata.remainday == 1
                        ? 'Tomorrow'
                        : examdata.remainday == 0
                            ? 'Ongoing'
                            : examdata.remainday.toString()
                    : comefrom == 'done'
                        ? examdata.remainday! < 0
                            ? 'Done'
                            : examdata.remainday.toString()
                        : "Ongoing",
                color: color,
                fontsize: 12,
                weight: FontWeight.bold),
            SizedBox(
              width: 40,
              child: DefaultText(
                  title: comefrom == "remain"
                      ? examdata.remainday == 1
                          ? ""
                          : examdata.remainday == 0
                              ? ""
                              : "Days to go"
                      : "",
                  color: Colors.black,
                  fontsize: 8,
                  weight: FontWeight.w600),
            ),
          ],
        )
      ],
    );
  }
}
