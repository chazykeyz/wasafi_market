import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasafi_market/controllers/product_category.dart';
import 'package:wasafi_market/controllers/products.dart';
import 'package:wasafi_market/widgets/product_card.dart';
import 'package:wasafi_market/widgets/text/bold.dart';
import 'package:wasafi_market/widgets/text/regular.dart';

class CategoryDetail extends StatelessWidget {
  const CategoryDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductsController productsController = Get.find<ProductsController>();

    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: GetBuilder<ProductsController>(builder: (productData) {
          return productData.isLoading
              ? const Center(
                  child: CupertinoActivityIndicator(color: Colors.white),
                )
              : CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Row(children: [
                        GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Center(
                              child: Container(
                                  margin: const EdgeInsets.all(5),
                                  child: const Icon(
                                    CupertinoIcons.chevron_back,
                                    size: 30,
                                    color: Colors.white,
                                  )),
                            )),
                        const Bold(
                          text: "Categories",
                          size: 18,
                        ),
                      ]),
                    ),
                    GetBuilder<ProductCategoryController>(
                        builder: (categoryData) {
                      return SliverToBoxAdapter(
                        child: Container(
                          height: 40,
                          margin: const EdgeInsets.symmetric(vertical: 20),
                          child: ListView.builder(
                              itemCount:
                                  categoryData.productCategoryList.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    productsController.searchProducts(
                                        categoryData
                                            .productCategoryList[index].id);
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 14),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 2),
                                    decoration: BoxDecoration(
                                        color: productData.searchedProductList
                                                .where((element) =>
                                                    element.category.name ==
                                                    categoryData
                                                        .productCategoryList[
                                                            index]
                                                        .name)
                                                .toList()
                                                .isEmpty
                                            ? Colors.white.withOpacity(.1)
                                            : Colors.blueAccent,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Center(
                                      child: Regular(
                                        color: Colors.white,
                                        text: categoryData
                                            .productCategoryList[index].name,
                                        size: 16,
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      );
                    }),
                    productData.searchedProductList.isEmpty
                        ? SliverToBoxAdapter(
                            child: Container(
                              margin: const EdgeInsets.only(top: 100),
                              height: MediaQuery.of(context).size.height,
                              child: Center(
                                child: Column(children: const [
                                  Image(
                                      image: NetworkImage(
                                          "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEg-MIhuOKvFYYe7h5eYODwqUQ9TZ3qve6Pc3E-wEnhkaaN8UMNa9UoblSKxLFJG3U3trl4ZQviVJ6GP0_wWon6MUbMSckP2lfOBfQaeMakfCSCIE68o7Sm_CNf4HuDXaVX0JZFHK3zBpudYs7IZ97-8pZ9aWyTl7ZrJXjJXwm1Bmjz6UYO6DeoLhRbB/s320/dsfsd.png")),
                                  Bold(
                                      text:
                                          "There no products in this category!",
                                      size: 14),
                                ]),
                              ),
                            ),
                          )
                        : SliverGrid(
                            delegate: SliverChildBuilderDelegate(
                                (BuildContext context, int productIndex) {
                              return ProductCard(
                                  isFlash: 0,
                                  data: productData
                                      .searchedProductList[productIndex]);
                            },
                                childCount:
                                    productData.searchedProductList.length),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                            ))
                  ],
                );
        })));
  }
}
