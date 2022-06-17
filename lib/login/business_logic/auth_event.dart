part of 'auth_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class OnChangeEmailVisibility extends AuthenticationEvent {
  final bool showEmail;
  const OnChangeEmailVisibility(this.showEmail);
}

class OnChangePasswordVisibility extends AuthenticationEvent {
  final bool showEmail;
  const OnChangePasswordVisibility(this.showEmail);
}

class OnEmailChanged extends AuthenticationEvent {
  final String email;
  const OnEmailChanged(this.email);
}

class OnPasswordChange extends AuthenticationEvent {
  final String password;
  const OnPasswordChange(this.password);
}

class OnLoginSubmitted extends AuthenticationEvent {
  final String email;
  final String password;
  const OnLoginSubmitted({required this.email, required this.password});
}
