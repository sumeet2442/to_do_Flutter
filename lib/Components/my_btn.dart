import 'package:flutter/material.dart';

class MyBtn extends StatelessWidget {
  final String text;
  VoidCallback onTap;
  MyBtn({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      child: Text(
        text,
        style: TextStyle(color: Colors.black54),
      ),
      color: Theme.of(context).primaryColor,
    );
  }
}
