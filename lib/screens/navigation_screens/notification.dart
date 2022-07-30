import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:wasafi_market/controllers/auth.dart';
import 'package:wasafi_market/controllers/user.dart';
import 'package:wasafi_market/main.dart';
import 'package:wasafi_market/screens/free_screens/signup.dart';
import 'package:wasafi_market/widgets/nav_header.dart';
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
        Get.to(() => const SignUp(
              signDestination: Parent(isFromDetail: true, number: 3),
            ));
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
                NavHeader(
                  userContent: userContent,
                  isPage: true,
                  title: 'Notification',
                  noCart: false,
                ),
                SliverToBoxAdapter(
                    child: Container(
                        padding: const EdgeInsets.all(8),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height - 200,
                          child: MediaQuery.removePadding(
                            removeTop: true,
                            context: context,
                            child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount:
                                    userContent.userList[0].notification.length,
                                itemBuilder: (context, index) {
                                  return Column(children: [
                                    ListTile(
                                        subtitle: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Regular(
                                                text: userContent
                                                    .userList[0]
                                                    .notification[index]
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
                                                              .userList[0]
                                                              .notification[
                                                                  index]
                                                              .createdAt
                                                              .toString()
                                                              .substring(0, 10),
                                                          "yyyy-MM-dd")
                                                      .fromNow(),
                                                  size: 12,
                                                  color: Colors.white54),
                                            )
                                          ],
                                        ),
                                        trailing: const Icon(
                                          CupertinoIcons.chevron_forward,
                                          size: 16,
                                          color: Colors.white,
                                        )),
                                    Center(
                                        child: Container(
                                      height: .5,
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      width: MediaQuery.of(context).size.width -
                                          100,
                                      color: Colors.white24,
                                    )),
                                  ]);
                                }),
                          ),
                        ))),
              ],
            );
    });
  }
}
