// To parse this JSON data, do
//
//     final createResponse = createResponseFromMap(jsonString);

import 'dart:convert';

import 'package:conda_app/contacts/data/models/contacts_errorr.dart';

class CreateResponse {
  CreateResponse({
    required this.success,
    required this.response,
    this.error,
  });

  final bool success;
  final Response response;
  final ContactsError? error;

  factory CreateResponse.fromJson(String str) => CreateResponse.fromMap(json.decode(str));

  factory CreateResponse.fromMap(Map<String, dynamic> json) => CreateResponse(
        success: json["success"],
        response: Response.fromMap(json["response"]),
        error: json["error"] == null ? null : ContactsError.fromJson(json["error"]),
      );
}

class Response {
  Response({
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.address,
    required this.photo,
    required this.caption,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  final String firstname;
  final String lastname;
  final String email;
  final String address;
  final String photo;
  final String caption;
  final DateTime updatedAt;
  final DateTime createdAt;
  final int id;

  factory Response.fromJson(String str) => Response.fromMap(json.decode(str));

  factory Response.fromMap(Map<String, dynamic> json) => Response(
        firstname: json["firstname"],
        lastname: json["lastname"],
        email: json["email"],
        address: json["address"],
        photo: json["photo"],
        caption: json["caption"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
      );
}
