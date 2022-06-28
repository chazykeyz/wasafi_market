import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasafi_market/controllers/auth.dart';
import 'package:wasafi_market/controllers/user.dart';
import 'package:wasafi_market/screens/directed_screens/checkout.dart';
import 'package:wasafi_market/screens/free_screens/signup.dart';
import 'package:wasafi_market/widgets/product_short_card.dart';
import 'package:wasafi_market/widgets/text/bold.dart';
import 'package:wasafi_market/widgets/text/regular.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
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
    return Scaffold(
      backgroundColor: Colors.black,
      body: GetBuilder<UserController>(builder: (userContent) {
        return userContent.userList.isEmpty
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
                    title: Bold(text: "Carts", size: 26),
                  ),
                  SliverToBoxAdapter(
                      child: Container(
                          height: MediaQuery.of(context).size.height,
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 20),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Bold(
                                      text:
                                          '${userContent.userList[0].cart.length.toString()} Products',
                                      size: 15,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        // Get.to(()=>)
                                      },
                                      child: const Regular(
                                          text: "Clear All",
                                          size: 14,
                                          color: Colors.blueAccent),
                                    )
                                  ],
                                ),
                              ),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height -
                                              380,
                                      child: MediaQuery.removePadding(
                                        removeTop: true,
                                        context: context,
                                        child: ListView.builder(
                                            scrollDirection: Axis.vertical,
                                            itemCount: userContent
                                                .userList[0].cart.length,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5),
                                                child: InkWell(
                                                  onTap: () {
                                                    // Get.to(() => const ProductDetail());
                                                  },
                                                  child: ListTile(
                                                    leading: Container(
                                                        width: 58,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                          border: Border.all(
                                                              color: Colors
                                                                  .white12),
                                                          color: const Color
                                                                  .fromARGB(36,
                                                              238, 237, 237),
                                                          image: DecorationImage(
                                                              image: NetworkImage(
                                                                  userContent
                                                                      .userList[
                                                                          0]
                                                                      .cart[
                                                                          index]
                                                                      .product
                                                                      .thumbnail[0]),
                                                              fit: BoxFit.cover),
                                                        )),
                                                    title: Bold(
                                                      text: userContent
                                                          .userList[0]
                                                          .cart[index]
                                                          .product
                                                          .name,
                                                      size: 14,
                                                    ),
                                                    subtitle: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Regular(
                                                            text:
                                                                "Tsh ${userContent.userList[0].cart[index].product.price.toString()} x ${userContent.userList[0].cart[index].quantity}",
                                                            size: 14,
                                                            color: Colors
                                                                .blueAccent),
                                                        Regular(
                                                            text: userContent
                                                                        .userList[
                                                                            0]
                                                                        .cart[
                                                                            index]
                                                                        .product
                                                                        .remainedStock !=
                                                                    0
                                                                ? '${userContent.userList[0].cart[index].product.remainedStock} Items Available'
                                                                : "out of Stock",
                                                            size: 14,
                                                            color:
                                                                Colors.white54)
                                                      ],
                                                    ),
                                                    trailing: const Icon(
                                                      CupertinoIcons.clear,
                                                      size: 16,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }),
                                      ),
                                    ),
                                    Center(
                                        child: Container(
                                      height: .5,
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      width: MediaQuery.of(context).size.width -
                                          100,
                                      color: Colors.white24,
                                    )),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          Bold(text: "Total Amount", size: 20),
                                          Regular(
                                              text: "Tsh 1,000,000/=",
                                              size: 15,
                                              color: Colors.white70)
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Get.to(() => const Checkout());
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
                                            color: const Color.fromARGB(
                                                55, 68, 137, 255),
                                            borderRadius:
                                                BorderRadius.circular(16)),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: const [
                                              Regular(
                                                color: Colors.white,
                                                text: "Checkout Now",
                                                size: 15,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 4.0),
                                                child: Icon(
                                                  CupertinoIcons
                                                      .arrowshape_turn_up_right,
                                                  color: Colors.white,
                                                ),
                                              )
                                            ]),
                                      ),
                                    ),
                                  ])
                            ],
                          ))),
                ],
              );
      }),
    );
  }
}
