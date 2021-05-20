import 'dart:convert';

class DataResponse {
  bool success;
  dynamic data;
  String message;
  dynamic error;
  
  DataResponse({
    this.success,
    this.data,
     this.message,
     this.error,
  });
  

  Map<String, dynamic> toMap() {
    return {
      'success': success,
      'data': data,
      'message': message,
      'error': error,
    };
  }

  factory DataResponse.fromMap(Map<String, dynamic> map) {
    return DataResponse(
      success: map['success'],
      data: map['data'],
      message: map['message'],
      error: map['error'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DataResponse.fromJson(String source) => DataResponse.fromMap(json.decode(source));
}
