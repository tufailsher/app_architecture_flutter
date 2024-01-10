import 'package:custody_rx/app/app_routes.dart';
import 'package:custody_rx/app/app_strings.dart';
import 'package:custody_rx/app/app_theme.dart';
import 'package:custody_rx/app/navigation_service.dart';
import 'package:custody_rx/bloc/inventory_bloc/inventory_bloc.dart';
import 'package:custody_rx/bloc/inventory_bloc/inventory_events.dart';
import 'package:custody_rx/bloc/inventory_bloc/inventory_states.dart';
import 'package:custody_rx/domain/entities/inventory/inventory_entity.dart';
import 'package:custody_rx/screens/dashboard/mixin_dashboard.dart';
import 'package:custody_rx/utils/custom_overlay/custom_dialogues.dart';
import 'package:custody_rx/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class DashboardScreen extends StatelessWidget with MixinDasboard {
  DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Text(AppStrings.itemsInsight),
            Text(
              '\u00AE',
              style: TextStyle(fontSize: 20, color: AppColors.white),
            ),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () {
              LogoutDialog.show(context);
            },
            child: const Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.login,
                    color: AppColors.white,
                  ),
                  onPressed: null,
                ),
                Text(
                  AppStrings.logout,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return BlocConsumer<InventoryBloc, InventoryState>(
        listener: (context, state) {},
        builder: (context, state) {
          return SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        ListTile(
                            horizontalTitleGap: 30,
                            visualDensity:
                                VisualDensity.adaptivePlatformDensity,
                            leading: const Icon(Icons.inventory, size: 25),
                            title: const Text(AppStrings.inventory),
                            enabled: true,
                            onTap: () {
                              NavigationService.navigateTo(
                                  AppRoutes.inventoryTypeScreen);
                            },
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                            )),
                        const SizedBox(height: 8),
                        ListTile(
                            horizontalTitleGap: 30,
                            visualDensity:
                                VisualDensity.adaptivePlatformDensity,
                            leading: const Icon(Icons.checklist, size: 25),
                            title: const Text(AppStrings.checklist),
                            enabled: false,
                            onTap: () {
                              // Handle Checklist tap
                            },
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                            )),
                        const SizedBox(height: 8),
                        ListTile(
                            horizontalTitleGap: 30,
                            visualDensity:
                                VisualDensity.adaptivePlatformDensity,
                            leading: const Icon(Icons.transfer_within_a_station,
                                size: 25),
                            title: const Text(AppStrings.transfers),
                            enabled: false,
                            onTap: () {
                              // Handle Transfers tap
                            },
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                            )),
                        const SizedBox(height: 100),
                        ListTile(
                            horizontalTitleGap: 30,
                            visualDensity:
                                VisualDensity.adaptivePlatformDensity,
                            leading: const Icon(Icons.sync, size: 25),
                            title: const Text(AppStrings.sync),
                            enabled: true,
                            onTap: () {
                              BlocProvider.of<InventoryBloc>(context).add(
                                  InventoryFetchDataEvent(
                                      InventoryEntity().toJson()));
                            },
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                            )),
                        const SizedBox(height: 100),
                      ],
                    ),
                  ),
                ),
                if (state is InventoryPageLoading) ...[
                  Positioned.fill(
                    child: Container(
                      color: AppColors.lightGrey.withOpacity(0.5),
                      alignment: Alignment.center,
                      child: const CircularProgressIndicator(),
                    ),
                  )
                ]
              ],
            ),
          );
        });
  }
}
