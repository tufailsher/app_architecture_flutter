import 'package:custody_rx/app/app_routes.dart';
import 'package:custody_rx/screens/auth/login_screen.dart';
import 'package:custody_rx/screens/dashboard/dashboard_screen.dart';
import 'package:custody_rx/screens/inventory/enter_comments_screen.dart';
import 'package:custody_rx/screens/inventory/inventory_type_screen.dart';
import 'package:custody_rx/screens/inventory/perform_inventory_screen.dart';
import 'package:custody_rx/screens/inventory/select_inventory_location_screen.dart';
import 'package:custody_rx/screens/inventory/select_result_screen.dart';
import 'package:custody_rx/screens/inventory/tag_list_screen.dart';
import 'package:flutter/material.dart';

class NavigationController {
  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute<void>(
      settings: routeSettings,
      builder: (BuildContext context) {
        switch (routeSettings.name) {
          case AppRoutes.login:
            return const LoginScreen();
          case AppRoutes.dashboardScreen:
            return  DashboardScreen();
          case AppRoutes.inventoryTypeScreen:
            return  const InventoryTypeScreen();
          case AppRoutes.selectInventoryLocationScreen:
            return  const SelectInventoryLocationScreen();
          case AppRoutes.performInventoryScreen:
            return  const PerformInventoryScreen();
          case AppRoutes.tagListScreen:
            return  const TagListScreen();
          case AppRoutes.selectResultScreen:
            return  const SelectResultScreen();
          case AppRoutes.enterCommentsScreen:
            return  const EnterCommentsScreen();
          // case SampleItemDetailsView.routeName:
          //   return const SampleItemDetailsView();
          // case SampleItemListView.routeName:
          default:
            return const LoginScreen();
        }
      },
    );
  }

  static Route<dynamic> onUnknownRoute(RouteSettings routeSettings) {
    return MaterialPageRoute<void>(
      settings: routeSettings,
      builder: (BuildContext context) {
        return const NoRouteScreen(
          routeName: "Unknown route",
        );
      },
    );
  }
}

class NoRouteScreen extends StatelessWidget {
  final String routeName;

  const NoRouteScreen({Key? key, required this.routeName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('No Route Defined'),
      ),
      body: Center(
        child: Text(
          'No route defined with name: $routeName',
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
