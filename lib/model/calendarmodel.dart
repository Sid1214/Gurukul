class CalenderModel {
  int? statusCode;
  String? msg;
  List<Response>? response;

  CalenderModel({this.statusCode, this.msg, this.response});

  CalenderModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    msg = json['msg'];
    if (json['response'] != null) {
      response = <Response>[];
      json['response'].forEach((v) {
        response!.add(Response.fromJson(v));
      });
    }
  }
}

class Response {
  int? instituteId;
  int? classId;
  int? sectionId;
  String? startTime;
  int? calenderId;
  int? subjectId;
  int? staffId;
  bool? isDeleted;
  String? day;
  String? endTime;
  Sections? sections;
  Subjects? subjects;
  Staffs? staffs;
  Classes? classes;

  Response(
      {this.instituteId,
      this.classId,
      this.sectionId,
      this.startTime,
      this.calenderId,
      this.subjectId,
      this.staffId,
      this.isDeleted,
      this.day,
      this.endTime,
      this.sections,
      this.subjects,
      this.staffs,
      this.classes});

  Response.fromJson(Map<String, dynamic> json) {
    instituteId = json['institute_id'];
    classId = json['class_id'];
    sectionId = json['section_id'];
    startTime = json['start_time'];
    calenderId = json['calender_id'];
    subjectId = json['subject_id'];
    staffId = json['staff_id'];
    isDeleted = json['is_deleted'];
    day = json['day'];
    endTime = json['end_time'];
    sections =
        json['sections'] != null ? Sections.fromJson(json['sections']) : null;
    subjects =
        json['subjects'] != null ? Subjects.fromJson(json['subjects']) : null;
    staffs = json['staffs'] != null ? Staffs.fromJson(json['staffs']) : null;
    classes =
        json['classes'] != null ? Classes.fromJson(json['classes']) : null;
  }
}

class Sections {
  String? sectionName;
  int? sectionId;

  Sections({this.sectionName, this.sectionId});

  Sections.fromJson(Map<String, dynamic> json) {
    sectionName = json['section_name'];
    sectionId = json['section_id'];
  }
}

class Subjects {
  String? subjectName;
  int? subjectId;

  Subjects({this.subjectName, this.subjectId});

  Subjects.fromJson(Map<String, dynamic> json) {
    subjectName = json['subject_name'];
    subjectId = json['subject_id'];
  }
}

class Staffs {
  int? staffId;
  String? staffName;

  Staffs({this.staffId, this.staffName});

  Staffs.fromJson(Map<String, dynamic> json) {
    staffId = json['staff_id'];
    staffName = json['staff_name'];
  }
}

class Classes {
  int? classId;
  String? className;

  Classes({this.classId, this.className});

  Classes.fromJson(Map<String, dynamic> json) {
    classId = json['class_id'];
    className = json['class_name'];
  }
}
