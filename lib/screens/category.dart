import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasafi_market/widgets/product_card.dart';
import 'package:wasafi_market/widgets/text/bold.dart';

class CategoryDetail extends StatelessWidget {
  const CategoryDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
                pinned: true,
                elevation: 0,
                expandedHeight: 200,
                collapsedHeight: 70,
                leading: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Center(
                      child: Container(
                          margin: const EdgeInsets.all(5),
                          width: 47,
                          height: 47,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(28),
                              color: Colors.white24),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(28),
                            child: const Icon(CupertinoIcons.chevron_back),
                          )),
                    )),
                flexibleSpace: Stack(children: [
                  // the visible image
                  Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://images.pexels.com/photos/10774229/pexels-photo-10774229.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"),
                            fit: BoxFit.cover)),
                  ),
                  // gradient colors
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                          Colors.black,
                          Colors.black.withOpacity(.3)
                        ])),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Bold(text: "Women Clothes", size: 20),
                          )
                        ]),
                  ),
                ])),
            SliverGrid(
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return const ProductCard();
                }, childCount: 10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                ))
          ],
        ));
  }
}
