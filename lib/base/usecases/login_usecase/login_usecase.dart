import 'package:custody_rx/base/network/failure/failure.dart';
import 'package:custody_rx/base/usecases/usecase.dart';
import 'package:custody_rx/domain/entities/login_entity.dart';
import 'package:custody_rx/models/user/login_user_model.dart';
import 'package:custody_rx/repository/auth_repo/i_logIn_repo.dart';
import 'package:dartz/dartz.dart';

class LoginUserUseCase implements UseCase<LoginUserModel, LoginEntity> {
  LoginUserUseCase(this.repository);
  final ILogInRepo repository;

  @override
  Future<Either<Failure, LoginUserModel>> call(LoginEntity params) async {
    return repository.login(params.toJson());
  }
}
class ForgotUserUseCase implements UseCase<NoParams, String> {
  ForgotUserUseCase(this.repository);
  final ILogInRepo repository;

  @override
  Future<Either<Failure, NoParams>> call(String email) async {
    return repository.forgotPassword(email);
  }
}
// class VerifyOtpUseCase implements UseCase<LoginUserModel, VerifyOTPEntity> {
//   VerifyOtpUseCase(this.repository);
//   final ILogInRepo repository;

//   @override
//   Future<Either<Failure, UserResponse>> call(VerifyOTPEntity entity) async {
//     return repository.verifyOtp(entity);
//   }
// }
class UpdatePasswordUseCase implements UseCase<LoginUserModel, String> {
  UpdatePasswordUseCase(this.repository);
  final ILogInRepo repository;

  @override
  Future<Either<Failure, LoginUserModel>> call(String password) async {
    return repository.changePassword(password);
  }
}