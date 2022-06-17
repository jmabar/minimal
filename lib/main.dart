import 'package:conda_app/login/data/repositories/auth_repository.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:conda_app/util/themes.dart';

import 'login/business_logic/auth_bloc.dart';
import 'login/presentation/pages/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: MinimalTheme.theme,
      home: BlocProvider(
        create: (context) => AuthenticationBloc(AuthenticationRepository()),
        child: const HomePage(),
      ),
    );
  }
}
