import 'dart:async';

import 'package:custody_rx/app/app_theme.dart';
import 'package:custody_rx/app/common/logger.dart';
import 'package:custody_rx/app/core_config.dart' as config;
import 'package:custody_rx/app/navigation_service.dart';
import 'package:custody_rx/base/enums.dart';
import 'package:custody_rx/bloc/auth_bloc/auth_bloc.dart';
import 'package:custody_rx/bloc/inventory_bloc/inventory_bloc.dart';
import 'package:custody_rx/controllers/navigation_controllers/navigation_controller.dart';
import 'package:custody_rx/screens/auth/login_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await config.initMainServiceLocator(Environment.DEV);
    const routes = NavigationController.onGenerateRoute;
    const root = CustodyRx(route: routes, environment: Environment.DEV);
    runApp(root);
  }, (error, stackTrace) async {
    d('ZonedGuardedError:  ${error.toString()} $stackTrace');
  });
}

class CustodyRx extends StatelessWidget {
  final RouteFactory route;
  final Environment environment;
  const CustodyRx({super.key, required this.route, required this.environment});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      // navigatorKey: NavigationService.navigatorKey,
      title: 'Custody RX',
      theme: AppTheme.getThemeData(),
      // onGenerateRoute: NavigationController.onGenerateRoute,
      // onUnknownRoute: NavigationController.onUnknownRoute,
      home: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(create: (_) => AuthBloc()),
          BlocProvider<InventoryBloc>(create: (_) => InventoryBloc()),
        ],
        child: const NavigationWrapper(),
      ),
    );
  }
}

class NavigationWrapper extends StatelessWidget {
  const NavigationWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: NavigationService.navigatorKey,
      onUnknownRoute: NavigationController.onUnknownRoute,
      onGenerateRoute: (settings) =>
          NavigationController.onGenerateRoute(settings),
    );
  }
}
