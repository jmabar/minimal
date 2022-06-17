import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/auth_bloc.dart';
import '../widgets/widgets.dart';

class LoginPage extends StatelessWidget {
  final String errorMessage;
  final String email;
  final String password;
  final bool isShowingEmail;
  final bool isShowingPassword;
  const LoginPage(
      {Key? key, required this.isShowingEmail, required this.isShowingPassword, required this.email, required this.password, required this.errorMessage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            const LoginBackgroundDecoration(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(height: 145.0),
                  Text('minimal', style: Theme.of(context).textTheme.headline1),
                  const SizedBox(height: 60.0),
                  Text('LOG IN', style: Theme.of(context).textTheme.headline5),
                  const SizedBox(height: 15.0),
                  errorMessage != "" ? Text(errorMessage, style: const TextStyle(color: Colors.red)) : Container(),
                  const SizedBox(height: 15),
                  _EmailInput(isShowingEmail: isShowingEmail, email: email),
                  _PasswordInput(isShowingPassword: isShowingPassword, password: password),
                  const SizedBox(height: 50),
                  MinimalElevatedButton(
                      height: 50,
                      width: 300,
                      buttonLabel: 'LOG IN',
                      onPressed: () => context.read<AuthenticationBloc>().add(OnLoginSubmitted(email: email, password: password))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  final bool isShowingEmail;
  final String email;

  const _EmailInput({Key? key, required this.isShowingEmail, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: email,
      obscureText: !isShowingEmail,
      onChanged: (value) => context.read<AuthenticationBloc>().add(OnEmailChanged(value)),
      decoration: InputDecoration(
        labelText: 'Email',
        suffixIcon: IconButton(
          icon: isShowingEmail ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
          onPressed: () => context.read<AuthenticationBloc>().add(
                OnChangeEmailVisibility(!isShowingEmail),
              ),
        ),
      ),
    );
  }
}

class _PasswordInput extends StatelessWidget {
  final bool isShowingPassword;
  final String password;
  const _PasswordInput({Key? key, required this.isShowingPassword, required this.password}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: password,
      obscureText: !isShowingPassword,
      onChanged: (value) => context.read<AuthenticationBloc>().add(OnPasswordChange(value)),
      decoration: InputDecoration(
        labelText: 'Password',
        suffixIcon: IconButton(
          icon: isShowingPassword ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
          onPressed: () => context.read<AuthenticationBloc>().add(
                OnChangePasswordVisibility(!isShowingPassword),
              ),
        ),
      ),
    );
  }
}
