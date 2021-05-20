import 'dart:convert';

class LoginBody {
  String username;
  String password;
  LoginBody({
     this.username,
     this.password,
  });
  

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'password': password,
    };
  }

  factory LoginBody.fromMap(Map<String, dynamic> map) {
    return LoginBody(
      username: map['username'],
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginBody.fromJson(String source) => LoginBody.fromMap(json.decode(source));
}
