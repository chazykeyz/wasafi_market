import 'package:flutter/material.dart';

class AvatarCircle extends StatelessWidget {
  const AvatarCircle(
      {Key? key,
      required this.width,
      required this.height,
      required this.thumbnail})
      : super(key: key);
  final double width;
  final double height;
  final String thumbnail;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(width / 2),
            color: const Color.fromARGB(31, 255, 255, 255),
            image: DecorationImage(
                image: NetworkImage(thumbnail), fit: BoxFit.cover)));
  }
}
