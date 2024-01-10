import 'package:custody_rx/app/app_strings.dart';
import 'package:flutter/material.dart';


class SelectInventoryLocationScreen extends StatelessWidget {
  const SelectInventoryLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.selectLocation),
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
                title: const Text(AppStrings.stockRoomMain),
                enabled: true,
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
              ),
              const SizedBox(height: 10,),
              ListTile(
                horizontalTitleGap: 30,
                visualDensity: VisualDensity.adaptivePlatformDensity,
                leading: const Icon(Icons.sync, size: 25),
                title: const Text(AppStrings.stockRoomA),
                enabled: true,
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
              ),
              const SizedBox(height: 10,),
              ListTile(
                horizontalTitleGap: 30,
                visualDensity: VisualDensity.adaptivePlatformDensity,
                leading: const Icon(Icons.sync, size: 25),
                title: const Text(AppStrings.stockRoomB),
                enabled: true,
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
              ),
              const SizedBox(height: 10,),
              ListTile(
                horizontalTitleGap: 30,
                visualDensity: VisualDensity.adaptivePlatformDensity,
                leading: const Icon(Icons.sync, size: 25),
                title: const Text(AppStrings.stockRoomC),
                enabled: true,
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
