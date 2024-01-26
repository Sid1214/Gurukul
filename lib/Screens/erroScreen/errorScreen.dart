import 'package:flutter/material.dart';
import 'package:gurukul/model/storage.dart';

import '../Login/loginScreen.dart';

class ErrorScreen extends StatelessWidget {
  final String errorMessage;
  bool? isProfileScreen;

  ErrorScreen({required this.errorMessage});
  ErrorScreen.fromProfile(
      {required this.errorMessage, required this.isProfileScreen});

  @override
  Widget build(BuildContext context) {
    String errorText = 'Go To Logout Screen';

    return WillPopScope(
      // This callback is called when the user presses the system back button.
      onWillPop: () async {
        // You can define the action to be taken when the back button is pressed,
        // such as navigating back or handling the error differently.
        // In this example, we simply pop the current screen.
        Navigator.pop(context);
        return false; // return true if you want to allow the back button press, false otherwise
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error,
                size: 50,
                color: Colors.red,
              ),
              SizedBox(height: 20),
              Text(
                'Something Went Wrong',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                errorMessage,
                style: TextStyle(fontSize: 16, color: Colors.red),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  // You can define the action to be taken when the button is pressed,
                  // such as navigating back or retrying the operation.

                  logOut();
                  Navigator.pop(context);

                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: Text(
                  errorText,
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void logOut() {
    UserStorage _userStorage = UserStorage();

    _userStorage.signOut();
  }
}
