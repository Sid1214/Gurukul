import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gurukul/other/constraits.dart';

class LoginScreenTopImage extends StatelessWidget {
  const LoginScreenTopImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/gurukul.png',
          height: 50,
        ),
        SizedBox(
          height: defaultPadding,
        ),
        const Text(
          "Welcome to Gurukul",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 22, color: kPrimaryColor),
        ),
        // const SizedBox(height: defaultPadding),
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 4,
              // child: Image.asset("assets/gurukul.png"),
              child: SvgPicture.asset("assets/icons/login.svg"),
            ),
            const Spacer(),
          ],
        ),
        const SizedBox(height: defaultPadding),
      ],
    );
  }
}
