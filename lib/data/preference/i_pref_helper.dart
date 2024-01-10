

import 'package:custody_rx/models/user/login_user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class IPrefHelper {
  String? retrieveToken();
  void saveToken(value);
  void removeToken();
  void saveBool(String key, bool value);
  bool?  getBool(String key);
  void saveUser(var user);
  LoginUserModel? retrieveUser();
  void removeUser();

  Future<void> setInt(String key,int value);
  int? getInt(String key);
  String? rtmRetrieveToken();
  void rtmToken(value);

  String? getChatName();
  void setChatName(value);

  SharedPreferences get();
  void clear();

  Map<String,dynamic>?  getJson(String key);
//  void saveJson(Map<dynamic,dynamic> data,String key);


  // setEMDRBlstSound(String sound);
  // String? getEMDRBlstSound();
  // setEMDRVisualSound(String sound);
  // String? getEMDRVisualSound();
  // setEMDRSleepSound(String sound);
  // String? getEMDRSleepSound();


}
