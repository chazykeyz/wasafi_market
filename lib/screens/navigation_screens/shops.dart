import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasafi_market/controllers/shop.dart';
import 'package:wasafi_market/widgets/seller.dart';
import 'package:wasafi_market/widgets/text/bold.dart';

class Shops extends StatelessWidget {
  const Shops({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<ShopController>().getShops();
    Get.find<ShopController>().getShopCategory();
    return CustomScrollView(slivers: [
      const SliverAppBar(
        centerTitle: false,
        pinned: true,
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: Bold(text: "Shops", size: 26),
      ),
      SliverToBoxAdapter(
          child: GetBuilder<ShopController>(builder: (shopCategories) {
        var filterShop = shopCategories.shopCategoryList
            .where((category) => category.shops.length != 0)
            .toList();

        return SizedBox(
          height: MediaQuery.of(context).size.height - 50,
          child: MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: ListView.builder(
                itemCount: filterShop.length,
                itemBuilder: (context, index) {
                  return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ListTile(
                            title: Bold(text: filterShop[index].name, size: 17),
                            trailing: const Icon(
                              CupertinoIcons.chevron_right,
                              color: Colors.blue,
                              size: 20,
                            )),
                        SizedBox(
                            height: 130,
                            child: ListView.builder(
                                itemCount: filterShop[index].shops.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, shopIndex) {
                                  return Seller(
                                    data: filterShop[index].shops[shopIndex],
                                  );
                                })),
                      ]);
                }),
          ),
        );
      })),
    ]);
  }
}
