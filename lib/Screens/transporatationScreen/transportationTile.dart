import 'package:flutter/material.dart';
import 'package:gurukul/other/constraits.dart';

class TransportationTile extends StatelessWidget {
  const TransportationTile(
      {super.key,
      required this.imageUrl,
      required this.headingTitle,
      required this.secondText,
      required this.thirdText,
      required this.color});

  final String imageUrl;
  final String headingTitle;
  final String secondText;
  final String thirdText;
  final Color color;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Container(
        // color: Colors.white,
        height: MediaQuery.of(context).size.height / 5,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Stack(
          children: [
            Positioned(
                top: 0,
                right: 0,
                child: Image.asset(
                  'assets/decoration/upper.png',
                  color:
                      const Color.fromARGB(255, 235, 184, 28).withOpacity(0.5),
                  // height: 200,
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  imageUrl,
                  height: 100,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DefaultText(
                        title: headingTitle,
                        color: Colors.black,
                        fontsize: 25,
                        weight: FontWeight.bold,
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                        child: Divider(height: 2, color: Colors.black),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: DefaultText(
                          title: secondText,
                          color: color,
                          fontsize: 14,
                          weight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      DefaultText(
                        title: thirdText,
                        color: color,
                        fontsize: 14,
                        weight: FontWeight.normal,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
