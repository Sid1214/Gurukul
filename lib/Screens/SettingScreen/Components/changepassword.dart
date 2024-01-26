import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gurukul/model/usermodel.dart';
import 'package:http/http.dart' as http;
import 'package:gurukul/provider/loginAuth_provider.dart';

class ChangePasswordScreen extends ConsumerStatefulWidget {
  String? userid;
  ChangePasswordScreen({super.key, required this.userid});

  @override
  ConsumerState<ChangePasswordScreen> createState() =>
      _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends ConsumerState<ChangePasswordScreen> {
  UserModel? userdata;
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmNewPasswordController =
      TextEditingController();
  // StateProvider userdatapagelodaerProvider = StateProvider((ref) => true);
  // Future patchupdatePassword() async {
  //   final authNotifier = ref.read(authNotifierProvider);
  //   final currentPassword = _oldPasswordController.text;
  //   final newPassword = _newPasswordController.text;
  //   final confirmNewPassword = _confirmNewPasswordController.text;

  //   String accessToken = ref.read(authNotifierProvider).accessToken;
  //   String tokenType = "bearer";
  //   final response = await http.patch(
  //     Uri.parse(
  //         "$fastApiUrl/Users/update_user_password/?user_id=${widget.userid}&user_password=$currentPassword"),
  //     headers: {
  //       'Authorization': '$tokenType $accessToken',
  //       'Content-Type': 'application/json',
  //     },
  //   );
  //   if (response.statusCode == 200) {
  //     log(response.body.toString());
  //     return UserModel.fromJson(jsonDecode(response.body));
  //   } else {
  //     UserModel();
  //   }
  // }

  // Future callApi() async {
  //   log(widget.userid.toString());

  //   userdata = await patchupdatePassword().whenComplete(() {
  //     Future.delayed(const Duration(seconds: 2)).whenComplete(
  //         () => ref.watch(userdatapagelodaerProvider.notifier).state = false);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Theme.of(context).primaryColor),
          child: const Padding(
            padding: EdgeInsets.all(12),
            child: Text('Update'),
          ),
        ),
      ),
      appBar: AppBar(
          title: Text(
        'Change Password',
        style: GoogleFonts.ubuntu(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
      )),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text(
                      'Old Password',
                      style: GoogleFonts.ubuntu(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 14),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: SizedBox(
                      height: 60,
                      child: TextField(
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                        decoration: InputDecoration(
                            hintText: ' ',
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)))),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Text(
                    'New Password',
                    style: GoogleFonts.ubuntu(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 14),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                    height: 60,
                    child: TextField(
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                      decoration: InputDecoration(
                          hintText: ' ',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)))),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Text(
                      'Confirm Password',
                      style: GoogleFonts.ubuntu(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 14),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: SizedBox(
                      height: 60,
                      child: TextField(
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                        decoration: InputDecoration(
                            hintText: ' ',
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)))),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// import 'dart:convert';
// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:gurukul/model/usermodel.dart';
// import 'package:gurukul/provider/loginAuth_provider.dart';


// class ChangePasswordScreen extends ConsumerStatefulWidget {
//   String? userid;
//   ChangePasswordScreen({super.key, required this.userid});

//   @override
//   ConsumerState<ChangePasswordScreen> createState() =>
//       _ChangePasswordScreenState();
// }

// class _ChangePasswordScreenState extends ConsumerState<ChangePasswordScreen> {
//   UserModel? userdata;
//   final TextEditingController _oldPasswordController = TextEditingController();
//   final TextEditingController _newPasswordController = TextEditingController();
//   final TextEditingController _confirmNewPasswordController =
//       TextEditingController();
//   final String _errorMessage = '';
//   StateProvider userdatapagelodaerProvider = StateProvider((ref) => true);
//   Future patchupdatePassword() async {
//     final authNotifier = ref.read(authNotifierProvider);
//     final currentPassword = _oldPasswordController.text;
//     final newPassword = _newPasswordController.text;
//     final confirmNewPassword = _confirmNewPasswordController.text;

//     String accessToken = ref.read(authNotifierProvider).accessToken;
//     String tokenType = "bearer";
//     final response = await http.patch(
//       Uri.parse(
//           "$fastApiUrl/Users/update_user_password/?user_id=${widget.userid}&user_password=$currentPassword"),
//       headers: {
//         'Authorization': '$tokenType $accessToken',
//         'Content-Type': 'application/json',
//       },
//     );
//     if (response.statusCode == 200) {
//       log(response.body.toString());
//       return UserModel.fromJson(jsonDecode(response.body));
//     } else {
//       UserModel();
//     }

//     // if (!isValidOldPassword(currentPassword)) {
//     //   setState(() {
//     //     _errorMessage = 'Invalid current password.';
//     //   });
//     //   return;
//     // }

//     // if (!isValidNewPassword(newPassword)) {
//     //   setState(() {
//     //     _errorMessage = 'Invalid new password. Minimum length: 6 characters.';
//     //   });
//     //   return;
//     // }
//     // if (newPassword != confirmNewPassword) {
//     //   setState(() {
//     //     _errorMessage = 'New passwords do not match.';
//     //   });
//     //   return;
//     // }

//     // // final result =
//     // //     await authNotifier.updatePassword(currentPassword, newPassword);

//     // // Handle the result
//     // if (result.statusCode == 200) {

//     //   Navigator.of(context).pop();
//     // } else {

//     //   setState(() {
//     //     _errorMessage = 'Failed to update password. ${result.error}';
//     //   });
//     // }
//   }

//   Future callApi() async {
//     log(widget.userid.toString());

//     userdata = await patchupdatePassword().whenComplete(() {
//       Future.delayed(const Duration(seconds: 2)).whenComplete(
//           () => ref.watch(userdatapagelodaerProvider.notifier).state = false);
//     });
//   }

//   @override
//   void initState() {
//     callApi();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//       child: SingleChildScrollView(
//         child: AlertDialog(
//           contentPadding: const EdgeInsets.all(5),
//           title: Text(
//             'Change Password',
//             style: GoogleFonts.ubuntu(
//                 color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//           content: Column(
//             // mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 30.0),
//               const PasswordFormField(
//                 labelText: 'Current Password',
//                 obscureText: true,
//               ),
//               const SizedBox(height: 30.0),
//               const PasswordFormField(
//                 labelText: 'New Password',
//                 obscureText: true,
//               ),
//               const SizedBox(height: 30.0),
//               const PasswordFormField(
//                 labelText: 'Confirm New Password',
//                 obscureText: true,
//               ),
//               const SizedBox(height: 50.0),
//               if (_errorMessage.isNotEmpty)
//                 Padding(
//                   padding: const EdgeInsets.only(top: 16),
//                   child: Text(
//                     _errorMessage,
//                     style: const TextStyle(color: Colors.red),
//                   ),
//                 ),
//             ],
//           ),
//           actions: [
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(6),
//                 ),
//               ),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text(
//                 'Update Password',
//                 style: GoogleFonts.ubuntu(
//                     color: Colors.white,
//                     fontSize: 14,
//                     fontWeight: FontWeight.bold),
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             Center(
//               child: TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: const Text('Cancel'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class PasswordFormField extends StatelessWidget {
//   final String labelText;
//   final bool obscureText;

//   const PasswordFormField({
//     super.key,
//     required this.labelText,
//     required this.obscureText,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       obscureText: obscureText,
//       decoration: InputDecoration(
//           fillColor: Colors.white,
//           labelText: labelText,
//           border: const OutlineInputBorder(
//               borderRadius: BorderRadius.all(Radius.circular(10))),
//           contentPadding:
//               const EdgeInsets.symmetric(horizontal: 10, vertical: 5)),
//     );
//   }
// }

// bool isValidOldPassword(String password) {
//   return password == 'currentPassword';
// }

// bool isValidNewPassword(String password) {
//   return password.length >= 6;
// }
