import 'package:custody_rx/app/app_routes.dart';
import 'package:custody_rx/app/app_strings.dart';
import 'package:custody_rx/app/app_theme.dart';
import 'package:custody_rx/app/navigation_service.dart';
import 'package:flutter/material.dart';

class EnterCommentsScreen extends StatelessWidget {
  const EnterCommentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.enterComments),
      ),
      body: Column(
        children: [
          _headerSection(context),
          const SizedBox(height: 10),
          Expanded(child: _body(context)),
        ],
      ),
      floatingActionButton: SizedBox(
        width: MediaQuery.of(context).size.width*.2,
        child: ElevatedButton(onPressed: (){
          NavigationService.navigateTo( AppRoutes.dashboardScreen);

        }, child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('Finish'),SizedBox(width: 2,), Icon(Icons.arrow_forward_sharp,color: AppColors.white,size: 18,)],))),
   
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
          SizedBox(height: 20,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Inventory Type',
                style: Theme.of(context).textTheme.labelSmall,
              ),
              Text(
                'Full Inventory',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: 20,),
              Text(
                'Total Quantity',
                style: Theme.of(context).textTheme.labelSmall,
              ),
              Text(
                '600',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Location',style: Theme.of(context).textTheme.labelSmall,),
              Text('---'),
              SizedBox(height: 20,),
              Text(
                'Date & Time',
                style: Theme.of(context).textTheme.labelSmall,
              ),
              Text(
                'Dec,09,2023 10:15 Am',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _body(BuildContext context) {
    return  ColoredBox(
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Comments'),
            SizedBox(height: 8,),
            TextField(
              decoration: InputDecoration(
                alignLabelWithHint: true,
                label: Text("Enter optional comments here...."),
              ),
              maxLines: 10,
              minLines: 10,
            ),
          ],
        ),
      )
    );
  }
}
