import 'package:custody_rx/base/usecases/usecase.dart';
import 'package:custody_rx/models/user/login_user_model.dart';

abstract class ILogInApi{
  Future<LoginUserModel> login(Map<String, dynamic> map);
  Future<NoParams> forgotPassword(String email);
  Future<LoginUserModel> changePassword(String email);
  // Future<LoginUserModel> verifyOtp(VerifyOTPEntity entity);
}