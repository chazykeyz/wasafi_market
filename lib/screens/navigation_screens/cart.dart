import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:wasafi_market/controllers/auth.dart';
import 'package:wasafi_market/controllers/cart.dart';
import 'package:wasafi_market/controllers/products.dart';
import 'package:wasafi_market/controllers/user.dart';
import 'package:wasafi_market/main.dart';
import 'package:wasafi_market/screens/directed_screens/order/checkout.dart';
import 'package:wasafi_market/screens/directed_screens/product/details.dart';
import 'package:wasafi_market/screens/free_screens/signup.dart';
import 'package:wasafi_market/widgets/nav_header.dart';
import 'package:wasafi_market/widgets/show_snackbar.dart';
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
        Get.to(() => const SignUp(
              signDestination: Parent(isFromDetail: true, number: 2),
            ));
      } else {
        Get.find<UserController>().gettingUser();
      }
    });
  }

  // delete items

  void deleteItems(id) {
    CartController cartController = Get.find<CartController>();

    cartController.removeWholeItemFromCart(id).then((status) {
      if (status.isSuccess) {
        showCustomSnackBar("Item deleted from cart", title: "Cart");
        Get.find<UserController>().gettingUser();
      } else {
        showCustomSnackBar("deleting cart failed!", title: "Cart");
      }
    });
  }

  // add to cart
  void deleteCart() {
    CartController cartController = Get.find<CartController>();

    cartController.deleteCart().then((status) {
      if (status.isSuccess) {
        showCustomSnackBar("Cart deleted", title: "Cart");
        Get.find<UserController>().gettingUser();
      } else {
        showCustomSnackBar("Deleting cart failed!", title: "Cart");
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
                  NavHeader(
                    userContent: userContent,
                    isPage: true,
                    title: 'Bag',
                    noCart: false,
                  ),
                  userContent.userList[0].cart.isEmpty
                      ? SliverToBoxAdapter(
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height - 200,
                            child: Center(
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      CupertinoIcons.bag,
                                      color: Colors.white54,
                                      size: 70,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Regular(
                                      text:
                                          "Ooops! There is no any item in the Bag",
                                      size: 14,
                                      color: Colors.white54,
                                    ),
                                  ]),
                            ),
                          ),
                        )
                      : SliverToBoxAdapter(
                          child: Container(
                              height: MediaQuery.of(context).size.height,
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Bold(
                                          text:
                                              '${userContent.userList[0].cart.length.toString()} Items',
                                          size: 15,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            deleteCart();
                                          },
                                          child: const Regular(
                                              text: "Clear All",
                                              size: 14,
                                              color: Colors.blueAccent),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height -
                                        380,
                                    child: MediaQuery.removePadding(
                                      removeTop: true,
                                      context: context,
                                      child: ListView.builder(
                                          scrollDirection: Axis.vertical,
                                          itemCount: userContent
                                              .userList[0].cart.length,
                                          itemBuilder: (context, index) {
                                            return Slidable(
                                              key: const ValueKey(0),
                                              endActionPane: ActionPane(
                                                  motion: const ScrollMotion(),
                                                  // A pane can dismiss the Slidable.

                                                  children: [
                                                    SlidableAction(
                                                      onPressed: (context) {
                                                        deleteItems(userContent
                                                            .userList[0]
                                                            .cart[index]
                                                            .product
                                                            .id);
                                                      },
                                                      backgroundColor:
                                                          Colors.redAccent,
                                                      foregroundColor:
                                                          Colors.white,
                                                      icon:
                                                          CupertinoIcons.delete,
                                                      label: 'Delete',
                                                    ),
                                                  ]),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5),
                                                child:
                                                    Builder(builder: (context) {
                                                  return GetBuilder<
                                                          ProductsController>(
                                                      builder:
                                                          (productContect) {
                                                    return InkWell(
                                                      onTap: () {
                                                        if (productContect
                                                            .productList
                                                            .isNotEmpty) {
                                                          Get.to(
                                                              () =>
                                                                  ProductDetail(
                                                                    data: productContect.productList.firstWhere((element) =>
                                                                        element
                                                                            .id ==
                                                                        userContent
                                                                            .userList[0]
                                                                            .cart[index]
                                                                            .product
                                                                            .id),
                                                                    isWishList:
                                                                        false,
                                                                  ));
                                                        }
                                                      },
                                                      child: ListTile(
                                                        leading: Container(
                                                            width: 58,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20),
                                                              border: Border.all(
                                                                  color: Colors
                                                                      .white12),
                                                              color: const Color
                                                                      .fromARGB(
                                                                  36,
                                                                  238,
                                                                  237,
                                                                  237),
                                                              image: DecorationImage(
                                                                  image: NetworkImage(userContent
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
                                                                    "Tsh ${userContent.userList[0].cart[index].productPrice.toString()} x ${userContent.userList[0].cart[index].quantity}",
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
                                                                color: Colors
                                                                    .white54)
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  });
                                                }),
                                              ),
                                            );
                                          }),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Bold(
                                            text: "Total Amount", size: 20),
                                        Regular(
                                            text:
                                                "Tsh ${userContent.userList[0].cart.fold(0, (sum, element) {
                                              return sum +
                                                  (element.totalProductPrice);
                                            }).toString()}/=",
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
                                          color: Colors.blue,
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
                                          ]),
                                    ),
                                  )
                                ],
                              ))),
                ],
              );
      }),
    );
  }
}
