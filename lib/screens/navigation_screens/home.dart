import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wasafi_market/screens/directed_screens/category.dart';
import 'package:wasafi_market/widgets/category_card.dart';
import 'package:wasafi_market/widgets/home_slider.dart';
import 'package:wasafi_market/widgets/product_card.dart';
import 'package:wasafi_market/widgets/stories_list.dart';
import 'package:wasafi_market/widgets/text/bold.dart';
import 'package:wasafi_market/widgets/text/regular.dart';

import '../../widgets/text_tile.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
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
        SliverToBoxAdapter(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 10, top: 20),
                  child: Bold(
                    text: "Featured",
                    size: 18,
                  ),
                ),
                HomeSlider()
              ]),
        ),
        SliverToBoxAdapter(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Center(
              child: Container(
                height: .5,
                margin: const EdgeInsets.symmetric(vertical: 10),
                width: MediaQuery.of(context).size.width - 100,
                color: Colors.white24,
              ),
            ),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: Bold(
                  text: "Categories",
                  size: 18,
                )),
            SizedBox(
              height: 130,
              child: ListView.builder(
                  itemCount: 6,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, index) {
                    return const CatergoryCard();
                  }),
            ),
            Center(
              child: Container(
                height: .5,
                margin: const EdgeInsets.symmetric(vertical: 10),
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
              title: "Featured",
              more: CategoryDetail(),
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
        ),
        SliverToBoxAdapter(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(children: const [
                    Icon(
                      CupertinoIcons.bolt_fill,
                      color: Colors.white,
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Bold(
                          text: "Flash sales",
                          size: 16,
                        )),
                  ]),
                  Row(
                    children: [
                      Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(width: 1, color: Colors.white10),
                            color: Colors.white12),
                        child: const Center(
                            child: Regular(
                                text: "12", size: 14, color: Colors.white)),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4),
                        child:
                            Regular(text: ":", size: 15, color: Colors.white),
                      ),
                      Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(width: 1, color: Colors.white10),
                            color: Colors.white12),
                        child: const Center(
                            child: Regular(
                                text: "12", size: 14, color: Colors.white)),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4),
                        child:
                            Regular(text: ":", size: 15, color: Colors.white),
                      ),
                      Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(width: 1, color: Colors.white10),
                            color: Colors.white12),
                        child: const Center(
                            child: Regular(
                                text: "12", size: 14, color: Colors.white)),
                      )
                    ],
                  )
                ],
              ),
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
        ),
        SliverToBoxAdapter(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const TextTile(
              title: "Friday Offer",
              more: CategoryDetail(),
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
      ],
    );
  }
}
