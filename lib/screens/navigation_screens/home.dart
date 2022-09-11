import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasafi_market/controllers/product_category.dart';
import 'package:wasafi_market/controllers/products.dart';
import 'package:wasafi_market/controllers/stories.dart';
import 'package:wasafi_market/screens/directed_screens/product/blackfriday.dart';
import 'package:wasafi_market/screens/directed_screens/product/category.dart';
import 'package:wasafi_market/widgets/background.dart';
import 'package:wasafi_market/widgets/product/category_card.dart';
import 'package:wasafi_market/widgets/loads/main_loader.dart';
import 'package:wasafi_market/widgets/loads/product.dart';
import 'package:wasafi_market/widgets/product/product_card.dart';
import 'package:wasafi_market/widgets/promo/card.dart';
import 'package:wasafi_market/widgets/stories_card.dart';
import 'package:wasafi_market/widgets/text/bold.dart';
import 'package:wasafi_market/widgets/text/regular.dart';

import '../../widgets/text_tile.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GetBuilder<ProductCategoryController>(builder: (categories) {
        return categories.isLoading
            ? const MainLoader()
            : CustomScrollView(
                slivers: [
                  SliverAppBar(
                    backgroundColor: Colors.transparent,
                    pinned: true,
                    toolbarHeight: 10,
                    flexibleSpace: FlexibleSpaceBar(
                      background: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: const SizedBox(
                          height: 30,
                        ),
                      ),
                    ),
                    automaticallyImplyLeading: false,
                    bottom: (PreferredSize(
                        child: Container(
                          color: const Color.fromARGB(14, 255, 255, 255),
                          height: 1.0,
                        ),
                        preferredSize: const Size.fromHeight(1.0))),
                  ),

                  //  STORIES
                  GetBuilder<StoriesController>(builder: (storiesContent) {
                    return SliverToBoxAdapter(
                      child: SizedBox(
                        height: 220,
                        child: Stack(children: [
                          const Background(),
                          const Padding(
                            padding: EdgeInsets.all(8),
                            child: Bold(text: "Stories", size: 18),
                          ),
                          storiesContent.isLoading
                              ? const Center(
                                  child: Regular(
                                      text: "loading",
                                      size: 12,
                                      color: Colors.red),
                                )
                              : storiesContent.stories.isEmpty
                                  ? const Center(
                                      child: Regular(
                                      text: "No stories Found!",
                                      size: 14,
                                      color: Colors.white54,
                                    ))
                                  : Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                          const SizedBox(
                                            height: 35,
                                          ),
                                          SizedBox(
                                            height: 170,
                                            child: ListView.builder(
                                                itemCount: storiesContent
                                                    .stories.length,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        index) {
                                                  return Status(
                                                      data: storiesContent
                                                          .stories[index],
                                                      allData: storiesContent
                                                          .stories,
                                                      index: index);
                                                }),
                                          ),
                                        ]),
                        ]),
                      ),
                    );
                  }),
                  // CATEGORIES
                  SliverToBoxAdapter(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8),
                            child: Bold(text: "Categories", size: 18),
                          ),
                          SizedBox(
                            height: 145,
                            child: ListView.builder(
                                itemCount:
                                    categories.productCategoryList.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, index) {
                                  return CatergoryCard(
                                      data: categories
                                          .productCategoryList[index]);
                                }),
                          ),
                        ]),
                  ),
                  // FRIDAY VIBE SALES
                  GetBuilder<ProductsController>(
                    builder: (controllerData) {
                      List<dynamic> flashedData = controllerData.productList
                          .where((element) => element.discount != 0)
                          .toList();

                      return SliverToBoxAdapter(
                        child: controllerData.isLoading
                            ? const ProductLoader()
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    ListTile(
                                      title: const Bold(
                                          text: "Friday Vibe", size: 17),
                                      trailing: GestureDetector(
                                        onTap: () {
                                          Get.to(() => const BlackFriday(),
                                              arguments: flashedData);
                                        },
                                        child: const Regular(
                                          text: "See All",
                                          size: 14,
                                          color: Colors.blueAccent,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 205,
                                      child: ListView.builder(
                                          itemCount: flashedData.length,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder:
                                              (BuildContext context, index) {
                                            return ProductCard(
                                                isFlash: 45,
                                                data: flashedData[index]);
                                          }),
                                    ),
                                  ]),
                      );
                    },
                  ),
                  // PROMO AND OFFERS SALES
                  GetBuilder<ProductsController>(
                    builder: (controllerData) {
                      List<dynamic> flashedData = controllerData.productList
                          .where((element) => element.discount != 0)
                          .toList();

                      return SliverToBoxAdapter(
                        child: controllerData.isLoading
                            ? const ProductLoader()
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    ListTile(
                                      title: const Bold(
                                          text: "Promo & Offers", size: 17),
                                      trailing: GestureDetector(
                                        onTap: () {
                                          Get.to(() => const BlackFriday(),
                                              arguments: flashedData);
                                        },
                                        child: const Regular(
                                          text: "See All",
                                          size: 14,
                                          color: Colors.blueAccent,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 205,
                                      child: ListView.builder(
                                          itemCount: flashedData.length,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder:
                                              (BuildContext context, index) {
                                            return PromoCard(
                                                data: flashedData[index]);
                                          }),
                                    ),
                                  ]),
                      );
                    },
                  ),

                  // TRENDING
                  GetBuilder<ProductsController>(
                    builder: (controllerData) {
                      return SliverToBoxAdapter(
                        child: controllerData.isLoading
                            ? const ProductLoader()
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: const [
                                          Padding(
                                            padding:
                                                EdgeInsets.only(right: 1.0),
                                            child: Icon(
                                              CupertinoIcons.bolt_fill,
                                              color: Colors.white38,
                                            ),
                                          ),
                                          Bold(text: "Trending", size: 17)
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 205,
                                      child: ListView.builder(
                                          itemCount:
                                              controllerData.productList.length,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder:
                                              (BuildContext context, index) {
                                            return ProductCard(
                                                isFlash: 0,
                                                data: controllerData
                                                    .productList[index]);
                                          }),
                                    ),
                                  ]),
                      );
                    },
                  ),
                  //  ALL CATEGORIES
                  SliverList(
                      delegate:
                          SliverChildBuilderDelegate((context, categoryIndex) {
                    return GetBuilder<ProductsController>(
                        builder: (productData) {
                      var products = productData.productList
                          .where((element) =>
                              element.category.id ==
                              categories.productCategoryList[categoryIndex].id)
                          .toList();

                      return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            products.isEmpty
                                ? const SizedBox(
                                    height: 0,
                                  )
                                : TextTile(
                                    argument: categories
                                        .productCategoryList[categoryIndex],
                                    title: categories
                                        .productCategoryList[categoryIndex]
                                        .name,
                                    more: const CategoryDetail(),
                                    isGradient: false,
                                  ),
                            SizedBox(
                              height: products.isEmpty ? 0 : 230,
                              child: ListView.builder(
                                  itemCount: products.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder:
                                      (BuildContext context, productIndex) {
                                    return ProductCard(
                                        isFlash: 0,
                                        data: products[productIndex]);
                                  }),
                            ),
                          ]);
                    });
                  }, childCount: 5))
                ],
              );
      }),
    );
  }
}
