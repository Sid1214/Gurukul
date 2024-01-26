import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewAssignmentBoard extends StatefulWidget {
  const NewAssignmentBoard(
      {super.key, required this.title, required this.onSelect});

  final String title;
  final void Function() onSelect;

  @override
  State<NewAssignmentBoard> createState() {
    return _NewAssignmentBoardState();
  }
}

class _NewAssignmentBoardState extends State<NewAssignmentBoard> {
  final List<String> notices = [
    'Annual Function Notice',
    'Examination Notice',
    'Fees Notice',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 4.5,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  widget.title,
                  style: GoogleFonts.ubuntu(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 4,
                ),
                SizedBox(
                    width: 80,
                    height: 25,
                    child: ElevatedButton(
                        onPressed: widget.onSelect,
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 42, 45, 116)),
                        child: Text('See All',
                            style: GoogleFonts.ubuntu(
                                fontWeight: FontWeight.bold, fontSize: 8)))),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: notices.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          const SizedBox(
                            width: 5,
                          ),
                          Image.asset(
                            index % 2 == 0
                                ? 'assets/circles/green_circle.png'
                                : 'assets/circles/red_circle.png',
                            height: 40,
                            color: index % 2 == 0 ? Colors.green : Colors.red,
                            width: 20,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                notices[index],
                                style: GoogleFonts.ubuntu(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                'Summary About the Annual',
                                style: GoogleFonts.ubuntu(
                                    color: Colors.black, fontSize: 8),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
