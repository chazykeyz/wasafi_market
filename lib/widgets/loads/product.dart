import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProductLoader extends StatelessWidget {
  const ProductLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.white30,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 30, top: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            height: 30,
            width: 100,
            decoration: BoxDecoration(
                color: Colors.white10, borderRadius: BorderRadius.circular(10)),
          ),
          Row(
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
                  height: 140,
                  width: MediaQuery.of(context).size.width / 2 - 20,
                  decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(10)),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  height: 30,
                  width: MediaQuery.of(context).size.width / 2 - 50,
                  decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ]),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
                  height: 140,
                  width: MediaQuery.of(context).size.width / 2 - 20,
                  decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(10)),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  height: 30,
                  width: MediaQuery.of(context).size.width / 2 - 50,
                  decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ]),
            ],
          )
        ]),
      ),
    );
  }
}
