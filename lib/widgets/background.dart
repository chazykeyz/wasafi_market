import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.black),
      child: (Stack(
        children: [
          Positioned(
              left: -300,
              bottom: -100,
              child: Container(
                height: 500,
                width: 500,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 10, color: const Color.fromARGB(67, 0, 58, 42)),
                    borderRadius: BorderRadius.circular(250)),
              )),
          Positioned(
              left: -550,
              bottom: -280,
              child: Container(
                height: 900,
                width: 900,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 60,
                        color: const Color.fromARGB(8, 255, 255, 255)),
                    borderRadius: BorderRadius.circular(450)),
              )),
        ],
      )),
    );
  }
}
