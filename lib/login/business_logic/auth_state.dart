part of 'auth_bloc.dart';

enum AuthenticationStatus { unauthenticated, authenticanted, loading, error }

class AuthenticationState extends Equatable {
  final bool isShowingEmail;
  final bool isShowingPassword;
  final String email;
  final String password;
  final AuthenticationStatus status;
  final User user;
  final String errorMsg;

  const AuthenticationState(
      {required this.isShowingEmail,
      required this.isShowingPassword,
      required this.email,
      required this.password,
      required this.status,
      required this.user,
      required this.errorMsg});

  AuthenticationState copyWith({
    bool? isShowingEmail,
    bool? isShowingPassword,
    String? email,
    String? password,
    AuthenticationStatus? status,
    User? user,
    String? errorMsg,
  }) =>
      AuthenticationState(
        isShowingEmail: isShowingEmail ?? this.isShowingEmail,
        isShowingPassword: isShowingPassword ?? this.isShowingPassword,
        email: email ?? this.email,
        password: password ?? this.password,
        status: status ?? this.status,
        user: user ?? this.user,
        errorMsg: errorMsg ?? this.errorMsg,
      );

  @override
  List<Object> get props => [isShowingEmail, isShowingPassword, email, password, status, user, errorMsg];
}
