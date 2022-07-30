import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasafi_market/controllers/product_category.dart';
import 'package:wasafi_market/controllers/products.dart';
import 'package:wasafi_market/screens/directed_screens/category.dart';
import 'package:wasafi_market/widgets/category_card.dart';
import 'package:wasafi_market/widgets/loads/main_loader.dart';
import 'package:wasafi_market/widgets/loads/product.dart';
import 'package:wasafi_market/widgets/product_card.dart';
import 'package:wasafi_market/widgets/stories_card.dart';
import 'package:wasafi_market/widgets/text/bold.dart';

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
                  SliverToBoxAdapter(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 8),
                              child: Bold(
                                text: "Stories",
                                size: 20,
                              )),
                          SizedBox(
                            height: 170,
                            child: ListView.builder(
                                itemCount: 6,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, index) {
                                  return const Status();
                                }),
                          ),
                        ]),
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TextTile(
                            title: "Categories",
                            more: CategoryDetail(),
                            isGradient: false,
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
                  GetBuilder<ProductsController>(
                    builder: (controllerData) {
                      return SliverToBoxAdapter(
                        child: controllerData.isLoading
                            ? const ProductLoader()
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    const TextTile(
                                      title: "Trending",
                                      more: CategoryDetail(),
                                      isGradient: false,
                                    ),
                                    SizedBox(
                                      height: 230,
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
                                    const TextTile(
                                      title: "Flash Sales",
                                      more: CategoryDetail(),
                                      isGradient: false,
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
