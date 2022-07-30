import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasafi_market/widgets/text/bold.dart';
import 'package:wasafi_market/widgets/text/gradient_text.dart';
import 'package:wasafi_market/widgets/text/regular.dart';

class TextTile extends StatelessWidget {
  const TextTile({
    Key? key,
    required this.title,
    required this.more,
    required this.isGradient,
  }) : super(key: key);
  final String title;
  final Widget more;
  final bool isGradient;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
              padding: const EdgeInsets.only(left: 15),
              child: isGradient == true
                  ? GradientText(
                      title,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w900),
                      gradient: const LinearGradient(colors: [
                        Color.fromARGB(255, 229, 83, 54),
                        Color.fromARGB(255, 106, 3, 196),
                      ]),
                    )
                  : Bold(
                      text: title,
                      size: 18,
                    )),
          GestureDetector(
            onTap: () {
              Get.to(() => more);
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 15),
              child: Regular(
                text: "See All ",
                color: Colors.blue,
                size: 14,
              ),
            ),
          )
        ],
      ),
    );
  }
}
