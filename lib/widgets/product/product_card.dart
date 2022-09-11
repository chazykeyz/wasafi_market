import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasafi_market/controllers/user.dart';
import 'package:wasafi_market/models/user/user.dart';
import 'package:wasafi_market/screens/directed_screens/product/details.dart';
import 'package:wasafi_market/widgets/show_snackbar.dart';
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
              isWishList: false,
            ));
      },
      child: Container(
        margin: const EdgeInsets.all(4),
        width: MediaQuery.of(context).size.width / 2 - 10,
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
                                        "${int.parse(((100 - (data.discount / data.price) * 100.round())).toStringAsFixed(0))}%",
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
                      GetBuilder<UserController>(builder: (userContent) {
                        return userContent.userList.isEmpty
                            ? const SizedBox(
                                height: 0,
                              )
                            : GestureDetector(
                                onTap: () {
                                  List<String> newList = [];
                                  newList.add(data.id);
                                  FavoriteModel favoriteModel =
                                      FavoriteModel(favorite: newList);

                                  Get.find<UserController>()
                                      .updateUserInfo(favoriteModel)
                                      .then((status) {
                                    if (status.isSuccess) {
                                      userContent.userList[0].favorite
                                                  .where((item) =>
                                                      item.id == data.id)
                                                  .length ==
                                              0
                                          ? showCustomSnackBar(
                                              "${data.name} has been added to favorite List!",
                                              title: "Favorite List")
                                          : showCustomSnackBar(
                                              "${data.name} has been removed to favorite List!",
                                              title: "Favorite List");
                                      Get.find<UserController>().gettingUser();
                                    } else {
                                      showCustomSnackBar(
                                          "${data.name} failed to be added to favorite List!",
                                          title: "Favorite List");
                                    }
                                  });
                                },
                                child: Center(
                                  child: userContent.userList.isEmpty
                                      ? const SizedBox(
                                          height: 0,
                                        )
                                      : Icon(
                                          userContent.userList[0].favorite
                                                      .where((item) =>
                                                          item.id == data.id)
                                                      .length ==
                                                  0
                                              ? CupertinoIcons.bookmark
                                              : CupertinoIcons.bookmark_solid,
                                          color: Colors.white,
                                        ),
                                ));
                      }),
                    ]))
          ],
        ),
      ),
    );
  }
}
