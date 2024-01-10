import 'package:custody_rx/app/app_theme.dart';
import 'package:flutter/material.dart';

class CustodyLogo extends StatelessWidget {
  const CustodyLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 200,
      width: double.infinity,
      child: Wrap(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Custody".toUpperCase(),
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(color: Colors.white)),
          // Define a Container which background color is white and add text to it "RX" which color will be green
          Container(
            // alignment: Alignment.centerRight,
            margin: const EdgeInsets.only(left: 10,top: 6),
            padding: const EdgeInsets.symmetric(
                horizontal: 5), // Adjust padding as needed
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Text('RX',
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(color: AppColors.darkGreen, fontSize: 40)),
          )
        ],
      ),
    );
  }
}
