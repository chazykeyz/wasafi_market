import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasafi_market/widgets/product_card.dart';
import 'package:wasafi_market/widgets/text/bold.dart';
import 'package:wasafi_market/widgets/text/regular.dart';

class CategoryDetail extends StatelessWidget {
  const CategoryDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.black,
              pinned: true,
              elevation: 0,
              collapsedHeight: 70,
              automaticallyImplyLeading: false,
              title: Row(children: [
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
                          )),
                    )),
                const Bold(
                  text: "Women Clothes",
                  size: 18,
                ),
              ]),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 35,
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: ListView.builder(
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        decoration: BoxDecoration(
                            color: Colors.blueAccent.withOpacity(.2),
                            border: Border.all(
                                width: 1,
                                color: Colors.blueAccent.withOpacity(.3)),
                            borderRadius: BorderRadius.circular(15)),
                        child: const Center(
                          child: Regular(
                            color: Colors.white,
                            text: "Shoes",
                            size: 16,
                          ),
                        ),
                      );
                    }),
              ),
            ),
            SliverGrid(
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return const ProductCard(isFlash: 0, data: {});
                }, childCount: 10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                ))
          ],
        ));
  }
}
