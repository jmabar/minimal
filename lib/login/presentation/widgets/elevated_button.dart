import 'package:flutter/material.dart';

class MinimalElevatedButton extends StatelessWidget {
  final double height;
  final double width;
  final String buttonLabel;
  final VoidCallback onPressed;

  const MinimalElevatedButton({Key? key, required this.height, required this.width, required this.buttonLabel, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(shape: const StadiumBorder(), primary: Colors.black),
        child: Text(
          buttonLabel,
          style: const TextStyle(color: Colors.white, fontSize: 14.0),
        ),
      ),
    );
  }
}
