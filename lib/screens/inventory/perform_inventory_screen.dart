import 'package:custody_rx/app/app_routes.dart';
import 'package:custody_rx/app/app_strings.dart';
import 'package:custody_rx/app/app_theme.dart';
import 'package:custody_rx/app/navigation_service.dart';
import 'package:flutter/material.dart';

class PerformInventoryScreen extends StatelessWidget {
  const PerformInventoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.performInventory),
      ),
      body: Column(
        children: [
          _headerSection(context),
          const SizedBox(height: 10),
          Expanded(child: _body(context)),
        ],
      ),
      floatingActionButton: SizedBox(
          width: MediaQuery.of(context).size.width * .2,
          child: ElevatedButton(
              onPressed: () {
                NavigationService.navigateTo(AppRoutes.tagListScreen);
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Next'),
                  SizedBox(
                    width: 2,
                  ),
                  Icon(
                    Icons.arrow_forward_sharp,
                    color: AppColors.white,
                    size: 18,
                  )
                ],
              ))),
    );
  }

  Widget _headerSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(MediaQuery.of(context).size.height * .01),
      color: AppColors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.inventory_sharp,
            size: 40,
            color: AppColors.lightBlue.withOpacity(.3),
          ),
          Column(
            children: [
              Text(
                '1000',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              Text(
                '14 tags',
                style: Theme.of(context).textTheme.labelSmall,
              )
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                alignment: Alignment.center,
                backgroundColor: AppColors.redDark,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                )),
            onPressed: () {},
            child: Row(
              children: [
                const Icon(Icons.sync, size: 15),
                const SizedBox(width: 2),
                Text(
                  AppStrings.refreshClear.toUpperCase(),
                  // style: const TextStyle(fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _body(BuildContext context) {
    return ColoredBox(
      color: AppColors.white,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        itemCount: 12,
        itemBuilder: (context, index) {
          return const PerformInventoryCard();
        },
        separatorBuilder: (context, index) => const SizedBox(height: 10),
      ),
    );
  }
}

class PerformInventoryCard extends StatelessWidget {
  const PerformInventoryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        NavigationService.navigateTo(AppRoutes.selectResultScreen);
      },
      child: Container(
        height: 60,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.grey.withOpacity(.3)),
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(7), bottomRight: Radius.circular(7)),
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 5,
                  color: AppColors.green,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  width: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.darkGreen.withOpacity(.3),
                  ),
                ),
                Expanded(
                  // width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Title',
                        style: Theme.of(context).textTheme.headlineMedium,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Text('subtitle',
                          style: Theme.of(context).textTheme.labelSmall),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  '300',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: AppColors.grey,
                size: 15,
              ),
              const SizedBox(width: 8)
            ],
          ),
        ]),
      ),
    );
  }
}
