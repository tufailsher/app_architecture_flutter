import 'package:custody_rx/app/app_strings.dart';
import 'package:custody_rx/app/app_theme.dart';
import 'package:custody_rx/utils/custom_overlay/custom_dialogues.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.white,
      child: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 25),
            alignment: Alignment.centerLeft,
            decoration: const BoxDecoration(color: AppColors.primaryColor),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30,
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.blue,
                    )),
                const SizedBox(height: 10),
                Text("Name",
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(color: AppColors.white)),
                const SizedBox(height: 10),
                Text("Alfared@gmail.com",
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(color: AppColors.white)),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.dashboard),
            title: const Text(AppStrings.dashboard),
            onTap: () {
              // Handle Inventory tap
            },
          ),
          ListTile(
            leading: const Icon(Icons.inventory),
            title: const Text(AppStrings.inventory),
            onTap: () {
              // Handle Checklist tap
            },
          ),
          ListTile(
            enabled: false,
            leading: const Icon(Icons.checklist),
            title: const Text(AppStrings.checklist),
            onTap: () {
              // Handle Transfers tap
            },
          ),
          ListTile(
            enabled: false,
            leading: const Icon(Icons.transfer_within_a_station),
            title: const Text(AppStrings.transfers),
            onTap: () {
              // Handle Transfers tap
            },
          ),
          ExpansionTile(
            leading: const Icon(Icons.settings),
            title: const Text(AppStrings.settings),
            children: <Widget>[
              ListTile(
                title: const Text(AppStrings.general),
                onTap: () {
                  // Handle General tap
                },
              ),
              ListTile(
                title: const Text(AppStrings.scannerRFID),
                onTap: () {
                  // Handle Scanner/RFID tap
                },
              ),
            ],
          ),
          ListTile(
            leading: const Icon(Icons.sync),
            title: const Text(AppStrings.sync),
            onTap: () {
              // Handle Sync tap
            },
          ),
          ListTile(
            leading: const Icon(Icons.login),
            title: const Text(AppStrings.logout),
            onTap: () {
              // Handle Logout tap
              Navigator.pop(context);
             LogoutDialog.show(context);
            },
          ),
        ],
      ),
    );
  }
}
