import 'package:dio/dio.dart';
import 'package:nx_car_demo/network/response_wrapper.dart';
import 'package:nx_car_demo/screens/login_screen/models/signup_request_model.dart';
import 'package:nx_car_demo/screens/login_screen/models/signup_response_model.dart';
import 'package:nx_car_demo/screens/otp_screen/models/otp_verification_model.dart';
import 'package:nx_car_demo/screens/otp_screen/models/otp_verification_request_model.dart';

import '../../network/dio_api_client.dart';

class LoginRepository {
  static LoginRepository? _instance;

  final DioApiClient _apiClient = DioApiClient(Dio());

  LoginRepository._();

  static LoginRepository get getInstance => _instance ??= LoginRepository._();

  Future<ResponseWrapper<SignupResponseModel>>? signUp(
    SignupRequestModel signupRequest,
  ) {
    return RequestHelper<SignupResponseModel>().apiRequest(
      _apiClient.login(signupRequest),
    );
  }

  Future<ResponseWrapper<OTPVerificationModel>>? otpVerification(
    OTPVerificationRequestModel otpRequest,
  ) {
    return RequestHelper<OTPVerificationModel>().apiRequest(
      _apiClient.otpVerification(otpRequest),
    );
  }
}
