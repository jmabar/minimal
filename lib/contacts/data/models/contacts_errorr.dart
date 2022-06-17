import 'dart:convert';

class ContactsError {
  final int code;
  final String message;

  ContactsError({required this.code, required this.message});

  factory ContactsError.fromJson(String str) => ContactsError.fromMap(json.decode(str));

  factory ContactsError.fromMap(Map<String, dynamic> json) => ContactsError(
        code: json["code"],
        message: json["message"],
      );
}
