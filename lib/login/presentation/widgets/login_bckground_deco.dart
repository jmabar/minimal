import 'package:flutter/material.dart';

class LoginBackgroundDecoration extends StatelessWidget {
  const LoginBackgroundDecoration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                radius: .7,
                center: Alignment.topRight,
                colors: [
                  Colors.yellow,
                  Colors.white,
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Container(
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                radius: .4,
                center: Alignment.centerLeft,
                colors: [
                  Color.fromARGB(255, 246, 236, 146),
                  Colors.white,
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                radius: 1.05,
                center: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 236, 226, 137),
                  Colors.white,
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
