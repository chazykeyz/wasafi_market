import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasafi_market/screens/directed_screens/seller_profile.dart';
import 'package:wasafi_market/widgets/avatar.dart';
import 'package:wasafi_market/widgets/product_card.dart';
import 'package:wasafi_market/widgets/text/bold.dart';
import 'package:wasafi_market/widgets/text/regular.dart';

class Subscription extends StatelessWidget {
  const Subscription({Key? key}) : super(key: key);

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
            leading: GestureDetector(
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
            title: const Bold(text: "Subscriptions ", size: 22),
          ),
          SliverToBoxAdapter(
              child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: ListView.builder(
                  itemCount: 6,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            leading: const AvatarCircle(
                                width: 40,
                                height: 40,
                                thumbnail:
                                    "https://images.unsplash.com/photo-1609708993734-29d07306bdc7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80"),
                            title: const Bold(text: "Chazy keyz", size: 16),
                            subtitle: const Regular(
                                text: "Accessories",
                                size: 14,
                                color: Colors.white70),
                            trailing: GestureDetector(
                              onTap: () {
                                Get.to(() => const SellerProfile());
                              },
                              child: const Regular(
                                  text: 'View All',
                                  size: 14,
                                  color: Colors.blueAccent),
                            ),
                          ),
                          SizedBox(
                            height: 203,
                            child: ListView.builder(
                                itemCount: 6,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, index) {
                                  return const ProductCard(isFlash: 0);
                                }),
                          ),
                        ]);
                  }),
            ),
          )),
        ],
      ),
    );
  }
}
