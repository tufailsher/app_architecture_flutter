
import 'package:custody_rx/base/enums.dart';
import 'package:custody_rx/di.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;
int paginationPageSize = 20;

Future<void> initMainServiceLocator(Environment env) async {
  await setupLocator(env);
  return serviceLocator.allReady();
}