import 'package:custody_rx/app/app_routes.dart';
import 'package:custody_rx/app/app_strings.dart';
import 'package:custody_rx/app/app_theme.dart';
import 'package:custody_rx/app/navigation_service.dart';
import 'package:flutter/material.dart';

class SelectResultScreen extends StatelessWidget {
  const SelectResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.selectResults),
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
                NavigationService.navigateTo(AppRoutes.enterCommentsScreen);
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
            Icons.transgender,
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
          Row(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    alignment: Alignment.center,
                    backgroundColor: AppColors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )),
                onPressed: () {},
                child: Row(
                  children: [
                    const Icon(Icons.double_arrow, size: 15),
                    const SizedBox(width: 2),
                    Text(
                      AppStrings.all.toUpperCase(),
                      // style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 7,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    alignment: Alignment.center,
                    backgroundColor: AppColors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )),
                onPressed: null,
                child: Row(
                  children: [
                    const SizedBox(width: 2),
                    Text(
                      AppStrings.none.toUpperCase(),
                      // style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ],
          )
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
          return const CheckListCard();
        },
        separatorBuilder: (context, index) => const SizedBox(height: 10),
      ),
    );
  }
}

class CheckListCard extends StatelessWidget {
  const CheckListCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.grey.withOpacity(.3)),
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(7), bottomRight: Radius.circular(7)),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
                child: Checkbox(
                  value: false,
                  onChanged: (_) {},
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
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(color: Color(0xFFE433BA)),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Text(AppStrings.tagsBracket,
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
    );
  }
}
