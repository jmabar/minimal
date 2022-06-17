import 'package:flutter/material.dart';

class ContactBackgroundDecoration extends StatelessWidget {
  const ContactBackgroundDecoration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                radius: .9,
                center: Alignment.topLeft,
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
                center: Alignment.centerRight,
                colors: [
                  Color.fromARGB(255, 246, 236, 146),
                  Colors.white,
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                radius: .8,
                center: Alignment.bottomRight,
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
