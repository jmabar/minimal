// To parse this JSON data, do
//
//     final deleteResponse = deleteResponseFromMap(jsonString);

import 'dart:convert';

import 'package:conda_app/contacts/data/models/contacts_errorr.dart';

class DeleteResponse {
  DeleteResponse({
    required this.success,
    required this.response,
    this.error,
  });

  final bool success;
  final bool response;
  final ContactsError? error;

  factory DeleteResponse.fromJson(String str) => DeleteResponse.fromMap(json.decode(str));

  factory DeleteResponse.fromMap(Map<String, dynamic> json) => DeleteResponse(
        success: json["success"],
        response: json["response"],
        error: json['error'] == null ? null : ContactsError.fromMap(json["error"]),
      );
}
