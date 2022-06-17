import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:conda_app/contacts/data/repositories/contacts_repository.dart';
import '../../../contacts/business_logic/contacts_bloc.dart';
import '../../business_logic/auth_bloc.dart';
import '../../../contacts/presentation/pages/pages.dart';
import 'pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      buildWhen: (previous, current) =>
          previous.isShowingEmail != current.isShowingEmail ||
          previous.isShowingPassword != current.isShowingPassword ||
          previous.status != current.status ||
          previous.email != current.email ||
          previous.password != current.password ||
          previous.errorMsg != current.errorMsg,
      builder: (context, state) {
        switch (state.status) {
          case AuthenticationStatus.loading:
            return const LoginLoadingPage();
          case AuthenticationStatus.authenticanted:
            return BlocProvider(
              create: (context) => ContactsBloc(ContactsRepository(token: state.user.accessToken)),
              child: const ContactListPage(),
            );
          case AuthenticationStatus.error:
            return LoginPage(
                isShowingEmail: state.isShowingEmail,
                isShowingPassword: state.isShowingPassword,
                email: state.email,
                password: state.password,
                errorMessage: state.errorMsg);
          case AuthenticationStatus.unauthenticated:
            return LoginPage(
                isShowingEmail: state.isShowingEmail,
                isShowingPassword: state.isShowingPassword,
                email: state.email,
                password: state.password,
                errorMessage: state.errorMsg);
        }
      },
    );
  }
}
