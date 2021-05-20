
import 'package:paradigm_flutter/model/login_body.dart';
import 'package:paradigm_flutter/data/remote/auth_service.dart';
import 'package:paradigm_flutter/data/remote/model/data_response.dart';

class AuthRepository {
  static final AuthRepository _instance = AuthRepository._internal();
  AuthRepository._internal();
  static AuthRepository getInstance() {
    return _instance;
  }
  //remote vs local

  final authService = AuthService();

  Future<DataResponse> login(LoginBody loginBody) async {
    return authService.login(loginBody);
  }

  // Future<AuthResponse> register(RegisterBody registerBody) async {
  //   return authService.register(registerBody);
  // }
}