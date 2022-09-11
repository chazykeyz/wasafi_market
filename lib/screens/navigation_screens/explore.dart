import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:wasafi_market/controllers/products.dart';
import 'package:wasafi_market/controllers/shop.dart';
import 'package:wasafi_market/screens/directed_screens/user/search.dart';
import 'package:wasafi_market/widgets/loads/main_loader.dart';
import 'package:wasafi_market/widgets/product/product_card.dart';
import 'package:wasafi_market/widgets/seller.dart';
import 'package:wasafi_market/widgets/text/bold.dart';
import 'package:wasafi_market/widgets/text/regular.dart';

class Explore extends StatelessWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<ShopController>().getShops();
    Get.find<ProductsController>().trendingProductList();
    return GetBuilder<ProductsController>(builder: (productData) {
      return productData.isLoading == true
          ? const MainLoader()
          : CustomScrollView(
              slivers: [
                // appbar and search
                SliverAppBar(
                  pinned: true,
                  backgroundColor: Colors.black,
                  centerTitle: false,
                  collapsedHeight: 100,
                  expandedHeight: 400,
                  floating: false,
                  flexibleSpace: FlexibleSpaceBar(
                    expandedTitleScale: 1,
                    collapseMode: CollapseMode.parallax,
                    title: Container(
                      height: 48,
                      margin: const EdgeInsets.only(
                        bottom: 20,
                        left: 30,
                        right: 30,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaY: 10, sigmaX: 10),
                          child: Container(
                            color: Colors.white12,
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(4),
                                    child: const Icon(
                                      CupertinoIcons.search,
                                      size: 30,
                                      color: Colors.white60,
                                    ),
                                  ),
                                  const Regular(
                                    color: Colors.white70,
                                    text: "Products, Shops and More",
                                    size: 14,
                                  ),
                                ]),
                          ),
                        ),
                      ),
                    ),
                    background: Stack(children: [
                      Image(
                        width: MediaQuery.of(context).size.width,
                        image: const NetworkImage(
                            "https://images.unsplash.com/photo-1579783902614-a3fb3927b6a5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=890&q=80"),
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        left: 0,
                        top: 0,
                        child: Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                Colors.black,
                                Colors.black.withOpacity(0.2)
                              ])),
                          child: InkWell(
                            onTap: () {
                              Get.to(() => const Search());
                            },
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Explore Wasafi Mall",
                                    style: TextStyle(
                                        fontSize: 26,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.white),
                                  ),
                                  const Center(
                                    child: SizedBox(
                                      width: 230,
                                      child: Text(
                                          "Buy and sell  product with the Number one online",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          )),
                                    ),
                                  ),
                                  Container(
                                    height: 42,
                                    width: 200,
                                    margin: const EdgeInsets.only(top: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      color: Colors.blue,
                                    ),
                                    child: const Center(
                                      child: Text(
                                        "Try It Now",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ]),
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
                // trending shops
                GetBuilder<ShopController>(
                  builder: (shops) {
                    int limit = shops.shopList.length ~/ 3;
                    return SliverToBoxAdapter(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ListTile(
                              title: Row(
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.only(right: 8.0),
                                    child: Icon(
                                      CupertinoIcons.checkmark_seal_fill,
                                      color: Colors.white38,
                                    ),
                                  ),
                                  Bold(text: "Trending Shops", size: 15)
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 245,
                              width: MediaQuery.of(context).size.width,
                              child: Swiper(
                                outer: false,
                                viewportFraction: 0.94,
                                loop: false,
                                itemBuilder: (context, swiperIndex) {
                                  List slicedShops = shops.shopList.sublist(
                                      swiperIndex * 3, ((swiperIndex + 1) * 3));

                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: slicedShops.map((element) {
                                      var index = slicedShops.indexOf(element);
                                      return Seller(
                                          data: slicedShops[index],
                                          endIndex: index);
                                    }).toList(),
                                  );
                                },
                                itemCount: limit,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 8),
                              color: Colors.white12,
                              height: 1.0,
                            )
                          ]),
                    );
                  },
                ),
                // trending products
                GetBuilder<ProductsController>(builder: (productData) {
                  var products = productData.trendingList.toList();

                  return SliverToBoxAdapter(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          products.isEmpty
                              ? const SizedBox(
                                  height: 0,
                                )
                              : Row(
                                  children: const [
                                    Padding(
                                      padding: EdgeInsets.only(right: 8.0),
                                      child: Icon(
                                        CupertinoIcons.checkmark_seal_fill,
                                        color: Colors.white38,
                                      ),
                                    ),
                                    Bold(text: "Trending Products", size: 15)
                                  ],
                                ),
                          SizedBox(
                            height: products.isEmpty ? 0 : 230,
                            child: ListView.builder(
                                itemCount: products.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder:
                                    (BuildContext context, productIndex) {
                                  return ProductCard(
                                      isFlash: 0, data: products[productIndex]);
                                }),
                          ),
                        ]),
                  );
                }),
                // spacer
                const SliverToBoxAdapter(
                  child: SizedBox(height: 70),
                )
              ],
            );
    });
  }
}
