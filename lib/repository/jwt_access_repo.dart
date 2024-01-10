

import 'package:custody_rx/base/enums.dart';
import 'package:custody_rx/data/jwt_access_token.dart';
import 'package:custody_rx/data/jwt_remote_access_token.dart';

class JwtAccessRepo {
  JwtAccessRepo({required this.jwtLocalAccessToken, required this.jwtRemoteAccessToken});
  JwtLocalAccessToken jwtLocalAccessToken;
  JwtRemoteAccessToken jwtRemoteAccessToken;

  Future<String?> get loadAccessToken async {
    String? accessToken;

    accessToken = await jwtLocalAccessToken.getToken(SecureStorageKeys.accessToken);
    // String? refresh = await jwtLocalAccessToken.getToken(SecureStorageKeys.refreshToken);
    if (accessToken != null) {
      return accessToken;
    }
    // JwtTokensModel keycloakTokenResponse = await jwtRemoteAccessToken.getTokens(refresh);
    // accessToken = keycloakTokenResponse.access?.token;
    // final refreshToken = keycloakTokenResponse.refresh?.token;
  //   if (!JwtDecoding.tokenHasExpired(accessToken) && !JwtDecoding.tokenHasExpired(refreshToken)) {
  //     await Future.wait(
  //         [jwtLocalAccessToken.saveToken(SecureStorageKeys.accessToken, accessToken!), jwtLocalAccessToken.saveToken(SecureStorageKeys.refreshToken, refreshToken!)]);

  //     return accessToken;
  //   }
    return null;
  }
}