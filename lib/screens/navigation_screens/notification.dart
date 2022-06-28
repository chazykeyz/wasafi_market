import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:wasafi_market/controllers/auth.dart';
import 'package:wasafi_market/controllers/user.dart';
import 'package:wasafi_market/screens/free_screens/signup.dart';
import 'package:wasafi_market/widgets/text/bold.dart';
import 'package:wasafi_market/widgets/text/regular.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (!Get.find<AuthController>().logginUser()) {
        Get.to(() => const SignUp());
      } else {
        Get.find<UserController>().readNotification();
        Get.find<UserController>().gettingUser();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(builder: (userContent) {
      return userContent.userList.isEmpty
          ? const Center(
              child: CupertinoActivityIndicator(
                color: Colors.blueAccent,
                radius: 14,
              ),
            )
          : CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: Colors.transparent,
                  pinned: true,
                  title: const Bold(text: "Account", size: 24),
                  centerTitle: false,
                  flexibleSpace: FlexibleSpaceBar(
                    background: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: const SizedBox(
                        height: 30,
                      ),
                    ),
                  ),
                  automaticallyImplyLeading: false,
                  bottom: (PreferredSize(
                      child: Container(
                        color: const Color.fromARGB(14, 255, 255, 255),
                        height: 1.0,
                      ),
                      preferredSize: const Size.fromHeight(1.0))),
                ),
                SliverToBoxAdapter(
                    child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height,
                                    child: MediaQuery.removePadding(
                                      removeTop: true,
                                      context: context,
                                      child: ListView.builder(
                                          scrollDirection: Axis.vertical,
                                          itemCount: userContent
                                              .userList[0].notification.length,
                                          itemBuilder: (context, index) {
                                            return Column(children: [
                                              ListTile(
                                                  subtitle: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Regular(
                                                          text: userContent
                                                              .userList[0]
                                                              .notification[
                                                                  index]
                                                              .content,
                                                          size: 14,
                                                          color: Colors.white),
                                                      GestureDetector(
                                                        onTap: () {
                                                          // Get.to(() => const SellerProfile());
                                                        },
                                                        child: Regular(
                                                            text: Jiffy(
                                                                    userContent
                                                                        .userList[
                                                                            0]
                                                                        .notification[
                                                                            index]
                                                                        .createdAt
                                                                        .toString()
                                                                        .substring(
                                                                            0,
                                                                            10),
                                                                    "yyyy-MM-dd")
                                                                .fromNow(),
                                                            size: 12,
                                                            color:
                                                                Colors.white54),
                                                      )
                                                    ],
                                                  ),
                                                  trailing: const Icon(
                                                    CupertinoIcons
                                                        .chevron_forward,
                                                    size: 16,
                                                    color: Colors.white,
                                                  )),
                                              Center(
                                                  child: Container(
                                                height: .5,
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 10),
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    100,
                                                color: Colors.white24,
                                              )),
                                            ]);
                                          }),
                                    ),
                                  ),
                                ])
                          ],
                        ))),
              ],
            );
    });
  }
}
