import 'package:gurukul/provider/daycountdunction.dart';

class ExaminationData {
  List<OldParentExams>? upcomingParentExam;
  List<OldParentExams>? oldParentExams;

  ExaminationData({this.upcomingParentExam, this.oldParentExams});

  ExaminationData.fromJson(Map<String, dynamic> json) {
    if (json['upcoming_parent_exam'] != null) {
      upcomingParentExam = <OldParentExams>[];
      json['upcoming_parent_exam'].forEach((v) {
        upcomingParentExam!.add(OldParentExams.fromJson(v));
      });
    }
    if (json['old_parent_exams'] != null) {
      oldParentExams = <OldParentExams>[];
      json['old_parent_exams'].forEach((v) {
        oldParentExams!.add(OldParentExams.fromJson(v));
      });
    }
  }
}

class OldParentExams {
  String? startDate;
  String? parentExamName;
  String? endDate;
  String? resultDate;
  int? classId;
  int? instituteId;
  bool? isDeleted;
  int? parentExamId;
  String? parentExamSlug;
  Classes? classes;
  int? remainday;

  OldParentExams(
      {this.startDate,
      this.parentExamName,
      this.endDate,
      this.resultDate,
      this.classId,
      this.instituteId,
      this.isDeleted,
      this.parentExamId,
      this.remainday,
      this.parentExamSlug,
      this.classes});

  OldParentExams.fromJson(Map<String, dynamic> json) {
    remainday = dayremain(startDateString: json['start_date']);
    startDate = json['start_date'];
    parentExamName = json['parent_exam_name'];
    endDate = json['end_date'];
    resultDate = json['result_date'];
    classId = json['class_id'];
    instituteId = json['institute_id'];
    isDeleted = json['is_deleted'];
    parentExamId = json['parent_exam_id'];
    parentExamSlug = json['parent_exam_slug'];
    classes =
        json['classes'] != null ? Classes.fromJson(json['classes']) : null;
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

//subject model
class SubjectModel {
  int? statusCode;
  String? msg;
  List<Response>? response;

  SubjectModel({this.statusCode, this.msg, this.response});

  SubjectModel.fromJson(Map<String, dynamic> json) {
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
  int? examId;
  int? parentExamId;
  int? fullMarks;
  bool? isDeleted;
  int? subjectId;
  Subject? subject;
  ParentExam? parentExam;

  Response(
      {this.examId,
      this.parentExamId,
      this.fullMarks,
      this.isDeleted,
      this.subjectId,
      this.subject,
      this.parentExam});

  Response.fromJson(Map<String, dynamic> json) {
    examId = json['exam_id'];
    parentExamId = json['parent_exam_id'];
    fullMarks = json['full_marks'];
    isDeleted = json['is_deleted'];
    subjectId = json['subject_id'];
    subject =
        json['subject'] != null ? Subject.fromJson(json['subject']) : null;
    parentExam = json['parent_exam'] != null
        ? ParentExam.fromJson(json['parent_exam'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['exam_id'] = examId;
    data['parent_exam_id'] = parentExamId;
    data['full_marks'] = fullMarks;
    data['is_deleted'] = isDeleted;
    data['subject_id'] = subjectId;
    if (subject != null) {
      data['subject'] = subject!.toJson();
    }
    if (parentExam != null) {
      data['parent_exam'] = parentExam!.toJson();
    }
    return data;
  }
}

class Subject {
  String? subjectName;
  int? subjectId;

  Subject({this.subjectName, this.subjectId});

  Subject.fromJson(Map<String, dynamic> json) {
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

class ParentExam {
  int? parentExamId;
  String? parentExamName;

  ParentExam({this.parentExamId, this.parentExamName});

  ParentExam.fromJson(Map<String, dynamic> json) {
    parentExamId = json['parent_exam_id'];
    parentExamName = json['parent_exam_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['parent_exam_id'] = parentExamId;
    data['parent_exam_name'] = parentExamName;
    return data;
  }
}
