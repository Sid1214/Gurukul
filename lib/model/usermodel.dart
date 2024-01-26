class UserModel {
  String? userEmail;
  String? userPhoneNumber;
  String? userRole;
  String? userPhotoUrl;
  int? instituteId;
  int? userId;
  String? userName;
  String? userPassword;
  bool? isDeleted;

  UserModel(
      {this.userEmail,
      this.userPhoneNumber,
      this.userRole,
      this.userPhotoUrl,
      this.instituteId,
      this.userId,
      this.userName,
      this.userPassword,
      this.isDeleted});

  UserModel.fromJson(Map<String, dynamic> json) {
    userEmail = json['user_email'];
    userPhoneNumber = json['user_phone_number'];
    userRole = json['user_role'];
    userPhotoUrl = json['user_photo_url'];
    instituteId = json['institute_id'];
    userId = json['user_id'];
    userName = json['user_name'];
    userPassword = json['user_password'];
    isDeleted = json['is_deleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_email'] = userEmail;
    data['user_phone_number'] = userPhoneNumber;
    data['user_role'] = userRole;
    data['user_photo_url'] = userPhotoUrl;
    data['institute_id'] = instituteId;
    data['user_id'] = userId;
    data['user_name'] = userName;
    data['user_password'] = userPassword;
    data['is_deleted'] = isDeleted;
    return data;
  }
}
