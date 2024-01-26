import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gurukul/other/constraits.dart';
import 'package:gurukul/provider/fetch_info_provider.dart';

import '../../erroScreen/errorScreen.dart';

class UpperBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    // TODO: implement build
    return Container(
        height: height / 7,
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Consumer(
              builder: (context, ref, child) {
                final institute = ref.watch(instituteProvider);

                return institute.when(
                    data: (institute) {
                      return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(
                                  'assets/images/schoollogo.png',
                                  height: 50,
                                ),
                                DefaultText(
                                    title: institute.instituteName,
                                    color: Colors.black,
                                    fontsize: 22,
                                    weight: FontWeight.bold),
                              ],
                            ),
                          ]);
                    },
                    error: (error, stack) =>
                        ErrorScreen(errorMessage: '$error').build(context),
                    loading: () {
                      return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(
                                  'assets/images/schoollogo.png',
                                  height: 50,
                                ),
                                DefaultText(
                                    title: 'Institute Name',
                                    color: Colors.black,
                                    fontsize: 22,
                                    weight: FontWeight.bold),
                              ],
                            ),
                          ]);
                    });
              },
            )));
  }
}
