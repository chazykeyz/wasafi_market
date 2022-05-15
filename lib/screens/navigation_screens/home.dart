import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasafi_market/controllers/products.dart';
import 'package:wasafi_market/screens/directed_screens/category.dart';
import 'package:wasafi_market/widgets/category_card.dart';
import 'package:wasafi_market/widgets/loads/product.dart';
import 'package:wasafi_market/widgets/product_card.dart';
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
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.black,
            pinned: true,
            automaticallyImplyLeading: false,
            title: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Bold(text: "Wasafi", size: 20)),
            bottom: (PreferredSize(
                child: Container(
                  color: const Color.fromARGB(14, 255, 255, 255),
                  height: 1.0,
                ),
                preferredSize: const Size.fromHeight(1.0))),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    CupertinoIcons.bell,
                    color: Colors.white,
                    size: 26,
                  ))
            ],
          ),
          SliverToBoxAdapter(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  child: Bold(
                    text: "Stories",
                    size: 18,
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
                            ),
                            SizedBox(
                              height: 230,
                              child: ListView.builder(
                                  itemCount: controllerData.productList.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (BuildContext context, index) {
                                    return ProductCard(
                                        isFlash: 0,
                                        data:
                                            controllerData.productList[index]);
                                  }),
                            ),
                          ]),
              );
            },
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
                            ),
                            SizedBox(
                              height: 230,
                              child: ListView.builder(
                                  itemCount: controllerData.productList.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (BuildContext context, index) {
                                    return ProductCard(
                                        isFlash: 0,
                                        data:
                                            controllerData.productList[index]);
                                  }),
                            ),
                          ]),
              );
            },
          ),
        ],
      ),
    );
  }
}
