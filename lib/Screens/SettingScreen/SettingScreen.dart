import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:gurukul/other/constraits.dart';
import 'package:gurukul/other/defaultScaffold.dart';
import 'package:gurukul/provider/fetch_info_provider.dart';

import 'package:image_picker/image_picker.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  File? _image;
  List<dynamic>? student = [];
  late Future<void> dataFuture;

  Future _getImage() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = pickedFile != null ? File(pickedFile.path) : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      title: 'My Profile',
      elevation: 1,
      color: Colors.white,
      child: Consumer(
        builder: (context, ref, child) {
          final studentAsyncValue = ref.watch(studentProvider);

          return studentAsyncValue.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stack) => Center(child: Text('Error: $error')),
            data: (student) {
              if (student.isEmpty) {
                return const Center(
                    child: Text('No data available, Try Again After Sometime'));
              } else {
                return buildStudentDetails(
                  student[0]['student_name'],
                  student[0]['roll_number'],
                  student[0]['phone_number'],
                  student[0]['email'],
                );
              }
            },
          );
        },
      ),
    );
  }

  Widget buildStudentDetails(
      String name, String rollno, String number, String email) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        _buildProfileRow(
          name,
          'Student',
        ),
        const Divider(thickness: 1),
        _buildSettingsTile('Roll No:', rollno, Colors.black87, () {}),
        const Divider(thickness: 1),
        _buildSettingsTile('Email:', email, Colors.black87, () {}),
        const Divider(thickness: 1),
        _buildSettingsTile('Phone No:', number, Colors.black87, () {}),
        const SizedBox(height: 20.0),
        TextButton(
            onPressed: () {},
            child: const DefaultText(
                title: 'Logout', color: Colors.blue, fontsize: 15)),
      ],
    );
  }

  Widget _buildProfileRow(String name, String role) {
    return Row(
      children: [
        GestureDetector(
          onTap: _getImage,
          child: const CircleAvatar(
            radius: 30.0,
            backgroundColor: Colors.white,
            backgroundImage: AssetImage(
              'assets/decoration/examgirl.png',
            ), // Replace with your image asset
          ),
        ),
        const SizedBox(width: 16.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style:
                  const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Text(
              role,
              style: const TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSettingsTile(
      String heading, String title, Color color, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DefaultText(
              title: heading,
              color: color,
              fontsize: 16,
              weight: FontWeight.bold),
          const SizedBox(width: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              DefaultText(title: title, color: color, fontsize: 14),
            ],
          )
        ],
      ),
    );
  }
}
