class SignupResponseModel {
  bool? status;
  int? id;
  int? otp;
  String? message;

  SignupResponseModel({this.status, this.id, this.otp, this.message});

  SignupResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    id = json['id'];
    otp = json['otp'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json['status'] = status;
    json['id'] = id;
    json['otp'] = otp;
    json['message'] = message;
    return json;
  }
}
