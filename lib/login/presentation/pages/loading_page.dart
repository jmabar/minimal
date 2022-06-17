import 'package:conda_app/login/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class LoginLoadingPage extends StatelessWidget {
  const LoginLoadingPage({Key? key}) : super(key: key);

  static Route route() => MaterialPageRoute(builder: (_) => const LoginLoadingPage());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            const LoginBackgroundDecoration(),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('minimal', style: Theme.of(context).textTheme.headline1),
                  const SizedBox(height: 30.0),
                  const CircularProgressIndicator(color: Colors.black),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
