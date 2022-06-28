import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasafi_market/widgets/product_short_card.dart';
import 'package:wasafi_market/widgets/text/bold.dart';
import 'package:wasafi_market/widgets/text/regular.dart';

class OrderList extends StatelessWidget {
  const OrderList({Key? key}) : super(key: key);

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
            title: const Bold(text: "Orders Detail", size: 22),
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
                            vertical: 10, horizontal: 15),
                        margin: const EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white10),
                        child: const Bold(
                          text: "123 items",
                          size: 15,
                        ),
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height - 380,
                              child: MediaQuery.removePadding(
                                removeTop: true,
                                context: context,
                                child: ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    itemCount: 20,
                                    itemBuilder: (context, index) {
                                      return const ProductShortCard(
                                          isCart: false,
                                          isOrder: true,
                                          quantity: 1,
                                          price: "1,000,000 x 12",
                                          title: "Iphone 13 Pro Max",
                                          thumbnail:
                                              "https://images.unsplash.com/photo-1502823403499-6ccfcf4fb453?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80");
                                    }),
                              ),
                            ),
                            Center(
                                child: Container(
                              height: .5,
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              width: MediaQuery.of(context).size.width - 100,
                              color: Colors.white24,
                            )),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Bold(text: "Total Amount", size: 20),
                                  Regular(
                                      text: "Tsh 1,000,000/=",
                                      size: 15,
                                      color: Colors.blueAccent)
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(4),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 60),
                              height: 44,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Colors.white12),
                                  color: const Color.fromARGB(55, 68, 137, 255),
                                  borderRadius: BorderRadius.circular(16)),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Regular(
                                      color: Colors.white,
                                      text: "Cancel Order",
                                      size: 15,
                                    ),
                                  ]),
                            ),
                          ])
                    ],
                  ))),
        ],
      ),
    );
  }
}
