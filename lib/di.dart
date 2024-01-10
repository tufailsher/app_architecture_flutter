import 'package:custody_rx/base/base_network/base_api_service.dart';
import 'package:custody_rx/base/base_network/network_service_impl.dart';
import 'package:custody_rx/base/enums.dart';
import 'package:custody_rx/base/network/external_values/ExternalValues.dart';
import 'package:custody_rx/base/network/external_values/iExternalValue.dart';
import 'package:custody_rx/base/network/remote_client/api_service.dart';
import 'package:custody_rx/base/network/remote_client/iApService.dart';
import 'package:custody_rx/data/jwt_access_token.dart';
import 'package:custody_rx/data/jwt_remote_access_token.dart';
import 'package:custody_rx/data/preference/i_pref_helper.dart';
import 'package:custody_rx/data/preference/pref_helper.dart';
import 'package:custody_rx/data/remote/inventory/i_inventory_api.dart';
import 'package:custody_rx/data/remote/inventory/inventory_api.dart';
import 'package:custody_rx/data/remote/login_api/i_login_api.dart';
import 'package:custody_rx/data/remote/login_api/login_api.dart';
import 'package:custody_rx/repository/auth_repo/i_logIn_repo.dart';
import 'package:custody_rx/repository/auth_repo/login_repo.dart';
import 'package:custody_rx/repository/inventory_repo/i_inventory_repo.dart';
import 'package:custody_rx/repository/inventory_repo/inventory_repo.dart';
import 'package:custody_rx/repository/jwt_access_repo.dart';
import 'package:custody_rx/repository/movies_repo.dart';
import 'package:custody_rx/repository/movies_repo_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final inject = GetIt.instance;

Future<void> setupLocator(Environment environment) async{
  inject.registerSingleton<Environment>(environment);
  inject.registerSingletonAsync(() => SharedPreferences.getInstance());
  // inject.registerLazySingleton<IDb>(() => Db());
  inject.registerLazySingleton<IPrefHelper>(() => PrefHelper(inject()));
  inject.registerLazySingleton<IExternalValues>(() => ExternalValues());
  inject.registerLazySingleton<JwtLocalAccessToken>(() => JwtLocalAccessToken());
  inject.registerLazySingleton<JwtRemoteAccessToken>(() => JwtRemoteAccessToken(externalValues: ExternalValues()));
  inject.registerLazySingleton<JwtAccessRepo>(() => JwtAccessRepo(jwtLocalAccessToken: inject(), jwtRemoteAccessToken: inject()));
  inject.registerLazySingleton<IApiService>(() => ApiService.create(
        externalValues: ExternalValues(),
        jwtAccessRepo: inject(),
      ));

// Auth register

inject.registerLazySingleton<ILogInApi>(() => LogInApi(inject()));
inject.registerLazySingleton<ILogInRepo>(() => LogInRepo(api: inject()));

// Inventory register

inject.registerLazySingleton<IInventoryApi>(() => InventoryApi(inject()));
inject.registerLazySingleton<IInventoryRepo>(() => InventoryRepo(api: inject()));

  //
  inject.registerLazySingleton<BaseApiService>(() => NetworkApiServiceImpl());
  inject.registerLazySingleton<MovieRepo>(() => MovieRepoImp(apiService: inject()));
}