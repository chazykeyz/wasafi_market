import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasafi_market/screens/product_detail.dart';
import 'package:wasafi_market/widgets/text/bold.dart';
import 'package:wasafi_market/widgets/text/regular.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key}) : super(key: key);

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
            Container(
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(children: [
                Positioned(
                    child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    width: double.infinity,
                    height: 150,
                    decoration: const BoxDecoration(
                        color: Colors.red,
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://images.pexels.com/photos/7679682/pexels-photo-7679682.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),
                            fit: BoxFit.cover)),
                  ),
                )),
                Center(
                  child: Image.network(
                    "https://images.pexels.com/photos/7679682/pexels-photo-7679682.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
                    fit: BoxFit.fill,
                  ),
                ),
              ]),
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
