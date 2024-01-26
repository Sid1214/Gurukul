import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FeesCard extends StatelessWidget {
  const FeesCard({
    super.key,
    required this.imageUrl,
    required this.selectedColor,
    required this.selectedText,
    required this.cardText,
    required this.image,
    this.selectedIcon,
    required this.onFees,
  });

  final AssetImage imageUrl;
  final String image;
  final Color selectedColor;
  final String selectedText;
  final String cardText;
  final Icon? selectedIcon;
  final void Function() onFees;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Card(
        elevation: 1.0,
        child: InkWell(
          onTap: onFees,
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
                            width: 30,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            selectedText,
                            style: GoogleFonts.ubuntu(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: selectedColor),
                          ),
                        ],
                      ),
                      // const SizedBox(
                      //   height: 8,
                      // ),
                      Text(
                        'Fees',
                        style: GoogleFonts.ubuntu(
                            fontSize: 14,
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
