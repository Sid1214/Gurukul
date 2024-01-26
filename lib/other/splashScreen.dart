import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gurukul/model/storage.dart';
import 'package:gurukul/Screens/Dashboard/dashboardScreen.dart';
import 'package:gurukul/Screens/Login/loginScreen.dart';
import 'package:gurukul/other/constraits.dart';
// import 'package:gurukul/provider/loginAuth_provider.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});
  @override
  ConsumerState<SplashScreen> createState() {
    // TODO: implement createState
    return _Splash0ScreenState();
  }
}

class _Splash0ScreenState extends ConsumerState<SplashScreen> {
  final UserStorage _userStorage = UserStorage();

  String? isLogin = 'null';
  String? interpreterId;
  @override
  void initState() {
    super.initState();
    retrieveLogin();
    Timer(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (_) => ((isLogin!.length > 5))
              ? const DashboardScreen()
              : const LoginScreen()));
    });
  }

  Future<void> retrieveLogin() async {
    try {
      // String accessToken = ref.watch(authNotifierProvider).accessToken;
      final storedLogin = await _userStorage.getIsLoggin();
      // final id = await _userStorage.getInterpreterId();

      setState(() {
        isLogin = storedLogin!.length > 0 ? storedLogin : "null";
      });
    } catch (error) {
      print('Error retrieving email: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryLightColor,
      body: Center(
        child: Container(
          child: Image.asset(
            'assets/gurukul.png',
            height: 70,
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
        ),
      ),
    );
  }
}
