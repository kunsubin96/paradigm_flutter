

import 'package:paradigm_flutter/data/cache/pref_key.dart';
import 'package:paradigm_flutter/data/cache/preferences_helper.dart';
import 'package:paradigm_flutter/model/user.dart';

class UserPreferencesHelper {
  static Future<int> getUserId() async {
    return await PreferencesHelper.getInt(PrefKey.prefUserId, 0);
  }

  static void putUserId(int userId) {
    PreferencesHelper.putInt(PrefKey.prefUserId, userId);
  }

  static Future<String> getTokenKey() async {
    return await PreferencesHelper.getString(PrefKey.prefTokenKey, "");
  }

  static void putTokenKey(String tokenKey) {
    PreferencesHelper.putString(PrefKey.prefTokenKey, tokenKey);
  }

  static Future<User> getCurrentUser() async {
    String strUser =
        await PreferencesHelper.getString(PrefKey.prefCurrentUser, "");

    if (strUser.length == 0) {
      return null;
    }

    return User.fromJson(strUser);
  }

  static void putCurrentUser(User user) {
    PreferencesHelper.putString(
        PrefKey.prefCurrentUser, user == null ? "" : user.toJson());
  }

  static Future<bool> isLogin() async {
    // int userId = await getUserId();
    
    // if (userId == 0) {
    //   return false;
    // }
    // String tokenKey=await getTokenKey();
    // if(tokenKey.length==0){
    //   return false;
    // }

    // return true;
  }

  static void logOut() {
    // putUserId(0);
    // putTokenKey("");
    // putCurrentUser(null);
  }
  
}
