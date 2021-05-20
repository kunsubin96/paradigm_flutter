import 'dart:convert';

class User {
  int usid;
  String username;
  String password;
  String email;
  String phone;
  String address;
  int role;
  String avatar;
  int unitid;
  int positionid;
  User({
     this.usid,
     this.username,
     this.password,
     this.email,
     this.phone,
     this.address,
     this.role,
     this.avatar,
     this.unitid,
     this.positionid,
  });
  
  Map<String, dynamic> toMap() {
    return {
      'usid': usid,
      'username': username,
      'password': password,
      'email': email,
      'phone': phone,
      'address': address,
      'role': role,
      'avatar': avatar,
      'unitid': unitid,
      'positionid': positionid,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      usid: map['usid'],
      username: map['username'],
      password: map['password'],
      email: map['email'],
      phone: map['phone'],
      address: map['address'],
      role: map['role'],
      avatar: map['avatar'],
      unitid: map['unitid'],
      positionid: map['positionid'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
  
}
