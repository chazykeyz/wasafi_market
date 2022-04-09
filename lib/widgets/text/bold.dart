import 'package:flutter/material.dart';

class Bold extends StatelessWidget {
  const Bold({Key? key, required this.text, required this.size})
      : super(key: key);
  final String text;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: size,
          fontWeight: FontWeight.w900,
          color: const Color.fromARGB(255, 255, 255, 255)),
    );
  }
}
