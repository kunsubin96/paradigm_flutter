import 'package:intl/intl.dart';
import 'package:paradigm_flutter/data/cache/pref_key.dart';
import 'package:paradigm_flutter/data/cache/preferences_helper.dart';
class ApiHelper {
  //dateFormat patern default api result
  static DateFormat dateFormat= DateFormat("yyyy-MM-dd'T'HH:mm:ss", "en_US");
  static Future<Map<String, String>> createDefaultHeaders() async {
    String lang=await PreferencesHelper.getString(PrefKey.prefLanguage, "vi");
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'lang':'$lang',
    };
    return requestHeaders;
  }
  
  static Future<Map<String, String>> createHeaderWithAuthorization(String accessToken) async{
     String lang=await PreferencesHelper.getString(PrefKey.prefLanguage, "vi");
     Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'lang':'$lang',
      'Authorization': 'Bearer $accessToken'
    };
    return requestHeaders;
  }
  
  static DateTime parseDateTime(String input){
    return dateFormat.parse(input);
  }

}
