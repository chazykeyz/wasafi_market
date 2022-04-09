import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wasafi_market/widgets/text/bold.dart';
import 'package:wasafi_market/widgets/text/regular.dart';

class TextTile extends StatelessWidget {
  const TextTile({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Bold(
                text: title,
                size: 18,
              )),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Regular(
                text: "See More ",
                color: Colors.blue,
                size: 15,
              ),
              Icon(
                CupertinoIcons.chevron_right,
                color: Colors.blue,
                size: 20,
              )
            ],
          )
        ],
      ),
    );
  }
}
