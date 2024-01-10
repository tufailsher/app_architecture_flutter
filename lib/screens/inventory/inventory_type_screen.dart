import 'package:custody_rx/app/app_routes.dart';
import 'package:custody_rx/app/app_strings.dart';
import 'package:custody_rx/app/navigation_service.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InventoryTypeScreen extends StatelessWidget {
  const InventoryTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.inventoryType),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ListTile(
                horizontalTitleGap: 30,
                visualDensity: VisualDensity.adaptivePlatformDensity,
                leading: const Icon(Icons.sync, size: 25),
                title: const Text(AppStrings.fullInventory),
                subtitle: const Text(AppStrings.fullInventoryDescription),
                enabled: true,
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
                onTap: () {
                  NavigationService.navigateTo(
                      AppRoutes.performInventoryScreen);
                },
              ),
              const SizedBox(
                height: 10,
              ),
              ListTile(
                horizontalTitleGap: 30,
                visualDensity: VisualDensity.adaptivePlatformDensity,
                leading: const Icon(Icons.sync, size: 25),
                title: const Text(AppStrings.locationInventory),
                subtitle: const Text(AppStrings.locationInventoryDescription),
                enabled: true,
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
                onTap: () {
                  NavigationService.navigateTo(
                      AppRoutes.selectInventoryLocationScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
