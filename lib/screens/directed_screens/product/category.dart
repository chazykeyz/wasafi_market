import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasafi_market/controllers/products.dart';
import 'package:wasafi_market/widgets/loads/main_loader.dart';
import 'package:wasafi_market/widgets/product/product_card.dart';
import 'package:wasafi_market/widgets/text/bold.dart';

class CategoryDetail extends StatelessWidget {
  const CategoryDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dynamic data = Get.arguments;
    return Scaffold(
        backgroundColor: Colors.black,
        body: GetBuilder<ProductsController>(builder: (productData) {
          return productData.isLoading
              ? const MainLoader()
              : CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                        child: Stack(children: [
                      Image(
                        width: MediaQuery.of(context).size.width,
                        height: 350,
                        image: NetworkImage(data.thumbnail),
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        left: 0,
                        top: 0,
                        child: Container(
                          padding: const EdgeInsets.only(bottom: 40),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                Colors.black,
                                Colors.black.withOpacity(0.2)
                              ])),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "${data.name} category",
                                  style: const TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white),
                                ),
                                const Center(
                                  child: SizedBox(
                                    width: 230,
                                    child: Text(
                                        "Buy and sell  product with the Number one online Mall",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                        )),
                                  ),
                                ),
                              ]),
                        ),
                      ),
                      Positioned(
                        top: 50,
                        left: 10,
                        child: GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.white30,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Center(
                              child: Icon(
                                CupertinoIcons.chevron_back,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      )
                    ])),
                    productData.searchedProductList.isEmpty
                        ? SliverToBoxAdapter(
                            child: Container(
                              margin: const EdgeInsets.only(top: 100),
                              height: MediaQuery.of(context).size.height,
                              child: Center(
                                child: Column(children: const [
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
        }));
  }
}
