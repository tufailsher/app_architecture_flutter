import 'package:custody_rx/base/network/external_values/ExternalValues.dart';

class JwtRemoteAccessToken {
  JwtRemoteAccessToken({required this.externalValues});

  ExternalValues externalValues;

  // Future<JwtTokensModel> getTokens(String? oldRefreshToken) async {
  //   try {
  //     final res = await Dio(BaseOptions(
  //             baseUrl: externalValues.getBaseUrlv1(),
  //             receiveDataWhenStatusError: true,
  //             headers: {HttpHeaders.contentTypeHeader: "application/json"},
  //             connectTimeout: requestTimeOut,
  //             receiveTimeout:requestTimeOut,))
  //         .post('/auth/refresh-tokens',
  //             data: {'refreshToken': oldRefreshToken});
  //     return JwtTokensModel.fromJson(res.data);
  //   } on DioException catch (e) {
  //     d(e.response.toString());
  //     final exception = getException(e);
  //     throw exception;
  //   } catch (e) {
  //     throw ResponseException(msg: e.toString());
  //   }
  // }
}
