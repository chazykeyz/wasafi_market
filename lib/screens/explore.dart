import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasafi_market/screens/search.dart';
import 'package:wasafi_market/widgets/avatar.dart';
import 'package:wasafi_market/widgets/product_card.dart';
import 'package:wasafi_market/widgets/seller.dart';
import 'package:wasafi_market/widgets/text/bold.dart';
import 'package:wasafi_market/widgets/text/regular.dart';

class Explore extends StatelessWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          collapsedHeight: 100,
          backgroundColor: Colors.black,
          title: const Bold(
            size: 20,
            text: "Explore",
          ),
          flexibleSpace: InkWell(
            onTap: () {
              Get.to(() => const Search());
            },
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              (Container(
                height: 48,
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.white12),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4),
                        child: const Icon(
                          CupertinoIcons.search,
                          size: 30,
                        ),
                      ),
                      SizedBox(
                          width: MediaQuery.of(context).size.width - 50,
                          child: const Regular(
                            color: Colors.white,
                            text: "Search",
                            size: 16,
                          )),
                    ]),
              )),
            ]),
          ),
        ),
        SliverToBoxAdapter(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const ListTile(
              leading: AvatarCircle(
                  width: 50,
                  height: 50,
                  thumbnail:
                      "https://images.unsplash.com/photo-1609708993734-29d07306bdc7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80"),
              title: Bold(text: "Women Clothes", size: 18),
              subtitle: Regular(
                  text: "Trending Product", size: 16, color: Colors.blueAccent),
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
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const ListTile(
                title: Bold(text: "Seller ", size: 18),
                subtitle: Regular(
                    text: "Trending Seller",
                    size: 16,
                    color: Colors.blueAccent),
                trailing: Icon(
                  CupertinoIcons.chevron_right,
                  color: Colors.blue,
                  size: 20,
                )),
            SizedBox(
              height: 180,
              child: ListView.builder(
                  itemCount: 6,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, index) {
                    return const Seller();
                  }),
            ),
          ]),
        )
      ],
    );
  }
}
