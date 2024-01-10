import 'package:custody_rx/base/network/error_handler/error_handler.dart';
import 'package:custody_rx/base/network/failure/failure.dart';
import 'package:custody_rx/base/usecases/usecase.dart';
import 'package:custody_rx/data/remote/login_api/i_login_api.dart';
import 'package:custody_rx/models/user/login_user_model.dart';
import 'package:custody_rx/repository/auth_repo/i_logIn_repo.dart';
import 'package:dartz/dartz.dart';

class LogInRepo implements ILogInRepo {
  LogInRepo({required this.api});
  ILogInApi api;
  @override
  Future<Either<Failure, LoginUserModel>> login(Map<String, dynamic> map) async {
    try {
      final result = await api.login(map);

      return Right(result);
    } catch (error) {
      return Left(getFailure(error as Exception));
    }
  }

  @override
  Future<Either<Failure, NoParams>> forgotPassword(String email) async {
    try {
      final result = await api.forgotPassword(email);

      return Right(result);
    } catch (error) {
      return Left(getFailure(error as Exception));
    }
  }

  // @override
  // Future<Either<Failure, UserResponse>> verifyOtp(
  //     VerifyOTPEntity entity) async {
  //   try {
  //     final result = await api.verifyOtp(entity);

  //     return Right(result);
  //   } catch (error) {
  //     return Left(getFailure(error as Exception));
  //   }
  // }
  
  @override
  Future<Either<Failure, LoginUserModel>> changePassword(String password)async {
    try {
      final result = await api.changePassword(password);

      return Right(result);
    } catch (error) {
      return Left(getFailure(error as Exception));
    }
  }
}
