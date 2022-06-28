import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasafi_market/controllers/auth.dart';
import 'package:wasafi_market/controllers/user.dart';
import 'package:wasafi_market/models/auth/password.dart';
import 'package:wasafi_market/models/user/username.dart';
import 'package:wasafi_market/screens/directed_screens/favorite.dart';
import 'package:wasafi_market/screens/navigation_screens/notification.dart';
import 'package:wasafi_market/screens/directed_screens/order.dart';
import 'package:wasafi_market/screens/directed_screens/subscription.dart';
import 'package:wasafi_market/screens/free_screens/signup.dart';
import 'package:wasafi_market/widgets/order_card.dart';
import 'package:wasafi_market/widgets/show_snackbar.dart';
import 'package:wasafi_market/widgets/text/bold.dart';
import 'package:wasafi_market/widgets/text/regular.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (!Get.find<AuthController>().logginUser()) {
        Get.to(() => const SignUp());
      } else {
        Get.find<UserController>().gettingUser();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController currentPasswordController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController usernameController = TextEditingController();

    // change password
    void changePassword() {
      String currentPassword = currentPasswordController.text.trim();
      String password = passwordController.text.trim();
      AuthController authController = Get.find<AuthController>();

      if (password.length < 6) {
        showCustomSnackBar("Password should atleast have six characters!",
            title: "Password");
      } else if (password.isEmpty) {
        showCustomSnackBar("Type password with atleast six characters!",
            title: "Password");
      } else {
        PasswordChange passwordChange = PasswordChange(
            currentPassword: currentPassword, password: password);
        authController.passwordChange(passwordChange).then((status) {
          if (status.isSuccess) {
            showCustomSnackBar("password is Successful changed!",
                title: "Password Change");
          } else {
            showCustomSnackBar("password change failed!",
                title: "Password Change");
          }
          currentPasswordController.text = '';
          passwordController.text = '';
        });
      }
    }

    // username change
    void usernameChange() {
      String username = usernameController.text.trim();
      UserController userController = Get.find<UserController>();

      UsernameChange usernameChange = UsernameChange(username: username);

      userController.updatingUser(usernameChange).then((status) {
        if (status.isSuccess) {
          showCustomSnackBar("Username is Successful changed!",
              title: "Username Change");
        } else {
          showCustomSnackBar("username change failed!",
              title: "Username Change");
        }
        usernameController.text = '';
        Get.find<UserController>().gettingUser();
      });
    }

    return GetBuilder<UserController>(builder: (userData) {
      void openEdit(users) {
        showModalBottomSheet(
            isDismissible: false,
            backgroundColor: Colors.transparent,
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return Builder(builder: (context) {
                return StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                  return BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(top: 100),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(.1),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30))),
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Bold(
                                    size: 14,
                                    text: "Done",
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              // username changing
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 6, horizontal: 4),
                                child: Text("Edit Profile",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900,
                                    )),
                              ),
                              GetBuilder<UserController>(builder: (user) {
                                return Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(.2),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Regular(
                                        text: "username",
                                        size: 16,
                                        color: Colors.white,
                                      ),
                                      Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 4, vertical: 6),
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                          ),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              border: Border.all(
                                                  width: 1,
                                                  color: Colors.white60),
                                              color: Colors.white12),
                                          child: TextField(
                                            controller: usernameController,
                                            style: const TextStyle(
                                                color: Colors.white),
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintStyle: const TextStyle(
                                                    color: Colors.white),
                                                hintText:
                                                    user.userList[0].username),
                                          )),
                                      GestureDetector(
                                        onTap: () {
                                          usernameChange();
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.all(4),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 60),
                                          height: 44,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 1,
                                                  color: Colors.white12),
                                              color: Colors.blueAccent,
                                              borderRadius:
                                                  BorderRadius.circular(16)),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                user.isLoading
                                                    ? const Center(
                                                        child:
                                                            CupertinoActivityIndicator(
                                                          color: Colors.white,
                                                          radius: 14,
                                                        ),
                                                      )
                                                    : const Regular(
                                                        color: Colors.white,
                                                        text:
                                                            "Change Username ",
                                                        size: 15,
                                                      ),
                                              ]),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }), // password
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 6, horizontal: 4),
                                child: Text("Change Password",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900,
                                    )),
                              ),
                              GetBuilder<AuthController>(
                                  builder: (authPassword) {
                                return Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(.2),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Regular(
                                        text: "Current Password",
                                        size: 16,
                                        color: Colors.white,
                                      ),
                                      Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 4, vertical: 6),
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                          ),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              border: Border.all(
                                                  width: 1,
                                                  color: Colors.white30),
                                              color: Colors.white12),
                                          child: TextField(
                                            controller:
                                                currentPasswordController,
                                            obscureText: true,
                                            style: const TextStyle(
                                                color: Colors.white),
                                            decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                hintStyle: TextStyle(
                                                    color: Colors.white70),
                                                hintText:
                                                    "Enter your current password"),
                                          )),
                                      const Regular(
                                        text: "New Password",
                                        size: 16,
                                        color: Colors.white,
                                      ),
                                      Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 4, vertical: 6),
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                          ),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              border: Border.all(
                                                  width: 1,
                                                  color: Colors.white30),
                                              color: Colors.white12),
                                          child: TextField(
                                            obscureText: true,
                                            controller: passwordController,
                                            style: const TextStyle(
                                                color: Colors.white),
                                            decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                hintStyle: TextStyle(
                                                    color: Colors.white70),
                                                hintText:
                                                    "Enter your new Password"),
                                          )),
                                      GestureDetector(
                                        onTap: () {
                                          changePassword();
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.all(4),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 60),
                                          height: 44,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 1,
                                                  color: Colors.white12),
                                              color: Colors.blueAccent,
                                              borderRadius:
                                                  BorderRadius.circular(16)),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                authPassword.isLoading
                                                    ? const Center(
                                                        child:
                                                            CupertinoActivityIndicator(
                                                          color: Colors.white,
                                                          radius: 14,
                                                        ),
                                                      )
                                                    : const Regular(
                                                        color: Colors.white,
                                                        text: "Save Password ",
                                                        size: 15,
                                                      ),
                                              ]),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              })
                            ])),
                  );
                });
              });
            });
      }

      return userData.userList.isEmpty
          ? const Center(
              child: CupertinoActivityIndicator(
                color: Colors.blueAccent,
                radius: 14,
              ),
            )
          : CustomScrollView(
              slivers: [
                const SliverAppBar(
                  centerTitle: false,
                  pinned: true,
                  backgroundColor: Colors.black,
                  automaticallyImplyLeading: false,
                  title: Bold(text: "Account", size: 24),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(width: 1, color: Colors.white12))),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white12),
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.white12),
                            child: const Icon(
                              CupertinoIcons.person,
                              size: 50,
                              color: Colors.white70,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Regular(
                                text: userData.userList[0].username,
                                size: 16,
                                color: Colors.white,
                              ),
                              RichText(
                                text: TextSpan(
                                  text: '+255 ',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: userData.userList[0].mobileNumber
                                            .toString(),
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400)),
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 5),
                                child: GestureDetector(
                                  onTap: () {
                                    openEdit(userData.userList[0]);
                                  },
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Regular(
                                          color: Colors.blueAccent,
                                          text: "Edit profile",
                                          size: 14,
                                        ),
                                        Icon(
                                          CupertinoIcons.chevron_right,
                                          color: Colors.blue,
                                          size: 20,
                                        )
                                      ]),
                                ),
                              )
                            ],
                          ),
                        ]),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                              left: 10, right: 10, top: 10, bottom: 2),
                          child: Bold(text: " Wallet Balance", size: 22),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 2, bottom: 10),
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 1, color: Colors.white12))),
                          child: Container(
                              padding: const EdgeInsets.all(10),
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white12),
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.white12),
                              child: ListTile(
                                title: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      CupertinoIcons.creditcard,
                                      color: Colors.blue,
                                      size: 24,
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Regular(
                                        text: "Total Wallet Balance, ",
                                        size: 15,
                                        color: Colors.white70,
                                      ),
                                    )
                                  ],
                                ),
                                subtitle: Bold(
                                  size: 25,
                                  text: userData.userList[0].wallet.toString(),
                                ),
                              )),
                        ),
                      ]),
                ),
                SliverToBoxAdapter(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 8),
                                  child: Bold(
                                    text: "Orders",
                                    size: 16,
                                  )),
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => const Orders());
                                },
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Regular(
                                      text: "View All ",
                                      color: Colors.blue,
                                      size: 14,
                                    ),
                                    Icon(
                                      CupertinoIcons.chevron_right,
                                      color: Colors.blue,
                                      size: 20,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 120,
                          child: ListView.builder(
                              itemCount: 6,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, index) {
                                return const OrderCard(
                                  price: '500,000',
                                  thumbnail:
                                      "https://images.unsplash.com/photo-1649798511342-b468e770c222?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80",
                                  title: 'dfjskfhi5b',
                                );
                              }),
                        ),
                      ]),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.white12),
                                top: BorderSide(color: Colors.white12)),
                          ),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 2),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      CupertinoIcons.bell,
                                      color: Colors.blue,
                                      size: 24,
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Regular(
                                        text: "Notification ",
                                        size: 15,
                                        color: Colors.white70,
                                      ),
                                    )
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.to(() => const Notifications(),
                                        arguments:
                                            userData.userList[0].notification);
                                  },
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      userData.userList[0].notification
                                                  .where((element) =>
                                                      element.isRead == false)
                                                  .length !=
                                              0
                                          ? Container(
                                              constraints: const BoxConstraints(
                                                  minWidth: 30, minHeight: 30),
                                              decoration: BoxDecoration(
                                                  color: Colors.red,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                              child: Center(
                                                child: Regular(
                                                    text: userData.userList[0]
                                                        .notification
                                                        .where((element) =>
                                                            element.isRead ==
                                                            false)
                                                        .length
                                                        .toString(),
                                                    size: 16,
                                                    color: Colors.white),
                                              ),
                                            )
                                          : const SizedBox(
                                              height: 0,
                                            ),
                                      const Icon(
                                        CupertinoIcons.chevron_right,
                                        color: Colors.blue,
                                        size: 24,
                                      ),
                                    ],
                                  ),
                                )
                              ]),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: Colors.white12),
                            ),
                          ),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 2),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      CupertinoIcons.hand_thumbsup,
                                      color: Colors.blue,
                                      size: 24,
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Regular(
                                        text: "Wish List ",
                                        size: 15,
                                        color: Colors.white70,
                                      ),
                                    )
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.to(() => const Favorite());
                                  },
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Regular(
                                        text: userData
                                            .userList[0].favorite.length
                                            .toString(),
                                        size: 16,
                                        color: Colors.white,
                                      ),
                                      const Icon(
                                        CupertinoIcons.chevron_right,
                                        color: Colors.blue,
                                        size: 24,
                                      ),
                                    ],
                                  ),
                                )
                              ]),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.white12)),
                          ),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 2),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      CupertinoIcons.person_2,
                                      color: Colors.blue,
                                      size: 24,
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Regular(
                                        text: "Subscriptions ",
                                        size: 15,
                                        color: Colors.white70,
                                      ),
                                    )
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.to(() => const Subscription());
                                  },
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Regular(
                                        text: userData
                                            .userList[0].subscriptions.length
                                            .toString(),
                                        size: 16,
                                        color: Colors.white,
                                      ),
                                      const Icon(
                                        CupertinoIcons.chevron_right,
                                        color: Colors.blue,
                                        size: 24,
                                      ),
                                    ],
                                  ),
                                )
                              ]),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.white12)),
                          ),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 2),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      CupertinoIcons.time,
                                      color: Colors.blue,
                                      size: 24,
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Regular(
                                        text: "History",
                                        size: 15,
                                        color: Colors.white70,
                                      ),
                                    )
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.to(() => const Favorite());
                                  },
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        CupertinoIcons.chevron_right,
                                        color: Colors.blue,
                                        size: 24,
                                      ),
                                    ],
                                  ),
                                )
                              ]),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.white12)),
                          ),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 2),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      CupertinoIcons.info,
                                      color: Colors.blue,
                                      size: 24,
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Regular(
                                        text: "Received Orders ",
                                        size: 15,
                                        color: Colors.white70,
                                      ),
                                    )
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.to(() => const Favorite());
                                  },
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        CupertinoIcons.chevron_right,
                                        color: Colors.blue,
                                        size: 24,
                                      ),
                                    ],
                                  ),
                                )
                              ]),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          padding: const EdgeInsets.symmetric(horizontal: 60),
                          height: 44,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 1, color: Colors.white12),
                              color: const Color.fromARGB(55, 68, 137, 255),
                              borderRadius: BorderRadius.circular(16)),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Regular(
                                  color: Colors.white,
                                  text: "Log Out ",
                                  size: 15,
                                ),
                              ]),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
    });
  }
}
