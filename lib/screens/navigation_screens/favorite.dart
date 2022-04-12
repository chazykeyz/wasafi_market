import 'package:flutter/material.dart';
import 'package:wasafi_market/widgets/product_short_card.dart';
import 'package:wasafi_market/widgets/text/bold.dart';
import 'package:wasafi_market/widgets/text/regular.dart';

class Favorite extends StatelessWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          centerTitle: false,
          pinned: true,
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
          title: Bold(text: "Favorite", size: 26),
        ),
        SliverToBoxAdapter(
            child: Container(
                height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Bold(
                            text: "Favorite Products",
                            size: 15,
                          ),
                          GestureDetector(
                            onTap: () {
                              // Get.to(()=>)
                            },
                            child: const Regular(
                                text: "Clear All",
                                size: 14,
                                color: Colors.blueAccent),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: MediaQuery.removePadding(
                        removeTop: true,
                        context: context,
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: 20,
                            itemBuilder: (context, index) {
                              return const ProductShortCard(
                                  price: "1,000,000",
                                  title: "Iphone 13 Pro Max",
                                  thumbnail:
                                      "https://images.unsplash.com/photo-1502823403499-6ccfcf4fb453?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80");
                            }),
                      ),
                    )
                  ],
                )))
      ],
    );
  }
}
