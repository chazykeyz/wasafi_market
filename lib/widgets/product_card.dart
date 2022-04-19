import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasafi_market/screens/directed_screens/product_detail.dart';
import 'package:wasafi_market/widgets/text/bold.dart';
import 'package:wasafi_market/widgets/text/regular.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, required this.isFlash}) : super(key: key);
  final int isFlash;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => const ProductDetail());
      },
      child: Container(
        margin: const EdgeInsets.all(4),
        width: MediaQuery.of(context).size.width / 2 - 40,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                height: 150,
                child: Stack(children: [
                  ClipRRect(
                    child: Container(
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://images.pexels.com/photos/8386657/pexels-photo-8386657.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),
                              fit: BoxFit.cover)),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
                        child: Container(
                          color: const Color.fromARGB(47, 255, 255, 255),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Image.network(
                      "https://images.pexels.com/photos/8386657/pexels-photo-8386657.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
                      fit: BoxFit.fill,
                    ),
                  ),
                  isFlash != 0
                      ? Positioned(
                          top: 4,
                          left: 4,
                          child: Container(
                            height: 35,
                            width: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: Colors.red),
                            child: Center(
                                child: Regular(
                                    text: "$isFlash%",
                                    size: 14,
                                    color: Colors.white)),
                          ),
                        )
                      : Container()
                ]),
              ),
            ),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 6),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Bold(text: "Jean Rotten", size: 14),
                          Regular(
                            text: "Tsh 1000,000",
                            size: 13,
                            color: Colors.white,
                          )
                        ],
                      ),
                      GestureDetector(
                        child: const Icon(
                          CupertinoIcons.bookmark,
                          color: Colors.white,
                        ),
                        onTap: () {},
                      ),
                    ]))
          ],
        ),
      ),
    );
  }
}
