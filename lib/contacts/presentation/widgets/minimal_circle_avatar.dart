import 'package:flutter/material.dart';

class MinimalCircleAvatar extends StatefulWidget {
  const MinimalCircleAvatar({Key? key}) : super(key: key);

  @override
  State<MinimalCircleAvatar> createState() => _MinimalCircleAvatarState();
}

class _MinimalCircleAvatarState extends State<MinimalCircleAvatar> {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 76.0,
      backgroundColor: Colors.white70,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.image, color: Colors.grey),
          Text('Upload Image', style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
