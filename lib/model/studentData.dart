class StudentDetails {
  final String dateOfBirth;
  final String studentName;
  final int instituteId;
  final int studentId;
  final String phoneNumber;
  final String admissionDate;
  final String photoUrl;
  final Map classes;
  final int transportId;
  final String gender;
  final String bloodGroup;
  final String address;
  final String email;
  final String rollNumber;
  final String slug;
  final Map sections;

  StudentDetails({
    required this.dateOfBirth,
    required this.studentName,
    required this.instituteId,
    required this.studentId,
    required this.phoneNumber,
    required this.admissionDate,
    required this.photoUrl,
    required this.classes,
    required this.transportId,
    required this.gender,
    required this.bloodGroup,
    required this.address,
    required this.email,
    required this.rollNumber,
    required this.slug,
    required this.sections,
  });

  factory StudentDetails.fromJson(Map<dynamic, dynamic> json) {
    return StudentDetails(
      dateOfBirth: json['date_of_birth'],
      studentName: json['student_name'],
      instituteId: json['institute_id'],
      studentId: json['student_id'],
      phoneNumber: json['phone_number'],
      admissionDate: json['admission_date'],
      photoUrl: json['photo'],
      classes: json['classes'],
      transportId: json['transport_id'] ?? -1,
      gender: json['gender'],
      bloodGroup: json['blood_group'],
      address: json['address'],
      email: json['email'],
      rollNumber: json['roll_number'],
      slug: json['slug'],
      sections: json['sections'],
    );
  }
}

class IntituteDetails {
  final String instituteAddress;
  final int subscribersId;
  final String instituteState;
  final String institutePincode;
  final String instituteEmail;
  final String instituteFavIcon;
  final String instituteWebsite;
  final String dateOfRegistration;
  final String instituteName;
  final String instituteCity;
  final int id;
  final String instituteCountry;
  final String institutePhone;
  final String instituteLogo;
  final String instituteTagLine;
  final String pointOfContact;
  final bool isDeleted;

  IntituteDetails(
      {required this.instituteAddress,
      required this.subscribersId,
      required this.instituteState,
      required this.institutePincode,
      required this.instituteEmail,
      required this.instituteFavIcon,
      required this.instituteWebsite,
      required this.dateOfRegistration,
      required this.instituteName,
      required this.instituteCity,
      required this.id,
      required this.instituteCountry,
      required this.institutePhone,
      required this.instituteLogo,
      required this.instituteTagLine,
      required this.pointOfContact,
      required this.isDeleted});

  factory IntituteDetails.fromJSON(Map<String, dynamic> json) {
    return IntituteDetails(
        instituteAddress: json['institute_address'],
        subscribersId: json['subscribers_id'],
        instituteState: json['institute_state'],
        institutePincode: json['institute_pincode'],
        instituteEmail: json['institute_email'],
        instituteFavIcon: json['institute_fav_icon'],
        instituteWebsite: json['institute_website'],
        dateOfRegistration: json['date_of_registration'],
        instituteName: json['institute_name'],
        instituteCity: json['institute_city'],
        id: json['id'],
        instituteCountry: json['institute_country'],
        institutePhone: json['institute_phone'],
        instituteLogo: json['institute_logo'],
        instituteTagLine: json['institute_tag_line'],
        pointOfContact: json['point_of_contact'],
        isDeleted: json['is_deleted']);
  }
}

class TransportDetails {
  final String vehicleNumber;
  final String transportName;
  final String registerDate;
  final int instituteId;
  final String vehicleDetails;
  final int transportId;
  final bool isDeleted;

  TransportDetails({
    required this.vehicleNumber,
    required this.transportName,
    required this.registerDate,
    required this.instituteId,
    required this.vehicleDetails,
    required this.transportId,
    required this.isDeleted,
  });

  factory TransportDetails.fromJson(Map<String, dynamic> json) {
    return TransportDetails(
      vehicleNumber: json['vehicle_number'],
      transportName: json['transport_name'],
      registerDate: json['register_date'],
      instituteId: json['institute_id'],
      vehicleDetails: json['vehicle_details'],
      transportId: json['transport_id'],
      isDeleted: json['is_deleted'],
    );
  }
}

class Assignment {
  final int id;
  final String assignmentDate;
  final String assignmentTitle;
  final String assignmentDueDate;
  final int classId;
  final int instituteId;
  final int sectionId;
  final String assignmentDetails;
  final bool isDeleted;

  Assignment({
    required this.id,
    required this.assignmentDate,
    required this.assignmentTitle,
    required this.assignmentDueDate,
    required this.classId,
    required this.instituteId,
    required this.sectionId,
    required this.assignmentDetails,
    required this.isDeleted,
  });

  factory Assignment.fromJson(Map<String, dynamic> json) {
    return Assignment(
      id: json['id'],
      assignmentDate: json['assignment_Date'],
      assignmentTitle: json['assignment_title'],
      assignmentDueDate: json['assignment_due_date'],
      classId: json['class_id'],
      instituteId: json['institute_id'],
      sectionId: json['section_id'],
      assignmentDetails: json['assignment_details'],
      isDeleted: json['is_deleted'],
    );
  }
}

// class Calender {
//   final int id;
//   final String day;
//   final String startTime;
//   final String endTime;
//   final Map subject;
//   final Map staffs;
//   final bool isDeleted;
//   Calender({
//     required this.id,
//     required this.day,
//     required this.startTime,
//     required this.endTime,
//     required this.subject,
//     required this.staffs,
//     required this.isDeleted,
//   });

//   factory Calender.fromJson(Map<dynamic, dynamic> json) {
//     return Calender(
//         day: json['day'],
//         startTime: json['start_time'],
//         endTime: json['end_time'],
//         subject: json['subjects'],
//         isDeleted: json['is_deleted'],
//         staffs: json['staffs'],
//         id: json['calender_id']);
//   }
// }

class ActivityDetails {
  final String activityDescription;
  final int activityID;
  final String activityName;
  final String activityLocation;
  final String instituteID;
  final String activityDate;

  final bool isDeleted;

  ActivityDetails(
      {required this.activityDescription,
      required this.activityName,
      required this.activityID,
      required this.instituteID,
      required this.activityDate,
      required this.activityLocation,
      required this.isDeleted});

  factory ActivityDetails.fromJSON(Map<String, dynamic> json) {
    return ActivityDetails(
        activityDescription: json['activity_description'],
        activityName: json['activity_name'],
        activityID: json['activity_id'],
        instituteID: json['institution_id'],
        activityLocation: json['activity_location'],
        activityDate: json['activity_date'],
        isDeleted: json['is_deleted']);
  }
}
