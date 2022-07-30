import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wasafi_market/widgets/text/regular.dart';

class MainLoader extends StatelessWidget {
  const MainLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          CupertinoActivityIndicator(color: Colors.blueAccent),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Regular(
              text: "LOADING",
              size: 13,
              color: Colors.blueAccent,
            ),
          )
        ],
      ),
    );
  }
}
