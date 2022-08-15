import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasafi_market/controllers/products.dart';
import 'package:wasafi_market/screens/directed_screens/product/category.dart';
import 'package:wasafi_market/widgets/text/regular.dart';

class CatergoryCard extends StatelessWidget {
  const CatergoryCard({Key? key, required this.data}) : super(key: key);
  final dynamic data;

  @override
  Widget build(BuildContext context) {
    ProductsController productsController = Get.find<ProductsController>();

    return InkWell(
      onTap: () {
        productsController.searchProducts(data.id);
        Get.to(() => const CategoryDetail(), arguments: data);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          Center(
            child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: const Color.fromARGB(41, 238, 237, 237),
                  image: DecorationImage(
                      image: NetworkImage(data.thumbnail), fit: BoxFit.cover),
                )),
          ),
          Container(
            constraints: const BoxConstraints(minWidth: 100),
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 8,
            ),
            margin: const EdgeInsets.only(top: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white10),
            child: Center(
              child: Regular(
                text: data.name,
                size: 12,
                color: Colors.white,
              ),
            ),
          )
        ]),
      ),
    );
  }
}
