import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasafi_market/screens/directed_screens/product_detail.dart';
import 'package:wasafi_market/widgets/text/bold.dart';
import 'package:wasafi_market/widgets/text/regular.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, required this.isFlash, required this.data})
      : super(key: key);
  final int isFlash;
  final dynamic data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => ProductDetail(
              data: data,
            ));
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
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(data.thumbnail[0]),
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
                      data.thumbnail[0],
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
                                    text:
                                        "${int.parse(((data.discount / data.price) * 100.round()).toStringAsFixed(0))}%",
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
                        children: [
                          Bold(text: data.name, size: 14),
                          Row(
                            children: [
                              const Regular(
                                text: "Tsh ",
                                size: 13,
                                color: Colors.white,
                              ),
                              Regular(
                                text: data.price.toString(),
                                size: 13,
                                color: Colors.white,
                              )
                            ],
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
