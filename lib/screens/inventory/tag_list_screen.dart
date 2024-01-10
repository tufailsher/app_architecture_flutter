import 'package:custody_rx/app/app_strings.dart';
import 'package:custody_rx/app/app_theme.dart';
import 'package:flutter/material.dart';

class TagListScreen extends StatelessWidget {
  const TagListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.tagList),
      ),
      body: Column(
        children: [
          _headerSection(context),
          const SizedBox(height: 10),
          Expanded(child: _body(context)),
        ],
      ),
      );
  }

  Widget _headerSection(BuildContext context) {
    return Container(
      padding:  EdgeInsets.all(MediaQuery.of(context).size.height*.01),
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
          SizedBox(width: 100,)
        ],
      ),
    );
  }

  Widget _body(BuildContext context) {
    return  ColoredBox(
      color: AppColors.white,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        itemCount: 12,
        itemBuilder: (context,index) {
          return const TagListCard();
        },
        separatorBuilder: (context, index) => const SizedBox(height: 10),
      ),
    );
  }
}

class TagListCard extends StatelessWidget {
  const TagListCard({
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
            topRight: Radius.circular(7),
            bottomRight: Radius.circular(7)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
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
                      style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Color(0xFFE433BA)),
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
    );
  }
}
