class OTPVerificationModel {
  bool? status;
  int? id;
  String? mobile;
  String? message;
  String? accessToken;

  OTPVerificationModel({
    this.status,
    this.id,
    this.mobile,
    this.message,
    this.accessToken,
  });

  OTPVerificationModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    id = json['id'];
    mobile = json['mobile'];
    message = json['message'];
    accessToken = json['access_token'];
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json['status'] = status;
    json['id'] = id;
    json['mobile'] = mobile;
    json['message'] = message;
    json['access_token'] = accessToken;
    return json;
  }
}
