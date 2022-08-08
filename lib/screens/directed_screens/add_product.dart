import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:wasafi_market/controllers/products.dart';
import 'package:wasafi_market/controllers/shop.dart';
import 'package:wasafi_market/screens/directed_screens/add_items.dart';
import 'package:wasafi_market/screens/directed_screens/editing_items.dart';
import 'package:wasafi_market/widgets/text/bold.dart';
import 'package:wasafi_market/widgets/text/regular.dart';

class ProductManagement extends StatefulWidget {
  const ProductManagement({Key? key}) : super(key: key);

  @override
  State<ProductManagement> createState() => _ProductManagementState();
}

class _ProductManagementState extends State<ProductManagement> {
  bool isEmpty = true;

  @override
  Widget build(BuildContext context) {
    dynamic shopId = Get.arguments;

    Get.find<ShopController>().getShop(shopId.id);

    void addItem(content) {
      showModalBottomSheet(
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
          isDismissible: false,
          context: context,
          builder: (context) {
            return Builder(builder: (context) {
              return StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                return Container(
                  margin: const EdgeInsets.only(top: 100),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child:
                          AddItems(userId: content.user.id, shopId: shopId.id)),
                );
              });
            });
          });
    }

// editing products
    void editingItem(
      product,
      content,
    ) {
      showModalBottomSheet(
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
          isDismissible: false,
          context: context,
          builder: (context) {
            return Builder(builder: (context) {
              return StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                return Container(
                  margin: const EdgeInsets.only(top: 100),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: EditingItems(
                        userId: content.user.id,
                        product: product,
                        shopId: shopId.id,
                      )),
                );
              });
            });
          });
    }

    // posting images
    void deleteProduct(id, context) {
      showModalBottomSheet(
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) {
            return Builder(builder: (context) {
              return StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                return BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                      height: 240,
                      padding: const EdgeInsets.all(20),
                      width: MediaQuery.of(context).size.width,
                      child: Column(children: [
                        Container(
                          height: 100,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 41, 41, 41),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Container(
                                    height: 50,
                                    decoration: const BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                width: 1,
                                                color: Colors.white24))),
                                    child: const Center(
                                        child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 30),
                                      child: Text(
                                        "Would you like to delete this product?This product will be deleted permanetly.",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: Colors.white54),
                                      ),
                                    )),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.find<ProductsController>()
                                        .deletingProduct(id);

                                    Get.find<ShopController>()
                                        .getShop(shopId.id)
                                        .then((value) => Get.back());
                                  },
                                  child: SizedBox(
                                    height: 50,
                                    child: GetBuilder<ProductsController>(
                                        builder: (productContent) {
                                      return productContent.isLoading
                                          ? const Center(
                                              child: CupertinoActivityIndicator(
                                                color: Colors.blue,
                                              ),
                                            )
                                          : const Center(
                                              child: Regular(
                                                  text: "Delete",
                                                  size: 16,
                                                  color: Colors.red));
                                    }),
                                  ),
                                ),
                              ]),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            height: 50,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 41, 41, 41),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                                child: Regular(
                                    text: "Cancel",
                                    size: 16,
                                    color: Colors.blue)),
                          ),
                        ),
                      ])),
                );
              });
            });
          });
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: GetBuilder<ShopController>(builder: (shopContent) {
        return shopContent.shopDetails.isEmpty
            ? const Center(
                child: CupertinoActivityIndicator(
                  color: Colors.blueAccent,
                  radius: 14,
                ),
              )
            : CustomScrollView(slivers: [
                SliverAppBar(
                  backgroundColor: Colors.transparent,
                  title: const Bold(
                    text: "Products",
                    size: 24,
                  ),
                  centerTitle: false,
                  automaticallyImplyLeading: false,
                  leading: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Center(
                        child: Container(
                            margin: const EdgeInsets.all(5),
                            child: const Icon(
                              CupertinoIcons.chevron_back,
                              size: 30,
                              color: Colors.blue,
                            )),
                      )),
                  leadingWidth: 20,
                  actions: [
                    GestureDetector(
                        onTap: () {
                          addItem(shopContent.shopDetails[0]);
                        },
                        child: Container(
                            margin: const EdgeInsets.all(5),
                            width: 47,
                            child: Stack(children: [
                              Container(
                                margin: const EdgeInsets.only(top: 8),
                                child: const Icon(
                                  CupertinoIcons.plus,
                                  color: Colors.blue,
                                ),
                              ),
                            ])))
                  ],
                  pinned: true,
                  bottom: (PreferredSize(
                      child: Container(
                        color: const Color.fromARGB(14, 255, 255, 255),
                        height: 1.0,
                      ),
                      preferredSize: const Size.fromHeight(1.0))),
                  floating: false,
                  expandedHeight: 100,
                  collapsedHeight: 70,
                  flexibleSpace: FlexibleSpaceBar(
                    background: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Column(children: [
                        const SizedBox(
                          height: 90,
                          width: 10,
                        ),
                        Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width - 40,
                          margin: const EdgeInsets.all(4),
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: Colors.white24),
                          child: TextField(
                            onChanged: (value) {
                              if (value != "") {
                                isEmpty = false;
                                setState(() {});
                              } else {
                                isEmpty = true;
                                setState(() {});
                              }
                            },
                            style: const TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintStyle: TextStyle(color: Colors.white),
                                hintText: 'Search '),
                          ),
                        ),
                      ]),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Bold(text: "Products", size: 18),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height - 240,
                        child: MediaQuery.removePadding(
                          removeTop: true,
                          context: context,
                          child: shopContent.shopDetails[0].products.isEmpty
                              ? const Center(
                                  child: Regular(
                                    color: Colors.blue,
                                    text:
                                        "There is no product added yet.Add one right now",
                                    size: 14,
                                  ),
                                )
                              : ListView.separated(
                                  separatorBuilder: (context, index) =>
                                      const Divider(
                                          color: Colors.white30, height: 1),
                                  scrollDirection: Axis.vertical,
                                  itemCount: shopContent
                                      .shopDetails[0].products.length,
                                  itemBuilder: (context, index) {
                                    return Slidable(
                                      key: const ValueKey(0),
                                      endActionPane: ActionPane(
                                          motion: const ScrollMotion(),
                                          // A pane can dismiss the Slidable.

                                          children: [
                                            SlidableAction(
                                              onPressed: (context) {
                                                editingItem(
                                                    shopContent.shopDetails[0]
                                                        .products[index],
                                                    shopContent.shopDetails[0]);
                                              },
                                              backgroundColor:
                                                  Colors.blueAccent,
                                              foregroundColor: Colors.white,
                                              icon: CupertinoIcons.pencil,
                                              label: 'Edit',
                                            ),
                                            SlidableAction(
                                              onPressed: (context) {
                                                deleteProduct(
                                                    shopContent.shopDetails[0]
                                                        .products[index].id,
                                                    context);
                                              },
                                              backgroundColor: Colors.redAccent,
                                              foregroundColor: Colors.white,
                                              icon: CupertinoIcons.delete,
                                              label: 'Delete',
                                            ),
                                          ]),
                                      child: InkWell(
                                        onTap: () {
                                          editingItem(
                                              shopContent.shopDetails[0]
                                                  .products[index],
                                              shopContent.shopDetails[0]);
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5),
                                          child: ListTile(
                                            leading: Container(
                                                width: 58,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  border: Border.all(
                                                      color: Colors.white12),
                                                  color: const Color.fromARGB(
                                                      36, 238, 237, 237),
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                          shopContent
                                                              .shopDetails[0]
                                                              .products[index]
                                                              .thumbnail[0]),
                                                      fit: BoxFit.cover),
                                                )),
                                            title: Bold(
                                              text: shopContent.shopDetails[0]
                                                  .products[index].name,
                                              size: 14,
                                            ),
                                            subtitle: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Regular(
                                                    text:
                                                        "Tsh ${shopContent.shopDetails[0].products[index].price.toString()} /= ",
                                                    size: 14,
                                                    color: Colors.white54),
                                                shopContent
                                                            .shopDetails[0]
                                                            .products[index]
                                                            .remainedStock !=
                                                        0
                                                    ? Regular(
                                                        text: shopContent
                                                            .shopDetails[0]
                                                            .products[index]
                                                            .remainedStock
                                                            .toString(),
                                                        size: 14,
                                                        color: Colors.white54)
                                                    : const Regular(
                                                        text: "out of Stock",
                                                        size: 14,
                                                        color: Colors.white54)
                                              ],
                                            ),
                                            trailing: const Icon(
                                              CupertinoIcons.chevron_forward,
                                              size: 16,
                                              color: Colors.white54,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                        ),
                      ),
                    ],
                  ),
                )
              ]);
      }),
    );
  }
}
