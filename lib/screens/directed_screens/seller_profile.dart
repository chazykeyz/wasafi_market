import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasafi_market/widgets/avatar.dart';
import 'package:wasafi_market/widgets/product_card.dart';
import 'package:wasafi_market/widgets/text/bold.dart';
import 'package:wasafi_market/widgets/text/regular.dart';

class SellerProfile extends StatelessWidget {
  const SellerProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: false,
            pinned: true,
            backgroundColor: Colors.black,
            automaticallyImplyLeading: false,
            title: Row(children: [
              GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Center(
                    child: Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: const Icon(
                          CupertinoIcons.chevron_back,
                          size: 30,
                        )),
                  )),
              const Bold(text: "Chazy keyz", size: 23)
            ]),
          ),
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 40),
                  child: const AvatarCircle(
                      width: 100,
                      height: 100,
                      thumbnail:
                          "https://images.unsplash.com/photo-1554151228-14d9def656e4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=772&q=80"),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: const [
                              Bold(text: "124", size: 16),
                              Regular(
                                  text: "Products",
                                  size: 15,
                                  color: Colors.white54)
                            ],
                          ),
                          Column(
                            children: const [
                              Bold(text: "124", size: 16),
                              Regular(
                                  text: "Subscribers",
                                  size: 15,
                                  color: Colors.white54)
                            ],
                          ),
                          Column(
                            children: const [
                              Bold(text: "567", size: 16),
                              Regular(
                                  text: "Products",
                                  size: 15,
                                  color: Colors.white54)
                            ],
                          )
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        height: 34,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white12),
                            color: const Color.fromARGB(68, 36, 80, 157),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                          child: Regular(
                            color: Colors.white,
                            text: "Subscribe",
                            size: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Regular(
                    text: "Accessories",
                    size: 16,
                    color: Colors.white,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Regular(
                      text:
                          "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying.",
                      size: 14,
                      color: Colors.white70,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1, color: Colors.white10),
                        color: const Color.fromARGB(38, 68, 137, 255)),
                    child: Column(children: [
                      Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Icon(
                              CupertinoIcons.link,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                          Regular(
                              text:
                                  "https://unsplash.com/@houcinencibphotography",
                              size: 14,
                              color: Colors.white70)
                        ],
                      ),
                      Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Icon(
                              CupertinoIcons.location_fill,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                          Regular(
                              text: "Kariakoo, Dar es salaam",
                              size: 14,
                              color: Colors.white70)
                        ],
                      )
                    ]),
                  ),
                  Center(
                    child: Container(
                      height: .5,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      width: MediaQuery.of(context).size.width - 100,
                      color: Colors.white24,
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverGrid(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                return const ProductCard(isFlash: 0, data: {});
              }, childCount: 10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
              ))
        ],
      ),
    );
  }
}
