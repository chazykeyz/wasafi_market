import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasafi_market/controllers/auth.dart';
import 'package:wasafi_market/controllers/shop.dart';
import 'package:wasafi_market/controllers/user.dart';
import 'package:wasafi_market/main.dart';
import 'package:wasafi_market/screens/free_screens/signup.dart';
import 'package:wasafi_market/widgets/loads/main_loader.dart';
import 'package:wasafi_market/widgets/nav_header.dart';
import 'package:wasafi_market/widgets/product/product_card.dart';
import 'package:wasafi_market/widgets/text/bold.dart';
import 'package:wasafi_market/widgets/text/regular.dart';

class SellerProfile extends StatefulWidget {
  const SellerProfile({
    Key? key,
  }) : super(key: key);

  @override
  State<SellerProfile> createState() => _SellerProfileState();
}

class _SellerProfileState extends State<SellerProfile> {
  var userId = Get.arguments;
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

        Get.find<ShopController>().getShop(userId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    void subscribe(seller) {
      if (!Get.find<AuthController>().logginUser()) {
        Get.to(() => const SignUp(
              signDestination: SellerProfile(),
            ));
      } else {
        Get.find<ShopController>()
            .subscribeShop(seller.id)
            .then((value) => {Get.find<ShopController>().getShop(userId)});
      }
    }

    return Scaffold(
        backgroundColor: Colors.black,
        resizeToAvoidBottomInset: false,
        body: GetBuilder<ShopController>(
          builder: (shopDetail) {
            List<dynamic> data = shopDetail.shopDetails;
            return (data.isEmpty
                ? const MainLoader()
                : Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: CustomScrollView(
                      slivers: [
                        NavHeader(
                          userContent: data[0].user,
                          isPage: false,
                          title: "Shop Profile",
                          noCart: false,
                        ),
                        // the profile picture and subcription
                        SliverToBoxAdapter(
                          child: Container(
                            margin: const EdgeInsets.only(top: 10),
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                    margin: const EdgeInsets.only(right: 4),
                                    child: Container(
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: const Color.fromARGB(
                                                31, 255, 255, 255),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    data[0].profilePicture),
                                                fit: BoxFit.cover)))),
                                GetBuilder<UserController>(
                                    builder: (userContext) {
                                  return userContext.userList.isEmpty
                                      ? const SizedBox(
                                          height: 0,
                                        )
                                      : Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Column(
                                                  children: [
                                                    Bold(
                                                        text: data[0]
                                                            .followers
                                                            .length
                                                            .toString(),
                                                        size: 16),
                                                    const Regular(
                                                        text:
                                                            "   subscribers  ",
                                                        size: 15,
                                                        color: Colors.white54)
                                                  ],
                                                ),
                                                Column(
                                                  children: const [
                                                    Bold(text: "567", size: 16),
                                                    Regular(
                                                        text: " Products",
                                                        size: 15,
                                                        color: Colors.white54)
                                                  ],
                                                )
                                              ],
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                subscribe(data[0]);
                                              },
                                              child: Container(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 4,
                                                        horizontal: 40),
                                                height: 30,
                                                width: 160,
                                                decoration: BoxDecoration(
                                                    color: data[0]
                                                            .followers
                                                            .where((item) =>
                                                                item ==
                                                                userContext
                                                                    .userList[0]
                                                                    .id)
                                                            .isEmpty
                                                        ? Colors.blueAccent
                                                        : Colors.white12,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Center(
                                                  child: shopDetail.subLoading
                                                      ? const CupertinoActivityIndicator()
                                                      : Regular(
                                                          color: Colors.white,
                                                          text: data[0]
                                                                  .followers
                                                                  .where((item) =>
                                                                      item ==
                                                                      userContext
                                                                          .userList[
                                                                              0]
                                                                          .id)
                                                                  .isEmpty
                                                              ? "SUBSCRIBE"
                                                              : 'SUBSCRIBED',
                                                          size: 13,
                                                        ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                })
                              ],
                            ),
                          ),
                        ),
                        // bio and location section and products
                        SliverToBoxAdapter(
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(children: [
                                  Text(
                                    data[0].shopName,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w800),
                                  ),
                                  SizedBox(
                                      child: data[0].isVerified
                                          ? const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 4),
                                              child: Icon(
                                                CupertinoIcons
                                                    .checkmark_seal_fill,
                                                size: 16,
                                                color: Colors.blueAccent,
                                              ),
                                            )
                                          : null)
                                ]),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Regular(
                                    text: data[0].bio,
                                    size: 14,
                                    color: Colors.white70,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color.fromARGB(
                                          38, 68, 137, 255)),
                                  child: Column(children: [
                                    Row(
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Icon(
                                            CupertinoIcons.link,
                                            color: Colors.white,
                                            size: 16,
                                          ),
                                        ),
                                        data[0].link.length >= 40
                                            ? Row(children: [
                                                Regular(
                                                    text: data[0]
                                                        .link
                                                        .toString()
                                                        .substring(0, 40),
                                                    size: 14,
                                                    color: Colors.blueAccent),
                                                const Regular(
                                                    text: "...",
                                                    size: 14,
                                                    color: Colors.blueAccent)
                                              ])
                                            : Regular(
                                                text: data[0].link,
                                                size: 14,
                                                color: Colors.white70)
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Icon(
                                            CupertinoIcons.location_fill,
                                            color: Colors.white,
                                            size: 16,
                                          ),
                                        ),
                                        Regular(
                                            text: data[0].shopLocation,
                                            size: 14,
                                            color: Colors.blueAccent)
                                      ],
                                    )
                                  ]),
                                ),
                                Center(
                                  child: Container(
                                    height: .5,
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    width:
                                        MediaQuery.of(context).size.width - 100,
                                    color: Colors.white24,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        // product list
                        data[0].products.length == 0
                            ? const SliverToBoxAdapter(
                                child: Center(
                                  child: Regular(
                                    text: "There no Product yet!",
                                    size: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            : SliverGrid(
                                delegate: SliverChildBuilderDelegate(
                                    (BuildContext context, int index) {
                                  return ProductCard(
                                      isFlash: 0,
                                      data: data[0].products[index]);
                                },
                                    childCount: shopDetail
                                        .shopDetails[0].products.length),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10,
                                ))
                      ],
                    ),
                  ));
          },
        ));
  }
}
