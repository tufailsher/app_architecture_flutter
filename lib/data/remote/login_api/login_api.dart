import 'package:custody_rx/base/base_network/api_end_points.dart';
import 'package:custody_rx/base/network/error_handler/error_handler.dart';
import 'package:custody_rx/base/network/exceptions.dart';
import 'package:custody_rx/base/network/remote_client/iApService.dart';
import 'package:custody_rx/base/usecases/usecase.dart';
import 'package:custody_rx/data/preference/i_pref_helper.dart';
import 'package:custody_rx/data/remote/login_api/i_login_api.dart';
import 'package:custody_rx/di.dart';
import 'package:custody_rx/models/user/login_user_model.dart';
import 'package:dio/dio.dart';


class LogInApi implements ILogInApi {
  LogInApi(IApiService api) {
    api.setIsTokenRequired(false);
    iPrefHelper = inject<IPrefHelper>();
    _dio = api.get();
  }

  late final IPrefHelper iPrefHelper;
  @override
  Future<LoginUserModel> login(Map<String, dynamic> map) async {
// final _auth = _dio.options.headers.remove('Authorization');

    try {
      final res = await _dio.post(ApiEndPoints.login,
          data: map,
          options: Options(contentType: Headers.formUrlEncodedContentType));

      // Map<String, dynamic> userData = res.data;
      // Map<String, dynamic> modifiedData = {
      //   "data": userData,
      // };
      // final userProfile = LoginUserModel.fromJson(modifiedData);
      final user = LoginUserModel.fromJson(res.data);
      iPrefHelper.saveUser(user);
      return user;
    } on DioException catch (e) {
      final exception = getException(e);
      throw exception;
    } catch (e) {
      throw ResponseException(msg: e.toString());
    }
  }

  late Dio _dio;

  @override
  Future<NoParams> forgotPassword(String email) async {
    try {
      await _dio.post('/auth/forgot-password',
          data: {'email': email},
          options: Options(contentType: Headers.formUrlEncodedContentType));

      // prefs.saveToken(res.data['data']['tokens']['access'])
      return NoParams();
    } on DioException catch (e) {
      final exception = getException(e);
      throw exception;
    } catch (e) {
      throw ResponseException(msg: e.toString());
    }
  }

  // @override
  // Future<LoginUserModel> verifyOtp(VerifyOTPEntity entity) async {
  //   try {
  //     final res = await _dio.post('/auth/verifyForgotOTP',
  //         data: entity.toJson(),
  //         options: Options(contentType: Headers.formUrlEncodedContentType));

  //     // prefs.saveToken(res.data['data']['tokens']['access'])
  //     return LoginUserModel.fromJson(res.data);
  //   } on DioException catch (e) {
  //     final exception = getException(e);
  //     throw exception;
  //   } catch (e) {
  //     throw ResponseException(msg: e.toString());
  //   }
  // }

  @override
  Future<LoginUserModel> changePassword(String email) async {
    try {
      final res = await _dio.post(
        '/auth/reset-password',
        data: {'password': email},
        // options: Options(contentType: Headers.formUrlEncodedContentType)
      );

      // prefs.saveToken(res.data['data']['tokens']['access'])
      return LoginUserModel.fromJson(res.data);
    } on DioException catch (e) {
      final exception = getException(e);
      throw exception;
    } catch (e) {
      throw ResponseException(msg: e.toString());
    }
  }
}
