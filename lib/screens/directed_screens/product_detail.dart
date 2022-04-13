import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:wasafi_market/screens/directed_screens/category.dart';
import 'package:wasafi_market/screens/directed_screens/seller_profile.dart';
import 'package:wasafi_market/widgets/product_card.dart';
import 'package:wasafi_market/widgets/text/bold.dart';
import 'package:wasafi_market/widgets/text/regular.dart';
import 'package:wasafi_market/widgets/text_tile.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({Key? key}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int size = 0;
  int _color = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(slivers: [
        SliverAppBar(
          backgroundColor: Colors.black,
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
                      child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: const Icon(CupertinoIcons.chevron_back)),
                    )),
              )),
          actions: [
            GestureDetector(
                onTap: () {},
                child: Container(
                    margin: const EdgeInsets.all(5),
                    width: 47,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28),
                        color: Colors.white24),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(28),
                      child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: const Icon(CupertinoIcons.hand_thumbsup)),
                    )))
          ],
          pinned: true,
          floating: true,
          expandedHeight: MediaQuery.of(context).size.width + 20,
          collapsedHeight: 60,
          flexibleSpace: FlexibleSpaceBar(
            background: Swiper(
              autoplay: true,
              autoplayDelay: 2000,
              loop: true,
              itemWidth: MediaQuery.of(context).size.width,
              itemBuilder: (BuildContext context, int index) {
                return Stack(children: [
                  // the blurred image
                  ClipRRect(
                    child: Container(
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://images.unsplash.com/photo-1649789248266-ef1c7f744f6f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2940&q=80"),
                              fit: BoxFit.cover)),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
                        child: Container(),
                      ),
                    ),
                  ),
                  // the visible image
                  Center(
                    child: Image.network(
                      "https://images.unsplash.com/photo-1649789248266-ef1c7f744f6f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2940&q=80",
                      fit: BoxFit.fill,
                    ),
                  ),
                  // gradient colors
                  Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                          Colors.black,
                          Colors.black.withOpacity(0)
                        ])),
                  )
                ]);
              },
              itemCount: 3,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Bold(text: "Maniac Red Boys", size: 22),
                    GestureDetector(
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
                                child: const Icon(
                                  CupertinoIcons.share,
                                  color: Colors.white,
                                ),
                              )),
                        )),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Regular(
                      text:
                          "Children’s clothing/ kids wear is usually more casual than adult clothing, fit play and rest. Hosiery is usually used. More recently, however, tons of childrenswear is heavily influenced by trends in adult fashion",
                      size: 16,
                      color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: const [
                      Bold(text: "Tsh 1,000,000", size: 20),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text("Tsh 1,000,000",
                            style: TextStyle(
                              fontSize: 18,
                              decoration: TextDecoration.lineThrough,
                              color: Colors.white54,
                            )),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    height: .5,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white24,
                  ),
                )
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Bold(text: "Size", size: 16),
              SizedBox(
                height: 50,
                child: ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Center(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              size = index;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.all(3),
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1,
                                    color: size == index
                                        ? Colors.blueAccent
                                        : Colors.transparent),
                                color: const Color.fromARGB(41, 33, 149, 243),
                                borderRadius: BorderRadius.circular(20)),
                            child: const Center(
                              child: Regular(
                                color: Colors.white,
                                text: "XL",
                                size: 14,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              )
            ]),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Bold(text: "Color", size: 16),
              SizedBox(
                height: 50,
                child: ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Center(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _color = index;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.all(3),
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1,
                                    color: _color == index
                                        ? Colors.blueAccent
                                        : Colors.transparent),
                                color: const Color.fromARGB(41, 33, 149, 243),
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: Container(
                                height: 38,
                                width: 38,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 3, color: Colors.black),
                                    color:
                                        const Color.fromARGB(41, 243, 96, 33),
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              Center(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  height: .5,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white24,
                ),
              )
            ]),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white12, borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(4),
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: Colors.white54,
                              borderRadius: BorderRadius.circular(20)),
                          child: const Center(
                            child: Regular(
                              color: Colors.black,
                              text: "-",
                              size: 20,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(1),
                          height: 40,
                          width: 60,
                          decoration: BoxDecoration(
                              color: Colors.white54,
                              borderRadius: BorderRadius.circular(20)),
                          child: const Center(
                            child: Regular(
                              color: Colors.black,
                              text: "0",
                              size: 20,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(4),
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: Colors.white54,
                              borderRadius: BorderRadius.circular(20)),
                          child: const Center(
                            child: Regular(
                              color: Colors.black,
                              text: "+",
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.all(4),
                      padding: const EdgeInsets.symmetric(horizontal: 60),
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Center(
                        child: Regular(
                          color: Colors.black,
                          text: "Add to Cart",
                          size: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                const Bold(text: "OR", size: 18),
                Container(
                  margin: const EdgeInsets.all(4),
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  height: 44,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(16)),
                  child: const Center(
                    child: Regular(
                      color: Colors.black,
                      text: "Buy Now",
                      size: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const TextTile(
              more: SellerProfile(),
              title: "Chazy Keyz",
            ),
            SizedBox(
              height: 230,
              child: ListView.builder(
                  itemCount: 6,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, index) {
                    return const ProductCard();
                  }),
            ),
            Center(
              child: Container(
                height: .5,
                width: MediaQuery.of(context).size.width - 100,
                color: Colors.white24,
              ),
            )
          ]),
        ),
        SliverToBoxAdapter(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const TextTile(
              more: CategoryDetail(),
              title: "Related",
            ),
            SizedBox(
              height: 230,
              child: ListView.builder(
                  itemCount: 6,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, index) {
                    return const ProductCard();
                  }),
            ),
          ]),
        )
      ]),
    );
  }
}
