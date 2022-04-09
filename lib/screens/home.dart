import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wasafi_market/widgets/home_slider.dart';
import 'package:wasafi_market/widgets/product_card.dart';
import 'package:wasafi_market/widgets/stories_list.dart';
import 'package:wasafi_market/widgets/text/bold.dart';

import '../widgets/text_tile.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.black,
          leading: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Image(
                color: Color.fromARGB(236, 255, 255, 255),
                image: NetworkImage(
                    "https://wasafimediagroup.co.tz/static/wasafiIcon.png")),
          ),
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
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: Bold(
                  text: "Stories",
                  size: 18,
                )),
            SizedBox(
              height: 200,
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
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const TextTile(
              title: "Featured",
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
