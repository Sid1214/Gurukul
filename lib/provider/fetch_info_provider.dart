import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gurukul/model/examinationdata.dart';
import 'package:gurukul/model/storage.dart';
import 'package:gurukul/model/studentData.dart';
import 'package:gurukul/model/usermodel.dart';
import 'package:gurukul/provider/loginAuth_provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final instituteProvider = FutureProvider<IntituteDetails>((ref) async {
  final institutionID = ref.watch(authNotifierProvider).institutionID;
  String instituteEndPoint =
      '/Institute/get_institute_by_id/?institute_id=$institutionID';
  String instituteURL = fastApiUrl + instituteEndPoint;
  String accessToken = ref.watch(authNotifierProvider).accessToken;
  String tokenType = "bearer";
  final response = await http.get(
    Uri.parse(instituteURL),
    headers: {
      'Authorization': '$tokenType $accessToken',
      'Content-Type': 'application/json',
    },
  );
  if (response.statusCode == 200) {
    return IntituteDetails.fromJSON(json.decode(response.body));
  } else {
    throw Exception('Failed to load student data');
  }
});

final studentProvider = FutureProvider<List<dynamic>>((ref) async {
  String? emailStudent = await UserStorage().getEmail();

  // if (emailStudent?.isEmpty ?? true) {
  //   throw Exception('Email is null');
  // }
  // if (emailStudent?.isNotEmpty ?? false) {}
  String studentUrl = '/Students/get_students_by_field/email/$emailStudent/';

  String totalStudentUrl = fastApiUrl + studentUrl;
  String accessToken = ref.watch(authNotifierProvider).accessToken;
  String tokenType = "bearer";

  final response = await http.get(
    Uri.parse(totalStudentUrl),
    headers: {
      'Authorization': '$tokenType $accessToken',
      'Content-Type': 'application/json',
    },
  );

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to load student data');
  }
});

// Fetching Transport Details

final transportationProvider = FutureProvider<TransportDetails>((ref) async {
  final transportId = await ref
      .watch(studentProvider.future)
      .then((data) => data.first['transport_id']);

  if (transportId == -1 || transportId == null) {
    return TransportDetails(
        vehicleNumber: "",
        transportName: "",
        registerDate: "",
        instituteId: -1,
        vehicleDetails: "",
        transportId: -1,
        isDeleted: true);
  }
  String transportApi =
      '/Transports/get_transport_data_by_id/?transport_id=$transportId';

  String totalTransportUrl = fastApiUrl + transportApi;
  String accessToken = ref.watch(authNotifierProvider).accessToken;
  String tokenType = "bearer";

  final response = await http.get(
    Uri.parse(totalTransportUrl),
    headers: {
      'Authorization': '$tokenType $accessToken',
      'Content-Type': 'application/json',
    },
  );

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);
    final responseDetails = data['response'];

    return TransportDetails.fromJson(responseDetails);
  } else {
    throw Exception('Failed to load transport details: ${response.statusCode}');
  }
});

// Fetching Notice Details

final noticeProvider = FutureProvider<List<Map<String, dynamic>>>((ref) async {
  final institutionID = ref.watch(authNotifierProvider).institutionID;
  String NoticeApi =
      '/Notice/get_notices_institute/?institute_id=$institutionID';

  String totalNoticeUrl = fastApiUrl + NoticeApi;
  String accessToken = ref.read(authNotifierProvider).accessToken;
  String tokenType = "bearer";

  final response = await http.get(
    Uri.parse(totalNoticeUrl),
    headers: {
      'Authorization': '$tokenType $accessToken',
      'Content-Type': 'application/json',
    },
  );

  if (response.statusCode == 200) {
    final List<Map<String, dynamic>> data =
        List<Map<String, dynamic>>.from(json.decode(response.body));
    return data;
  } else {
    throw Exception('Failed to load notice data: ${response.statusCode}');
  }
});

// Fetching Assignment Details

final assignmentProvider =
    FutureProvider<List<Map<String, dynamic>>>((ref) async {
  final institutionID = ref.watch(authNotifierProvider).institutionID;
  String assignmentAPI =
      '/Assignments/get_assignments_institute/?institution_id=$institutionID';

  String totalAssignmentURL = fastApiUrl + assignmentAPI;
  String accessToken = ref.read(authNotifierProvider).accessToken;
  String tokenType = "bearer";

  final response = await http.get(
    Uri.parse(totalAssignmentURL),
    headers: {
      'Authorization': '$tokenType $accessToken',
      'Content-Type': 'application/json',
    },
  );

  if (response.statusCode == 200) {
    final List<Map<String, dynamic>> data =
        List<Map<String, dynamic>>.from(json.decode(response.body));
    return data;
  } else {
    throw Exception('Failed to load assignment data: ${response.statusCode}');
  }
});

final studentAttendanceProvider =
    FutureProvider<Map<dynamic, dynamic>>((ref) async {
  final studentID = await ref
      .watch(studentProvider.future)
      .then((value) => value.first['student_id']);
  String studentAttendanceAPI =
      '/StudentAttendance/get_student_attendance_by_student_id/?student_id=$studentID';
  String totalStudentAttendanceURL = fastApiUrl + studentAttendanceAPI;
  String accessToken = ref.read(authNotifierProvider).accessToken;
  String tokenType = "bearer";

  final response = await http.get(
    Uri.parse(totalStudentAttendanceURL),
    headers: {
      'Authorization': '$tokenType $accessToken',
      'Content-Type': 'application/json',
    },
  );
  if (response.statusCode == 200) {
    final Map<dynamic, dynamic> data =
        Map<dynamic, dynamic>.from(json.decode(response.body));
    return data;
  } else {
    throw Exception('Failed to load attendance data: ${response.statusCode}');
  }
});

final activitiesProvider = FutureProvider<List>((ref) async {
  final institutionID = ref.watch(authNotifierProvider).institutionID;
  String activitiesAPI =
      '/Activity/get_all_activity_by_institute/?institution_id=$institutionID';
  String activitiesURL = fastApiUrl + activitiesAPI;
  String accessToken = ref.read(authNotifierProvider).accessToken;
  String tokenType = "bearer";
  final response = await http.get(
    Uri.parse(activitiesURL),
    headers: {
      'Authorization': '$tokenType $accessToken',
      'Content-Type': 'application/json',
    },
  );
  if (response.statusCode == 200) {
    final data = json.decode(response.body);

    return data;
  } else {
    throw Exception('Failed to load attendance data: ${response.statusCode}');
  }
});

StateProvider<UserModel> UserProvider = StateProvider((ref) => UserModel());

getuserDetail({required WidgetRef ref}) async {
  final institutionID = ref.watch(authNotifierProvider).institutionID;
  String userAPI = '/Users/get_users_by_institute/?institute_id=$institutionID';

  String userURL = fastApiUrl + userAPI;
  String accessToken = ref.read(authNotifierProvider).accessToken;
  String tokenType = "bearer";
  final response = await http.get(
    Uri.parse(userURL),
    headers: {
      'Authorization': '$tokenType $accessToken',
      'Content-Type': 'application/json',
    },
  );
  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    ref.watch(UserProvider.notifier).state = UserModel.fromJson(data);
  } else {
    throw Exception('Failed to load User data: ${response.statusCode}');
  }
}
