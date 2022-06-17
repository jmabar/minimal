// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromMap(jsonString);

import 'dart:convert';

class AuthenticationResponse {
  AuthenticationResponse({required this.success, required this.response, this.error});

  final bool success;
  final Response? response;
  final LoginError? error;

  factory AuthenticationResponse.fromJson(String str) => AuthenticationResponse.fromMap(json.decode(str));

  factory AuthenticationResponse.fromMap(Map<String, dynamic> json) => AuthenticationResponse(
        success: json["success"],
        response: json["response"] == null ? null : Response.fromMap(json["response"]),
        error: json['error'] == null ? null : LoginError.fromMap(json["error"]),
      );
}

class Response {
  Response({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.photo,
    required this.phone,
    required this.facebookId,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
    required this.isNotification,
    required this.caption,
    required this.tokenType,
    required this.accessToken,
  });

  final int id;
  final String firstname;
  final String lastname;
  final String email;
  final String photo;
  final String phone;
  final dynamic facebookId;
  final int role;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int status;
  final int isNotification;
  final dynamic caption;
  final String tokenType;
  final String accessToken;

  factory Response.fromJson(String str) => Response.fromMap(json.decode(str));

  factory Response.fromMap(Map<String, dynamic> json) => Response(
        id: json["id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        email: json["email"],
        photo: json["photo"],
        phone: json["phone"],
        facebookId: json["facebook_id"],
        role: json["role"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        status: json["status"],
        isNotification: json["is_notification"],
        caption: json["caption"],
        tokenType: json["token_type"],
        accessToken: json["access_token"],
      );
}

class LoginError {
  final int code;
  final String message;

  LoginError({required this.code, required this.message});

  factory LoginError.fromJson(String str) => LoginError.fromMap(json.decode(str));

  factory LoginError.fromMap(Map<String, dynamic> json) => LoginError(
        code: json["code"],
        message: json["message"],
      );
}
