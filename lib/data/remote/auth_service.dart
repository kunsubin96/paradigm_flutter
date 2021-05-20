import 'dart:convert';
import 'package:paradigm_flutter/model/login_body.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:paradigm_flutter/app_configs.dart';
import 'package:paradigm_flutter/data/remote/api/api_helper.dart';
import 'package:paradigm_flutter/data/remote/api/end_point.dart';
import 'package:paradigm_flutter/data/remote/model/data_response.dart';

class AuthService {
  
  Future<DataResponse> login(LoginBody loginBody) async {
  
    Map<String, String> headers =  await ApiHelper.createDefaultHeaders();
    String body = loginBody.toJson();
    
    Response response = await http.post(Uri.parse(AppConfig.baseUrl + EndPoint.login),
        headers: headers, body: body);
    print("login "+response.statusCode.toString());
    print("login "+response.body);
    if (response.statusCode == 200) {
      return DataResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception("Cannot post in method login");
    }
  }


  // Future<AuthResponse> register(RegisterBody registerBody) async {
  //   String accessToken = await AuthorizationUtils.getAccountAccessToken();
  //   Map<String, String> headers =
  //       ApiHelper.createHeaderWithAuthorization(accessToken);
  //   String body = registerBody.toJson();
  //   Response response = await http.post(Uri.parse(AppConfig.accountApi + Api.register),
  //       headers: headers, body: body);
  //   if (response.statusCode == 200) {
  //     return AuthResponse.fromJson(json.decode(response.body));
  //   } else {
  //     throw Exception("Cannot post in method register");
  //   }
  // }
  // Future<List<ResDigitalEvent>> searchRegisteredDigitalEvent(
  //     int userid,
  //     String name,
  //     String sortfield,
  //     String sorttype,
  //     int posstart,
  //     int numofrow) async {
  //   String accessToken = await AuthorizationUtils.getConferenceAccessToken();
  //   Map<String, String> headers =
  //       ApiHelper.createHeaderWithAuthorization(accessToken);
  //   var queryParameters = {
  //     "userid": "$userid",
  //     "name": "$name",
  //     "sortfield": "$sortfield",
  //     "sorttype": "$sorttype",
  //     "posstart": "$posstart",
  //     "numofrow": "$numofrow"
  //   };
  //   String queryString = Uri(queryParameters: queryParameters).query;
  //   Response response = await http.get(
  //       AppConfig.conferenceApi +
  //           Api.searchForRegisteredDigitalEvent +
  //           "?" +
  //           queryString,
  //       headers: headers);

  //   if (response.statusCode == 200) {
  //     var dataDecode = json.decode(response.body);
  //     Iterable iterable = dataDecode['digitalevents'];
  //     List<ResDigitalEvent> list = List<ResDigitalEvent>.from(
  //         iterable.map((i) => ResDigitalEvent.fromMap(i)));
  //     return list;
  //   } else {
  //     throw Exception("Cannot get in method searchRegisteredDigitalEvent");
  //   }
  // }
}
