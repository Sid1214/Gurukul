import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gurukul/Screens/attendenceScreen/attendenceScreen.dart';

class AttendenceCard extends StatelessWidget {
  const AttendenceCard({
    super.key,
    required this.imageUrl,
    required this.selectedColor,
    required this.selectedText,
    required this.cardText,
    required this.image,
    this.selectedIcon,
  });

  final AssetImage imageUrl;
  final String image;
  final Color selectedColor;
  final String selectedText;
  final String cardText;
  final Icon? selectedIcon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Card(
        elevation: 1.0,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AttendenceDetailScreen()));
          },
          child: Container(
              height: MediaQuery.of(context).size.height / 8,
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(
                  image: imageUrl,
                  fit: BoxFit.fill,
                ),
              ),
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            image,
                            height: 30,
                            width: 40,
                          ),
                          Text(
                            selectedText,
                            style: GoogleFonts.ubuntu(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: selectedColor),
                          ),
                        ],
                      ),
                      // const SizedBox(
                      //   height: 8,
                      // ),
                      Text(
                        'Attendence',
                        style: GoogleFonts.ubuntu(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
