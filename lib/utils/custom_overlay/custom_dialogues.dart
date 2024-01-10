import 'package:custody_rx/app/app_theme.dart';
import 'package:custody_rx/app/navigation_service.dart';
import 'package:custody_rx/data/jwt_access_token.dart';
import 'package:custody_rx/data/preference/i_pref_helper.dart';
import 'package:custody_rx/di.dart';
import 'package:flutter/material.dart';

class LogoutDialog {
  static Future<bool?> show(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure you want to log out?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // Cancel button pressed
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
              onPressed: () {
                LogoutUser.logout();
                Navigator.of(context).pop(false);
                NavigationService.popToLogin();
              },
              child: const Text('Logout'),
            ),
          ],
        );
      },
    );
  }
}

class LogoutUser {
  final pref = inject<IPrefHelper>();
  final secureToken = inject<JwtLocalAccessToken>();

  LogoutUser.logout() {
    pref.removeToken();
    pref.removeUser();
    secureToken.deleteToken();
  }
}
