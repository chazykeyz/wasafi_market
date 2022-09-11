import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasafi_market/controllers/auth.dart';
import 'package:wasafi_market/controllers/shop.dart';
import 'package:wasafi_market/controllers/user.dart';
import 'package:wasafi_market/main.dart';
import 'package:wasafi_market/models/auth/password.dart';
import 'package:wasafi_market/models/shop/shops.dart';
import 'package:wasafi_market/models/user/username.dart';
import 'package:wasafi_market/screens/directed_screens/product/management.dart';
import 'package:wasafi_market/screens/directed_screens/user/customers.dart';
import 'package:wasafi_market/screens/directed_screens/user/favorite.dart';
import 'package:wasafi_market/screens/directed_screens/order/order.dart';
import 'package:wasafi_market/screens/directed_screens/user/subscription.dart';
import 'package:wasafi_market/screens/free_screens/signup.dart';
import 'package:wasafi_market/widgets/nav_header.dart';
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
        Get.offAll(() => const SignUp(
              signDestination: Parent(isFromDetail: true, number: 4),
            ));
      } else {
        Get.find<UserController>().gettingUser();
        Get.find<ShopController>().getShops();
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

    return GetBuilder<UserController>(builder: (userContent) {
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
                        decoration: const BoxDecoration(
                            color: Colors.white12,
                            borderRadius: BorderRadius.only(
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

// bio
      void openBio(data) {
        TextEditingController bioController =
            TextEditingController(text: "${data.bio}");
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                color: Colors.black,
                child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        const Bold(text: "Shop Bio", size: 20),
                        Container(
                          height: 1,
                          color: Colors.black,
                          margin: const EdgeInsets.symmetric(vertical: 10),
                        ),
                        Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 6),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border:
                                    Border.all(width: 1, color: Colors.white30),
                                color: Colors.white12),
                            child: TextField(
                              controller: bioController,
                              maxLines: 3,
                              minLines: 1,
                              style: const TextStyle(color: Colors.white70),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  counterText: "",
                                  hintStyle:
                                      const TextStyle(color: Colors.white70),
                                  hintText: "${data.bio}"),
                            )),
                        GestureDetector(
                          onTap: () {
                            BioUpdate bioUpdate =
                                BioUpdate(bio: bioController.text);
                            Get.find<ShopController>()
                                .updateShop(data.id, bioUpdate)
                                .then((status) {
                              if (status.isSuccess) {
                                Get.find<ShopController>().getShops();
                                showCustomSnackBar("Bio Edited successful!",
                                    title: "Bio Editing");
                              } else {
                                showCustomSnackBar("Bio Editing Failed!",
                                    title: "Bio Editing");
                                Get.back();
                              }
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.all(4),
                            padding: const EdgeInsets.symmetric(horizontal: 60),
                            height: 44,
                            decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius: BorderRadius.circular(16)),
                            child: const Center(
                              child: Regular(
                                color: Colors.white,
                                text: "Save",
                                size: 15,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              );
            });
      }

      // location
      void openLocation(data) {
        TextEditingController locationController =
            TextEditingController(text: "${data.shopLocation}");
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                color: Colors.black,
                child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Row(children: const [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Icon(
                              CupertinoIcons.pin,
                              color: Colors.blue,
                            ),
                          ),
                          Bold(text: "Shop Location", size: 20)
                        ]),
                        Container(
                          height: 1,
                          color: Colors.black,
                          margin: const EdgeInsets.symmetric(vertical: 10),
                        ),
                        Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 6),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border:
                                    Border.all(width: 1, color: Colors.white30),
                                color: Colors.white12),
                            child: TextField(
                              controller: locationController,
                              style: const TextStyle(color: Colors.white70),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  counterText: "",
                                  hintStyle:
                                      const TextStyle(color: Colors.white70),
                                  hintText: "${data.shopLocation}"),
                            )),
                        GestureDetector(
                          onTap: () {
                            LocationUpdate locationUpdate = LocationUpdate(
                                shopLocation: locationController.text);
                            Get.find<ShopController>()
                                .updateShop(data.id, locationUpdate)
                                .then((status) {
                              if (status.isSuccess) {
                                Get.find<ShopController>().getShops();
                                showCustomSnackBar(
                                    "location Edited successful!",
                                    title: "Location Editing");
                              } else {
                                showCustomSnackBar("Bio Editing Failed!",
                                    title: "Location Editing");
                                Get.back();
                              }
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.all(4),
                            padding: const EdgeInsets.symmetric(horizontal: 60),
                            height: 44,
                            decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius: BorderRadius.circular(16)),
                            child: const Center(
                              child: Regular(
                                color: Colors.white,
                                text: "Save",
                                size: 15,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              );
            });
      }

// website
      void openWebsite(data) {
        TextEditingController websiteController =
            TextEditingController(text: "${data.link}");
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                color: Colors.black,
                child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Row(children: const [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Icon(
                              CupertinoIcons.link,
                              color: Colors.blue,
                            ),
                          ),
                          Bold(text: "Shop Website", size: 20)
                        ]),
                        Container(
                          height: 1,
                          color: Colors.black,
                          margin: const EdgeInsets.symmetric(vertical: 10),
                        ),
                        Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 6),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border:
                                    Border.all(width: 1, color: Colors.white30),
                                color: Colors.white12),
                            child: TextField(
                              controller: websiteController,
                              style: const TextStyle(color: Colors.white70),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  counterText: "",
                                  hintStyle:
                                      const TextStyle(color: Colors.white70),
                                  hintText: data.link.length != 0
                                      ? '${data.link}'
                                      : "Enter online link of your business"),
                            )),
                        GestureDetector(
                          onTap: () {
                            WebsiteUpdate websiteUpdate =
                                WebsiteUpdate(link: websiteController.text);
                            Get.find<ShopController>()
                                .updateShop(data.id, websiteUpdate)
                                .then((status) {
                              if (status.isSuccess) {
                                Get.find<ShopController>().getShops();
                                showCustomSnackBar(
                                    "location Edited successful!",
                                    title: "Location Editing");
                              } else {
                                showCustomSnackBar("Bio Editing Failed!",
                                    title: "Location Editing");
                                Get.back();
                              }
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.all(4),
                            padding: const EdgeInsets.symmetric(horizontal: 60),
                            height: 44,
                            decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius: BorderRadius.circular(16)),
                            child: const Center(
                              child: Regular(
                                color: Colors.white,
                                text: "Save",
                                size: 15,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              );
            });
      }

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
                  title: 'Account',
                  noCart: false,
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
                                text: userContent.userList[0].username,
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
                                        text: userContent
                                            .userList[0].mobileNumber
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
                                    openEdit(userContent.userList[0]);
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
                // the shop setup group
                GetBuilder<ShopController>(builder: (shopContent) {
                  List shopInformation = shopContent.shopList
                      .where((element) =>
                          element.user.id == userContent.userList[0].id)
                      .toList();

                  return shopInformation.isEmpty
                      ? const SliverToBoxAdapter(
                          child: Center(
                            child: CupertinoActivityIndicator(
                              color: Colors.blueAccent,
                              radius: 14,
                            ),
                          ),
                        )
                      : SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(children: [
                              // shop setup
                              Column(children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  width: MediaQuery.of(context).size.width,
                                  child: const Regular(
                                    text: "SHOP SETUP",
                                    size: 14,
                                    color: Colors.white,
                                  ),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 0),
                                  decoration: BoxDecoration(
                                    color: Colors.white10,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Column(
                                    children: [
                                      // SHOP BIO
                                      InkWell(
                                        onTap: () {
                                          openBio(shopInformation[0]);
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: const BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.white12),
                                            ),
                                          ),
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 2),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: const [
                                                    Icon(
                                                      CupertinoIcons.info,
                                                      color: Colors.blue,
                                                      size: 24,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 8.0),
                                                      child: Regular(
                                                        text: "Shop Bio",
                                                        size: 15,
                                                        color: Colors.white70,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                const Icon(
                                                  CupertinoIcons.chevron_right,
                                                  color: Colors.white54,
                                                  size: 20,
                                                )
                                              ]),
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: const BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                                color: Colors.white12),
                                          ),
                                        ),
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 2),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: const [
                                                  Icon(
                                                    CupertinoIcons.creditcard,
                                                    color: Colors.blue,
                                                    size: 24,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 8.0),
                                                    child: Regular(
                                                      text: "Payments ",
                                                      size: 15,
                                                      color: Colors.white70,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              GestureDetector(
                                                child: const Icon(
                                                  CupertinoIcons.chevron_right,
                                                  color: Colors.white54,
                                                  size: 20,
                                                ),
                                              )
                                            ]),
                                      ),
                                      //  WEBSITE
                                      InkWell(
                                        onTap: () {
                                          openWebsite(shopInformation[0]);
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: const BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.white12),
                                            ),
                                          ),
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 2),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: const [
                                                    Icon(
                                                      CupertinoIcons.link,
                                                      color: Colors.blue,
                                                      size: 24,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 8.0),
                                                      child: Regular(
                                                        text: "Website",
                                                        size: 15,
                                                        color: Colors.white70,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    Get.to(
                                                        () => const Favorite());
                                                  },
                                                  child: const Icon(
                                                    CupertinoIcons
                                                        .chevron_right,
                                                    color: Colors.white54,
                                                    size: 20,
                                                  ),
                                                )
                                              ]),
                                        ),
                                      ),
                                      // LOCATION
                                      InkWell(
                                        onTap: () {
                                          openLocation(shopInformation[0]);
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(10),
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 2),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: const [
                                                    Icon(
                                                      CupertinoIcons.pin,
                                                      color: Colors.blue,
                                                      size: 24,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 8.0),
                                                      child: Regular(
                                                        text: "Location",
                                                        size: 15,
                                                        color: Colors.white70,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    Get.to(() => Subscription(
                                                        userInfo: userContent
                                                            .userList[0]));
                                                  },
                                                  child: const Icon(
                                                    CupertinoIcons
                                                        .chevron_right,
                                                    color: Colors.white54,
                                                    size: 20,
                                                  ),
                                                )
                                              ]),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // SHOP INFORMATION
                                Column(children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    width: MediaQuery.of(context).size.width,
                                    child: const Regular(
                                      text: "SHOP INFO",
                                      size: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white10,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Column(
                                      children: [
                                        // CUSTOMERS
                                        InkWell(
                                          onTap: () {
                                            Get.to(() => const Customers());
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(10),
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                bottom: BorderSide(
                                                    color: Colors.white12),
                                              ),
                                            ),
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 2),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: const [
                                                      Icon(
                                                        CupertinoIcons
                                                            .hand_thumbsup,
                                                        color: Colors.blue,
                                                        size: 24,
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    8.0),
                                                        child: Regular(
                                                          text: "Customers",
                                                          size: 15,
                                                          color: Colors.white70,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      Get.to(() =>
                                                          const Favorite());
                                                    },
                                                    child: const Icon(
                                                      CupertinoIcons
                                                          .chevron_right,
                                                      color: Colors.white60,
                                                      size: 20,
                                                    ),
                                                  )
                                                ]),
                                          ),
                                        ),
                                        // SHOP ORDERS
                                        InkWell(
                                          onTap: () {
                                            Get.to(() => const Orders(
                                                  customer: false,
                                                ));
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(10),
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                  bottom: BorderSide(
                                                      color: Colors.white12)),
                                            ),
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 2),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: const [
                                                      Icon(
                                                        CupertinoIcons.time,
                                                        color: Colors.blue,
                                                        size: 24,
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    8.0),
                                                        child: Regular(
                                                          text: "Shop Orders",
                                                          size: 15,
                                                          color: Colors.white70,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      Get.to(() =>
                                                          const Favorite());
                                                    },
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: const [
                                                        Icon(
                                                          CupertinoIcons
                                                              .chevron_right,
                                                          color: Colors.white60,
                                                          size: 20,
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ]),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Get.to(
                                                () => const ProductManagement(),
                                                arguments: shopInformation[0]);
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(10),
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 2),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: const [
                                                      Icon(
                                                        CupertinoIcons.info,
                                                        color: Colors.blue,
                                                        size: 24,
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    8.0),
                                                        child: Regular(
                                                          text:
                                                              "Product Management ",
                                                          size: 15,
                                                          color: Colors.white70,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: const [
                                                      Icon(
                                                        CupertinoIcons
                                                            .chevron_right,
                                                        color: Colors.white60,
                                                        size: 20,
                                                      ),
                                                    ],
                                                  )
                                                ]),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ]),
                              ]),
                            ]),
                          ),
                        );
                }),

                // main setup group
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        width: MediaQuery.of(context).size.width,
                        child: const Regular(
                          text: "ACCOUNT INFO",
                          size: 14,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white10,
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.to(() => const Favorite());
                              },
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(color: Colors.white12),
                                  ),
                                ),
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 2),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: const [
                                          Icon(
                                            CupertinoIcons.hand_thumbsup,
                                            color: Colors.blue,
                                            size: 24,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 8.0),
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
                                        child: const Icon(
                                          CupertinoIcons.chevron_right,
                                          color: Colors.white60,
                                          size: 20,
                                        ),
                                      )
                                    ]),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(() => Subscription(
                                    userInfo: userContent.userList[0]));
                              },
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                  border: Border(
                                      bottom:
                                          BorderSide(color: Colors.white12)),
                                ),
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 2),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: const [
                                          Icon(
                                            CupertinoIcons.person_2,
                                            color: Colors.blue,
                                            size: 24,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 8.0),
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
                                          Get.to(() => Subscription(
                                                userInfo:
                                                    userContent.userList[0],
                                              ));
                                        },
                                        child: const Icon(
                                          CupertinoIcons.chevron_right,
                                          color: Colors.white60,
                                          size: 20,
                                        ),
                                      )
                                    ]),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(() => const Orders(customer: false));
                              },
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 2),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: const [
                                          Icon(
                                            CupertinoIcons.info,
                                            color: Colors.blue,
                                            size: 24,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 8.0),
                                            child: Regular(
                                              text: "Sent Orders ",
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
                                              color: Colors.white60,
                                              size: 20,
                                            ),
                                          ],
                                        ),
                                      )
                                    ]),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                ),
                // log out button
                GetBuilder<AuthController>(builder: (authContent) {
                  return SliverToBoxAdapter(
                    child: Column(children: [
                      InkWell(
                        onTap: () {
                          authContent.logginOut();
                          userContent.userList.clear();
                          Get.offAll(() =>
                              const Parent(isFromDetail: true, number: 0));
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          padding: const EdgeInsets.symmetric(horizontal: 60),
                          height: 44,
                          decoration: BoxDecoration(
                              color: Colors.blue,
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
                      ),
                      const SizedBox(
                        height: 100,
                      )
                    ]),
                  );
                })
              ],
            );
    });
  }
}
