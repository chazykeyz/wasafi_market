import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasafi_market/main.dart';
import 'package:wasafi_market/widgets/text/regular.dart';

class NavHeader extends StatelessWidget {
  const NavHeader(
      {Key? key,
      required this.userContent,
      required this.isPage,
      required this.title,
      required this.noCart})
      : super(key: key);
  final dynamic userContent;
  final bool isPage;
  final String title;
  final bool noCart;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.black.withOpacity(.5),
      automaticallyImplyLeading: isPage ? false : true,
      leading: !isPage
          ? GestureDetector(
              onTap: () {
                Get.back();
              },
              child: const Icon(
                CupertinoIcons.chevron_left,
                color: Colors.blueAccent,
                size: 24,
              ))
          : null,
      titleSpacing: isPage ? 30 : 0,
      title: Text(
        title,
        style: TextStyle(
            fontSize: isPage ? 24 : 16,
            color: isPage ? Colors.white : Colors.blue,
            fontWeight: isPage ? FontWeight.w900 : FontWeight.normal),
      ),
      centerTitle: false,
      actions: [
        noCart
            ? GestureDetector(
                onTap: () {
                  Get.off(() => const Parent(
                        isFromDetail: true,
                        number: 2,
                      ));
                },
                child: Container(
                    margin: const EdgeInsets.all(5),
                    width: 47,
                    child: Stack(children: [
                      Container(
                          margin: const EdgeInsets.only(top: 8),
                          child: const Icon(CupertinoIcons.bag)),
                      Positioned(
                          left: 15,
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            constraints: const BoxConstraints(
                                minHeight: 20, minWidth: 20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blueAccent),
                            child: Center(
                              child: Regular(
                                  text: userContent.userList.isEmpty
                                      ? '0'
                                      : userContent.userList[0].cart.length
                                          .toString(),
                                  size: 12,
                                  color: Colors.white),
                            ),
                          ))
                    ])))
            : const Text("")
      ],
      pinned: true,
      bottom: (PreferredSize(
          child: Container(
            color: const Color.fromARGB(14, 255, 255, 255),
            height: 1.0,
          ),
          preferredSize: const Size.fromHeight(1.0))),
      toolbarHeight: 50,
      floating: false,
      flexibleSpace: FlexibleSpaceBar(
        background: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: const SizedBox(
            height: 30,
          ),
        ),
      ),
    );
  }
}
