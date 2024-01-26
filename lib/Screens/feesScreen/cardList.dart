import 'package:flutter/material.dart';
import 'package:gurukul/other/constraits.dart';

class CardList extends StatelessWidget {
  CardList({super.key});

  final PageController _pageController =
      PageController(initialPage: 1, viewportFraction: 0.5);

  final List<String> cardData = [
    'Total Amount',
    'Paid: 10,000',
    'Installments',
  ];
  final List<String> cardData1 = [
    '20,000',
    'UnPaid: 20,000',
    '20/40',
  ];
  List<String> imageUrlData = [
    'assets/decoration/fees.png',
    'assets/decoration/unpaid.png',
    'assets/decoration/installments.png'
  ];

  List<Color> cardColor = [Colors.blue, Colors.red, Colors.green];

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      scrollDirection: Axis.horizontal,
      itemCount: cardData.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.all(16.0),
          child: Container(
            width: 150,
            height: 100,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 42, 45, 116),
            ),
            padding: EdgeInsets.all(16.0),
            child: Center(
              child: FractionallySizedBox(
                  widthFactor: 1.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            imageUrlData[index],
                            height: 50,
                            // width: 150,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      DefaultText(
                          title: cardData1[index],
                          color: cardColor[index],
                          fontsize: 18,
                          weight: FontWeight.w600),
                      SizedBox(
                        height: 10,
                      ),
                      DefaultText(
                          title: cardData[index],
                          color: Colors.white,
                          fontsize: 15,
                          weight: FontWeight.bold),
                      if (index == 0)
                        const Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            // size: 10,
                            size: 15,
                          ),
                        ),
                      if (index == 1)
                        const Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                                size: 15,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 15,
                              )
                            ],
                          ),
                        ),
                      if (index == 2)
                        const Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            // size: 10,
                            size: 15,
                          ),
                        ),
                    ],
                  )),
            ),
          ),
        );
      },
    );
  }
}
