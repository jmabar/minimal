import 'package:http/http.dart' as http;

import '../models/auth_response.dart';

class AuthenticationRequestException implements Exception {
  final String errorMessage;

  AuthenticationRequestException({required this.errorMessage});
}

class AuthenticationClient {
  final String _baseUrl = 'agency-coda.uc.r.appspot.com';
  final http.Client _httpClient;

  AuthenticationClient({http.Client? httpClient}) : _httpClient = httpClient ?? http.Client();

  Future<AuthenticationResponse> logIn(String email, String password) async {
    final Map<String, String> queryParams = {
      'email': email,
      'password': password,
    };

    final Uri authRequest = Uri.https(_baseUrl, 'mia-auth/login', queryParams);

    final response = await _httpClient.post(authRequest);

    if (response.statusCode != 200) {
      throw AuthenticationRequestException(errorMessage: 'Unexpected error happened');
    }

    final AuthenticationResponse loginResponse = AuthenticationResponse.fromJson(response.body);

    if (loginResponse.error != null) {
      throw AuthenticationRequestException(errorMessage: loginResponse.error!.message);
    }

    return loginResponse;
  }
}
