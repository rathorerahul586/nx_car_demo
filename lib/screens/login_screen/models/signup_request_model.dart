class SignupRequestModel {
  String? mobile;
  String? name;
  String? email;
  String? vehicleNo;
  String? pinCode;

  SignupRequestModel({
    this.mobile,
    this.name,
    this.email,
    this.vehicleNo,
    this.pinCode,
  });

  SignupRequestModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    email = json['email'];
    vehicleNo = json['vehicle_no'];
    pinCode = json['pincode'];
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json['mobile'] = mobile;
    json['name'] = name;
    json['email'] = email;
    json['vehicle_no'] = vehicleNo;
    json['pincode'] = pinCode;
    return json;
  }
}
