class OTPVerificationRequestModel {
  String? mobile;
  String? otp;

  OTPVerificationRequestModel({
    this.mobile,
    this.otp,
  });

  OTPVerificationRequestModel.fromJson(Map<String, dynamic> json) {
    mobile = json['mobile'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json['mobile'] = mobile;
    json['otp'] = otp;
    return json;
  }
}
