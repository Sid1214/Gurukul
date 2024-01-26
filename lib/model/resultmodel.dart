class ResultModel {
  int? statusCode;
  String? msg;
  Response? response;

  ResultModel({this.statusCode, this.msg, this.response});

  ResultModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    msg = json['msg'];
    response =
        json['response'] != null ? Response.fromJson(json['response']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status_code'] = statusCode;
    data['msg'] = msg;
    if (response != null) {
      data['response'] = response!.toJson();
    }
    return data;
  }
}

class Response {
  int? resultEntryId;
  int? examId;
  Result? result;
  bool? isDeleted;
  int? studentId;
  Student? student;
  ParentExam? parentExam;

  Response(
      {this.resultEntryId,
      this.examId,
      this.result,
      this.isDeleted,
      this.studentId,
      this.student,
      this.parentExam});

  Response.fromJson(Map<String, dynamic> json) {
    resultEntryId = json['result_entry_id'];
    examId = json['exam_id'];
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
    isDeleted = json['is_deleted'];
    studentId = json['student_id'];
    student =
        json['student'] != null ? Student.fromJson(json['student']) : null;
    parentExam = json['parent_exam'] != null
        ? ParentExam.fromJson(json['parent_exam'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result_entry_id'] = resultEntryId;
    data['exam_id'] = examId;
    if (result != null) {
      data['result'] = result!.toJson();
    }
    data['is_deleted'] = isDeleted;
    data['student_id'] = studentId;
    if (student != null) {
      data['student'] = student!.toJson();
    }
    if (parentExam != null) {
      data['parent_exam'] = parentExam!.toJson();
    }
    return data;
  }
}

class Result {
  String? grade;
  List<Marks>? marks;
  String? percentage;
  int? totalFullMarks;
  int? totalObtainedMarks;

  Result(
      {this.grade,
      this.marks,
      this.percentage,
      this.totalFullMarks,
      this.totalObtainedMarks});

  Result.fromJson(Map<String, dynamic> json) {
    grade = json['grade'];
    if (json['marks'] != null) {
      marks = <Marks>[];
      json['marks'].forEach((v) {
        marks!.add(Marks.fromJson(v));
      });
    }
    percentage = json['percentage'];
    totalFullMarks = json['total_full_marks'];
    totalObtainedMarks = json['total_obtained_marks'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['grade'] = grade;
    if (marks != null) {
      data['marks'] = marks!.map((v) => v.toJson()).toList();
    }
    data['percentage'] = percentage;
    data['total_full_marks'] = totalFullMarks;
    data['total_obtained_marks'] = totalObtainedMarks;
    return data;
  }
}

class Marks {
  String? grade;
  int? fullMark;
  String? percentage;
  String? subjectName;
  int? obtainedMark;

  Marks(
      {this.grade,
      this.fullMark,
      this.percentage,
      this.subjectName,
      this.obtainedMark});

  Marks.fromJson(Map<String, dynamic> json) {
    grade = json['grade'];
    fullMark = json['full_mark'];
    percentage = json['percentage'];
    subjectName = json['subject_name'];
    obtainedMark = json['obtained_mark'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['grade'] = grade;
    data['full_mark'] = fullMark;
    data['percentage'] = percentage;
    data['subject_name'] = subjectName;
    data['obtained_mark'] = obtainedMark;
    return data;
  }
}

class Student {
  String? phoneNumber;
  int? sectionId;
  String? email;
  int? transportId;
  String? studentName;
  String? admissionDate;
  int? instituteId;
  String? gender;
  String? rollNumber;
  String? dateOfBirth;
  String? photo;
  String? bloodGroup;
  String? slug;
  int? classId;
  int? studentId;
  String? address;

  Student(
      {this.phoneNumber,
      this.sectionId,
      this.email,
      this.transportId,
      this.studentName,
      this.admissionDate,
      this.instituteId,
      this.gender,
      this.rollNumber,
      this.dateOfBirth,
      this.photo,
      this.bloodGroup,
      this.slug,
      this.classId,
      this.studentId,
      this.address});

  Student.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phone_number'];
    sectionId = json['section_id'];
    email = json['email'];
    transportId = json['transport_id'];
    studentName = json['student_name'];
    admissionDate = json['admission_date'];
    instituteId = json['institute_id'];
    gender = json['gender'];
    rollNumber = json['roll_number'];
    dateOfBirth = json['date_of_birth'];
    photo = json['photo'];
    bloodGroup = json['blood_group'];
    slug = json['slug'];
    classId = json['class_id'];
    studentId = json['student_id'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phone_number'] = phoneNumber;
    data['section_id'] = sectionId;
    data['email'] = email;
    data['transport_id'] = transportId;
    data['student_name'] = studentName;
    data['admission_date'] = admissionDate;
    data['institute_id'] = instituteId;
    data['gender'] = gender;
    data['roll_number'] = rollNumber;
    data['date_of_birth'] = dateOfBirth;
    data['photo'] = photo;
    data['blood_group'] = bloodGroup;
    data['slug'] = slug;
    data['class_id'] = classId;
    data['student_id'] = studentId;
    data['address'] = address;
    return data;
  }
}

class ParentExam {
  String? parentExamName;
  String? startDate;
  String? endDate;
  String? resultDate;
  int? classId;
  int? instituteId;
  bool? isDeleted;
  int? parentExamId;
  String? parentExamSlug;

  ParentExam(
      {this.parentExamName,
      this.startDate,
      this.endDate,
      this.resultDate,
      this.classId,
      this.instituteId,
      this.isDeleted,
      this.parentExamId,
      this.parentExamSlug});

  ParentExam.fromJson(Map<String, dynamic> json) {
    parentExamName = json['parent_exam_name'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    resultDate = json['result_date'];
    classId = json['class_id'];
    instituteId = json['institute_id'];
    isDeleted = json['is_deleted'];
    parentExamId = json['parent_exam_id'];
    parentExamSlug = json['parent_exam_slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['parent_exam_name'] = parentExamName;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['result_date'] = resultDate;
    data['class_id'] = classId;
    data['institute_id'] = instituteId;
    data['is_deleted'] = isDeleted;
    data['parent_exam_id'] = parentExamId;
    data['parent_exam_slug'] = parentExamSlug;
    return data;
  }
}
