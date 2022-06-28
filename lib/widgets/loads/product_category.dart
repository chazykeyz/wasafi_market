import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CatergoryLoader extends StatelessWidget {
  const CatergoryLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.white30,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          Center(
            child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: const Color.fromARGB(41, 238, 237, 237),
                )),
          ),
          Container(
            constraints: const BoxConstraints(minWidth: 100),
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 8,
            ),
            margin: const EdgeInsets.only(top: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white10),
          )
        ]),
      ),
    );
  }
}
