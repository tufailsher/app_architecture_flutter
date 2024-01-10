

import 'package:custody_rx/base/network/failure/failure.dart';
import 'package:custody_rx/base/usecases/usecase.dart';
import 'package:custody_rx/models/user/login_user_model.dart';
import 'package:dartz/dartz.dart';

abstract class ILogInRepo {
  Future<Either<Failure, LoginUserModel>> login(Map<String, dynamic> map);
  Future<Either<Failure, NoParams>> forgotPassword(String email);
  Future<Either<Failure, LoginUserModel>> changePassword(String email);
  // Future<Either<Failure, LoginUserModel>> verifyOtp(VerifyOTPEntity entity);
}