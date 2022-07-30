import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:wasafi_market/controllers/auth.dart';
import 'package:wasafi_market/controllers/cart.dart';
import 'package:wasafi_market/controllers/user.dart';
import 'package:wasafi_market/main.dart';
import 'package:wasafi_market/models/cart/cart.dart';
import 'package:wasafi_market/screens/free_screens/signup.dart';
import 'package:wasafi_market/widgets/nav_header.dart';
import 'package:wasafi_market/widgets/product_card.dart';
import 'package:wasafi_market/widgets/show_snackbar.dart';
import 'package:wasafi_market/widgets/text/bold.dart';
import 'package:wasafi_market/widgets/text/regular.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({Key? key, required this.data}) : super(key: key);
  final dynamic data;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int size = 0;
  int _color = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (!Get.find<AuthController>().logginUser()) {
        Get.offAll(() => const SignUp(
              signDestination: Parent(
                isFromDetail: true,
                number: 0,
              ),
            ));
      } else {
        Get.find<UserController>().gettingUser();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // add to cart
    void addToCart(item) {
      CartController cartController = Get.find<CartController>();
      CartModel cartModel = CartModel(product: item.id);
      cartController.cartPost(cartModel).then((status) {
        if (status.isSuccess) {
          dynamic name = item.name;
          showCustomSnackBar("$name added to cart", title: "Cart");
          Get.find<UserController>().gettingUser();
        } else {
          showCustomSnackBar("adding cart failed!", title: "Cart");
        }
      });
    }

// remove from cart
    void removeFromCart(item) {
      CartController cartController = Get.find<CartController>();

      cartController.cartItemRemove(item.id).then((status) {
        if (status.isSuccess) {
          dynamic name = item.name;
          showCustomSnackBar("$name successful deleted!", title: "Cart");
          Get.find<UserController>().gettingUser();
        } else {
          showCustomSnackBar("deleting item failed!", title: "Cart");
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
            : CustomScrollView(slivers: [
                NavHeader(
                  userContent: userContent,
                  isPage: false,
                  title: '',
                  noCart: true,
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 300,
                    child: Swiper(
                      autoplay: false,
                      autoplayDelay: 5000,
                      pagination: const SwiperPagination(
                        builder: SwiperPagination.dots,
                      ),
                      loop: true,
                      itemWidth: MediaQuery.of(context).size.width,
                      itemBuilder: (BuildContext context, int index) {
                        return Center(
                          child: Image.network(
                            widget.data.thumbnail[index],
                            fit: BoxFit.fill,
                          ),
                        );
                      },
                      itemCount: widget.data.thumbnail.length,
                    ),
                  ),
                ),
                // upper side of ui the title of product and share button
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // title
                            Bold(text: widget.data.name, size: 22),
                            // share product
                            GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: Center(
                                  child: Container(
                                      margin: const EdgeInsets.all(5),
                                      width: 47,
                                      height: 47,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(28),
                                          color: Colors.white24),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(28),
                                        child: const Icon(
                                          CupertinoIcons.share,
                                          color: Colors.white,
                                        ),
                                      )),
                                )),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Regular(
                              text: widget.data.description,
                              size: 16,
                              color: Colors.white),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            children: [
                              const Bold(text: "Tsh ", size: 20),
                              Bold(
                                  text: widget.data.price.toString(), size: 20),
                              widget.data.discount != 0
                                  ? Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child:
                                          Text(widget.data.discount.toString(),
                                              style: const TextStyle(
                                                fontSize: 18,
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                color: Colors.white54,
                                              )),
                                    )
                                  : const Text("")
                            ],
                          ),
                        ),
                        Center(
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 20),
                            height: .5,
                            width: MediaQuery.of(context).size.width,
                            color: Colors.white24,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                // sizes
                SliverToBoxAdapter(
                  child: widget.data.size.length == 0
                      ? const SizedBox(
                          height: 0,
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Bold(text: "Size", size: 16),
                                SizedBox(
                                  height: 50,
                                  child: ListView.builder(
                                      itemCount: widget.data.size.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Center(
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                size = index;
                                              });
                                            },
                                            child: Container(
                                              margin: const EdgeInsets.all(3),
                                              padding: const EdgeInsets.all(10),
                                              height: 40,
                                              constraints: const BoxConstraints(
                                                  minWidth: 40),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 1,
                                                      color: size == index
                                                          ? Colors.blueAccent
                                                          : Colors.transparent),
                                                  color: const Color.fromARGB(
                                                      41, 33, 149, 243),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              child: Center(
                                                child: Regular(
                                                  color: Colors.white,
                                                  text: widget
                                                      .data.size[index].size,
                                                  size: 14,
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                )
                              ]),
                        ),
                ),
                // color
                SliverToBoxAdapter(
                  child: widget.data.color.length == 0
                      ? const SizedBox(
                          height: 0,
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 8),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Bold(text: "Color", size: 16),
                                SizedBox(
                                  height: 50,
                                  child: ListView.builder(
                                      itemCount: widget.data.color.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Center(
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                _color = index;
                                              });
                                            },
                                            child: Center(
                                              child: Container(
                                                margin: const EdgeInsets.all(3),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8),
                                                constraints:
                                                    const BoxConstraints(
                                                        maxHeight: 32,
                                                        minWidth: 38),
                                                decoration: BoxDecoration(
                                                    color: _color == index
                                                        ? Colors.blueAccent
                                                        : Colors.white
                                                            .withOpacity(.2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            14)),
                                                child: const Center(
                                                  child: Regular(
                                                      text: "Orange",
                                                      size: 12,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                ),
                                Center(
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 20),
                                    height: .5,
                                    width: MediaQuery.of(context).size.width,
                                    color: Colors.white24,
                                  ),
                                )
                              ]),
                        ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white12,
                        borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    removeFromCart(widget.data);
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.all(4),
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        color: Colors.white54,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: const Center(
                                      child: Regular(
                                        color: Colors.black,
                                        text: "-",
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.all(1),
                                  height: 40,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      color: Colors.white54,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Center(
                                    child: Regular(
                                      color: Colors.black,
                                      text: userContent.userList[0].cart
                                                  .where((item) =>
                                                      item.product.id ==
                                                      widget.data.id)
                                                  .length !=
                                              0
                                          ? userContent.userList[0].cart
                                              .firstWhere((item) =>
                                                  item.product.id ==
                                                  widget.data.id)
                                              .quantity
                                              .toString()
                                          : "0",
                                      size: 20,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    addToCart(widget.data);
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.all(4),
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        color: Colors.white54,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: const Center(
                                      child: Regular(
                                        color: Colors.black,
                                        text: "+",
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                userContent.userList[0].cart
                                            .where((item) =>
                                                item.product.id ==
                                                widget.data.id)
                                            .length ==
                                        0
                                    ? addToCart(widget.data)
                                    : deleteItems(userContent.userList[0].cart
                                        .firstWhere((item) =>
                                            item.product.id == widget.data.id)
                                        .product
                                        .id);
                              },
                              child: Container(
                                margin: const EdgeInsets.all(4),
                                constraints:
                                    const BoxConstraints(minWidth: 200),
                                height: 40,
                                decoration: BoxDecoration(
                                    color: userContent.userList[0].cart
                                                .where((item) =>
                                                    item.product.id ==
                                                    widget.data.id)
                                                .length !=
                                            0
                                        ? Colors.red
                                        : Colors.blue,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Center(
                                  child: Regular(
                                    color: Colors.black,
                                    text: userContent.userList[0].cart
                                                .where((item) =>
                                                    item.product.id ==
                                                    widget.data.id)
                                                .length !=
                                            0
                                        ? "Remove from Cart"
                                        : "Add to cart",
                                    size: 14,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(children: [
                                    Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: const Color.fromARGB(
                                                31, 255, 255, 255),
                                            image: DecorationImage(
                                                image: NetworkImage(widget.data
                                                    .seller.profilePicture),
                                                fit: BoxFit.cover))),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Regular(
                                          text:
                                              widget.data.seller.user.username,
                                          size: 14,
                                          color: Colors.white),
                                    )
                                  ]),
                                  GestureDetector(
                                    onTap: () {
                                      // Get.to(() => more);
                                    },
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: const [
                                        Regular(
                                          text: "See More ",
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
                                ]),
                          ),
                          SizedBox(
                            height: 230,
                            child: ListView.builder(
                                itemCount: widget.data.seller.products.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, index) {
                                  return ProductCard(
                                    isFlash: 0,
                                    data: widget.data.seller.products[index],
                                  );
                                }),
                          ),
                        ]),
                  ),
                ),
                // // SliverToBoxAdapter(
                //   child:
                //       Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                //     const TextTile(
                //       more: CategoryDetail(),
                //       title: "Related",
                //     ),
                //     SizedBox(
                //       height: 230,
                //       child: ListView.builder(
                //           itemCount: 6,
                //           scrollDirection: Axis.horizontal,
                //           itemBuilder: (BuildContext context, index) {
                //             return const ProductCard(isFlash: 0, data: {});
                //           }),
                //     ),
                //   ]),
                // )
              ]);
      }),
    );
  }
}
