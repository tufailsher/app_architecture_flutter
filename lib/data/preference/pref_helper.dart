import 'dart:convert';

import 'package:custody_rx/app/common/logger.dart';
import 'package:custody_rx/models/user/login_user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'i_pref_helper.dart';

class PrefHelper implements IPrefHelper {
  late final SharedPreferences _pref;

  PrefHelper(SharedPreferences preferences) : _pref = preferences;

  @override
  String? retrieveToken() {
    if (_pref.containsKey("userToken")) {
      return _pref.getString("userToken");
    } else {
      return null;
    }
  }

  @override
  void saveToken(value) {
    d("userToken => $value");
    _pref.setString("userToken", value);
  }

  @override
  String? rtmRetrieveToken() {
    if (_pref.containsKey("rtmToken")) {
      return _pref.getString("rtmToken");
    } else {
      return null;
    }
  }

  @override
  void rtmToken(value) {
    d("rtmToken => $value");
    _pref.setString("rtmToken", value);
  }



  @override
  String? getChatName() {
    if (_pref.containsKey("chatName")) {
      return _pref.getString("chatName");
    } else {
      return null;
    }
  }

  @override
  void setChatName(value) {
    d("chatName => $value");
    _pref.setString("chatName", value);
  }

  @override
  void clear() {
    _pref.clear();
  }

  @override
  SharedPreferences get() {
    return _pref;
  }

  @override
  void removeToken() {
    _pref.remove('userToken');
  }

  @override
  void removeUser() {
    _pref.remove('user_data');
  }

  @override
  LoginUserModel? retrieveUser() {
    try {
      if (_pref.containsKey("user_data")) {
        Map<String, dynamic> jsonData = json.decode(_pref.getString("user_data")!);
        d("RETERIVED USER $jsonData");

        return LoginUserModel.fromJson(jsonData);
      } else {
        return null;
      }
    } catch (e) {
      d(e);
      return null;
    }
  }

  @override
  void saveUser(res) {
    _pref.setString("user_data", json.encode(res.toJson()));
  }

  @override
  bool? getBool(String key) {
    if (_pref.containsKey(key)) {
      return _pref.getBool(key);
    }
    return null;
  }

  @override
  void saveBool(String key, bool value) {
    _pref.setBool(key, value);
  }

  @override
  Map<String, dynamic>? getJson(String key) {
    final data = _pref.getString(key);
    if (data != null) {
      return jsonDecode(data);
    }
    return null;
  }

  // @override
  // void saveJson(Map data, String key) {
  //   _pref.setString(key, jsonEncode(data));
  // }

  @override
  int? getInt(String key) {
    return _pref.getInt(key);
  }

  @override
  Future<void> setInt(String key, int value) async {
    await _pref.setInt(key, value);
  }


}
