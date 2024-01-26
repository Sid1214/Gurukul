import 'package:flutter/material.dart';

import 'package:gurukul/Screens/Login/Components/loginForm.dart';
import 'package:gurukul/Screens/Login/Components/loginScreenTopImage.dart';
import 'package:gurukul/other/background.dart';
import 'package:gurukul/other/constraits.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  void _showErrorPopup(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            const LoginScreenTopImage(),
            const Row(
              children: [
                Spacer(),
                Expanded(
                  flex: 8,
                  child: LoginForm(),
                ),
                Spacer(),
              ],
            ),
            const SizedBox(
              height: defaultPadding / 2,
            ),
            Image.asset(
              'assets/images/alongx.png',
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
