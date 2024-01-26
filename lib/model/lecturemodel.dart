class LectureModel {
  int? statusCode;
  String? msg;
  List<Response>? response;

  LectureModel({this.statusCode, this.msg, this.response});

  LectureModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    msg = json['msg'];
    if (json['response'] != null) {
      response = <Response>[];
      json['response'].forEach((v) {
        response!.add(Response.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status_code'] = statusCode;
    data['msg'] = msg;
    if (response != null) {
      data['response'] = response!.map((v) => v.toJson()).toList();
    }
    return data;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['institute_id'] = instituteId;
    data['class_id'] = classId;
    data['section_id'] = sectionId;
    data['start_time'] = startTime;
    data['calender_id'] = calenderId;
    data['subject_id'] = subjectId;
    data['staff_id'] = staffId;
    data['is_deleted'] = isDeleted;
    data['day'] = day;
    data['end_time'] = endTime;
    if (sections != null) {
      data['sections'] = sections!.toJson();
    }
    if (subjects != null) {
      data['subjects'] = subjects!.toJson();
    }
    if (staffs != null) {
      data['staffs'] = staffs!.toJson();
    }
    if (classes != null) {
      data['classes'] = classes!.toJson();
    }
    return data;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['section_name'] = sectionName;
    data['section_id'] = sectionId;
    return data;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['subject_name'] = subjectName;
    data['subject_id'] = subjectId;
    return data;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['staff_id'] = staffId;
    data['staff_name'] = staffName;
    return data;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['class_id'] = classId;
    data['class_name'] = className;
    return data;
  }
}
