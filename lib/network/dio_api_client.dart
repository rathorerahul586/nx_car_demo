import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:nx_car_demo/application/app_utils.dart';
import 'package:nx_car_demo/network/api_constants.dart';
import 'package:nx_car_demo/screens/login_screen/models/signup_request_model.dart';
import 'package:nx_car_demo/screens/otp_screen/models/otp_verification_model.dart';
import 'package:nx_car_demo/screens/otp_screen/models/otp_verification_request_model.dart';

import '../screens/login_screen/models/signup_response_model.dart';

class DioApiClient {
  final Dio _dio;

  DioApiClient(this._dio) {
    _dio.interceptors
        .add(LogInterceptor(requestBody: true, responseBody: true));
    _dio.options.baseUrl = AppUtils.buildType == BuildTypes.stage
        ? APIConstants.baseStateUrl
        : APIConstants.baseProdUrl;
  }

  Future<SignupResponseModel> login(SignupRequestModel requestModel) async {
    final response =
        await _dio.post(APIConstants.signUp, data: requestModel.toJson());


    return SignupResponseModel.fromJson(response.data);
  }

  Future<OTPVerificationModel> otpVerification(
    OTPVerificationRequestModel requestModel,
  ) async {
    final response = await _dio.post(APIConstants.otpverification,
        data: requestModel.toJson());

    return OTPVerificationModel.fromJson(response.data);
  }
}
