import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasafi_market/controllers/product_category.dart';
import 'package:wasafi_market/controllers/products.dart';
import 'package:wasafi_market/controllers/shop.dart';
import 'package:wasafi_market/screens/directed_screens/search.dart';
import 'package:wasafi_market/widgets/product_card.dart';
import 'package:wasafi_market/widgets/seller.dart';
import 'package:wasafi_market/widgets/text/bold.dart';
import 'package:wasafi_market/widgets/text/regular.dart';

class Explore extends StatelessWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<ShopController>().getShops();
    Get.find<ProductsController>().trendingProductList();
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          collapsedHeight: 100,
          backgroundColor: Colors.black,
          centerTitle: false,
          title: const Bold(
            size: 26,
            text: "Explore",
          ),
          flexibleSpace: InkWell(
            onTap: () {
              Get.to(() => const Search());
            },
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              (Container(
                height: 48,
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.white12),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4),
                        child: const Icon(
                          CupertinoIcons.search,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                          width: MediaQuery.of(context).size.width - 50,
                          child: const Regular(
                            color: Colors.white,
                            text: "Search",
                            size: 16,
                          )),
                    ]),
              )),
            ]),
          ),
        ),
        GetBuilder<ShopController>(
          builder: (shops) {
            return SliverToBoxAdapter(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const ListTile(
                        title: Bold(text: "Seller ", size: 16),
                        subtitle: Regular(
                            text: "Trending Seller",
                            size: 14,
                            color: Colors.blueAccent),
                        trailing: Icon(
                          CupertinoIcons.chevron_right,
                          color: Colors.blue,
                          size: 20,
                        )),
                    SizedBox(
                      height: 120,
                      child: ListView.builder(
                          itemCount: shops.shopList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, index) {
                            return Seller(
                              data: shops.shopList[index],
                            );
                          }),
                    ),
                  ]),
            );
          },
        ),
        GetBuilder<ProductCategoryController>(
          builder: (productCategoryData) {
            return productCategoryData.isLoading
                ? const SliverToBoxAdapter(
                    child: Center(
                      child: CupertinoActivityIndicator(color: Colors.white),
                    ),
                  )
                : SliverList(
                    delegate:
                        SliverChildBuilderDelegate((context, categoryIndex) {
                    return GetBuilder<ProductsController>(
                        builder: (productData) {
                      var products = productData.trendingList
                          .where((element) =>
                              element.category.id ==
                              productCategoryData
                                  .productCategoryList[categoryIndex].id)
                          .toList();

                      return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            products.isEmpty
                                ? const SizedBox(
                                    height: 0,
                                  )
                                : ListTile(
                                    leading: Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: const Color.fromARGB(
                                                31, 255, 255, 255),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    productCategoryData
                                                        .productCategoryList[
                                                            categoryIndex]
                                                        .thumbnail),
                                                fit: BoxFit.cover))),
                                    title: Bold(
                                        text: productCategoryData
                                            .productCategoryList[categoryIndex]
                                            .name,
                                        size: 16),
                                    subtitle: const Regular(
                                        text: "Trending Product",
                                        size: 14,
                                        color: Colors.blueAccent),
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
                  }, childCount: 5));
          },
        ),
      ],
    );
  }
}
