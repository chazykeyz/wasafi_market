import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasafi_market/controllers/shop.dart';
import 'package:wasafi_market/widgets/avatar.dart';
import 'package:wasafi_market/widgets/product_card.dart';
import 'package:wasafi_market/widgets/text/bold.dart';
import 'package:wasafi_market/widgets/text/regular.dart';

class SellerProfile extends StatelessWidget {
  const SellerProfile({Key? key, this.userId}) : super(key: key);
  final dynamic userId;

  @override
  Widget build(BuildContext context) {
    Get.find<ShopController>().getShop(userId);
    return Scaffold(
        backgroundColor: Colors.black,
        body: GetBuilder<ShopController>(
          builder: (shopDetail) {
            var data = shopDetail.shopDetails;
            return (data.isEmpty
                ? const Center(
                    child: CupertinoActivityIndicator(color: Colors.white),
                  )
                : CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        centerTitle: false,
                        pinned: true,
                        backgroundColor: Colors.black,
                        automaticallyImplyLeading: false,
                        title: Row(children: [
                          GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Center(
                                child: Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    child: const Icon(
                                      CupertinoIcons.chevron_back,
                                      size: 30,
                                    )),
                              )),
                          Bold(text: data[0].shopName, size: 23)
                        ]),
                      ),
                      SliverToBoxAdapter(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 40),
                              child: AvatarCircle(
                                  width: 100,
                                  height: 100,
                                  thumbnail: data[0].profilePicture),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        children: [
                                          Bold(
                                              text: data[0]
                                                  .products
                                                  .length
                                                  .toString(),
                                              size: 16),
                                          const Regular(
                                              text: "Products",
                                              size: 15,
                                              color: Colors.white54)
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Bold(
                                              text: data[0]
                                                  .followers
                                                  .length
                                                  .toString(),
                                              size: 16),
                                          const Regular(
                                              text: "Subscribers",
                                              size: 15,
                                              color: Colors.white54)
                                        ],
                                      ),
                                      Column(
                                        children: const [
                                          Bold(text: "567", size: 16),
                                          Regular(
                                              text: "Products",
                                              size: 15,
                                              color: Colors.white54)
                                        ],
                                      )
                                    ],
                                  ),
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 4, horizontal: 10),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 40),
                                    height: 34,
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.white12),
                                        color: const Color.fromARGB(
                                            68, 36, 80, 157),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: const Center(
                                      child: Regular(
                                        color: Colors.white,
                                        text: "Subscribe",
                                        size: 15,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Regular(
                                text: data[0].shopCategory.name,
                                size: 16,
                                color: Colors.white,
                              ),
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
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        width: 1, color: Colors.white10),
                                    color:
                                        const Color.fromARGB(38, 68, 137, 255)),
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
                                                  color: Colors.white70),
                                              const Regular(
                                                  text: "...",
                                                  size: 14,
                                                  color: Colors.white70)
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
                                          color: Colors.white70)
                                    ],
                                  )
                                ]),
                              ),
                              Center(
                                child: Container(
                                  height: .5,
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  width:
                                      MediaQuery.of(context).size.width - 100,
                                  color: Colors.white24,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
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
                                    isFlash: 0, data: data[0].products[index]);
                              }, childCount: 10),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                              ))
                    ],
                  ));
          },
        ));
  }
}
