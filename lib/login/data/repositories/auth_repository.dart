import '../clients/auth_client.dart';
import '../models/user.dart';

class AuthenticationRepository {
  final AuthenticationClient _loginClient;

  AuthenticationRepository({AuthenticationClient? loginClient}) : _loginClient = loginClient ?? AuthenticationClient();

  Future<User> logIn(String email, String password) async {
    final loginResponse = await _loginClient.logIn(email, password);

    return User(
      id: loginResponse.response!.id,
      firstName: loginResponse.response!.firstname,
      lastName: loginResponse.response!.lastname,
      email: loginResponse.response!.email,
      tokenType: loginResponse.response!.tokenType,
      accessToken: loginResponse.response!.accessToken,
    );
  }
}
