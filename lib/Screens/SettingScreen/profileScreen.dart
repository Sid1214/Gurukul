import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gurukul/Screens/Login/loginScreen.dart';
import 'package:gurukul/Screens/SettingScreen/Components/changepassword.dart';

import 'package:gurukul/Screens/erroScreen/errorScreen.dart';
import 'package:gurukul/model/studentData.dart';
import 'package:gurukul/provider/fetch_info_provider.dart';
import 'package:gurukul/Screens/SettingScreen/Components/profileItem.dart';
import 'package:gurukul/other/constraits.dart';
import 'package:gurukul/other/defaultScaffold.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  // final String userid;
  const ProfileScreen({
    super.key,
  });
  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  List<dynamic>? student = [];
  late Future<void> dataFuture;

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      title: 'My Profile',
      color: Colors.white,
      child: Consumer(
        builder: (context, ref, child) {
          final studentAsyncValue = ref.watch(studentProvider);
          return studentAsyncValue.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stack) => ErrorScreen.fromProfile(
              errorMessage: '$error',
              isProfileScreen: true,
            ).build(context),
            data: (student) {
              if (student.isEmpty) {
                return Center(
                    child: (ErrorScreen.fromProfile(
                            errorMessage:
                                'No data available, Try Again After Sometime',
                            isProfileScreen: true))
                        .build(context));
              } else {
                return _mainBody(StudentDetails.fromJson(student[0]));
              }
            },
          );
        },
      ),
    );
  }

  Widget _mainBody(StudentDetails student) {
    String profilePhotoUrl = student.photoUrl;

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: defaultPadding,
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(profilePhotoUrl),
              ),
              if (profilePhotoUrl.isEmpty) const CircularProgressIndicator(),
              if (profilePhotoUrl.isEmpty) const Icon(Icons.error),
            ],
          ),
          const SizedBox(height: 20),
          ProfileItem(
            heading: 'Full Name',
            title: student.studentName,
            photoUrl: "",
          ),
          const SizedBox(height: 10),
          ProfileItem(
            heading: 'Class & Section',
            title:
                "${student.classes['class_name']}, ${student.sections['section_name']}",
            photoUrl: "",
          ),
          const SizedBox(height: 10),
          ProfileItem(
            heading: 'Roll No.',
            title: student.rollNumber,
            photoUrl: "",
          ),
          const SizedBox(height: 10),
          ProfileItem(
            heading: 'Email',
            title: student.email,
            photoUrl: "",
          ),
          const SizedBox(height: 10),
          ProfileItem(
              heading: 'Phone No.', title: student.phoneNumber, photoUrl: ""),
          TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const LoginScreen()));
              },
              child: const DefaultText(
                  title: 'Logout', color: kPrimaryColor, fontsize: 14)),
          TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ChangePasswordScreen(
                          userid: "",
                        )));
                // showDialog(
                //   context: context,
                //   builder: (BuildContext context) {
                //     return const ChangePasswordScreen(
                //         // userid: "widget.userid",
                //         );
                //   },
                // );
              },
              child: const DefaultText(
                  title: 'Change Password?',
                  color: kPrimaryColor,
                  fontsize: 10))
        ],
      ),
    );
  }
}
