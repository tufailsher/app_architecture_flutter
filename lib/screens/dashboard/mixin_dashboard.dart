import 'package:custody_rx/utils/custom_overlay/custom_overlay.dart';
import 'package:flutter/widgets.dart';

mixin MixinDasboard {
  FullScreenLoader overlay = FullScreenLoader();

  void onTap(BuildContext context) {
    overlay.show(context);
    Future.delayed(const Duration(seconds: 2), () {
      overlay.hide();
    });
  }
}
