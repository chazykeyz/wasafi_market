import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasafi_market/controllers/products.dart';
import 'package:wasafi_market/controllers/user.dart';
import 'package:wasafi_market/screens/directed_screens/user/search.dart';
import 'package:wasafi_market/widgets/events/events.dart';
import 'package:wasafi_market/widgets/loads/product.dart';
import 'package:wasafi_market/widgets/text/bold.dart';

class Events extends StatefulWidget {
  const Events({Key? key}) : super(key: key);

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(builder: (userContent) {
      return CustomScrollView(
        slivers: [
          // appbar and search
          SliverAppBar(
            pinned: true,
            backgroundColor: Colors.black,
            centerTitle: false,
            collapsedHeight: 30,
            expandedHeight: 400,
            toolbarHeight: 30,
            floating: false,
            flexibleSpace: FlexibleSpaceBar(
              expandedTitleScale: 1,
              collapseMode: CollapseMode.parallax,
              background: Stack(children: [
                Image(
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  image: const NetworkImage(
                      "https://images.unsplash.com/photo-1603190287605-e6ade32fa852?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80"),
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  top: 0,
                  child: Container(
                    padding: const EdgeInsets.only(top: 150),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                          Colors.black,
                          Colors.black.withOpacity(0.2)
                        ])),
                    child: InkWell(
                      onTap: () {
                        Get.to(() => const Search());
                      },
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Explore Wasafi events",
                              style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white),
                            ),
                            const Center(
                              child: SizedBox(
                                width: 300,
                                child: Text(
                                    "Advertise in our mall to get in touch with your client more efficiently and digital",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    )),
                              ),
                            ),
                            Container(
                              height: 42,
                              width: 200,
                              margin: const EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: Colors.blue,
                              ),
                              child: const Center(
                                child: Text(
                                  "Try It Now",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ]),
                    ),
                  ),
                ),
              ]),
            ),
          ),

          GetBuilder<ProductsController>(
            builder: (controllerData) {
              return SliverToBoxAdapter(
                child: controllerData.isLoading
                    ? const ProductLoader()
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            const Bold(text: "Conference", size: 20),
                            SizedBox(
                              height: 230,
                              child: ListView.builder(
                                  itemCount: 10,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (BuildContext context, index) {
                                    return const EventCard();
                                  }),
                            ),
                          ]),
              );
            },
          ),
          GetBuilder<ProductsController>(
            builder: (controllerData) {
              return SliverToBoxAdapter(
                child: controllerData.isLoading
                    ? const ProductLoader()
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            const Bold(text: "Conference", size: 20),
                            SizedBox(
                              height: 230,
                              child: ListView.builder(
                                  itemCount: 10,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (BuildContext context, index) {
                                    return const EventCard();
                                  }),
                            ),
                          ]),
              );
            },
          ),

          GetBuilder<ProductsController>(
            builder: (controllerData) {
              return SliverToBoxAdapter(
                child: controllerData.isLoading
                    ? const ProductLoader()
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            const Bold(text: "Conference", size: 20),
                            SizedBox(
                              height: 230,
                              child: ListView.builder(
                                  itemCount: 10,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (BuildContext context, index) {
                                    return const EventCard();
                                  }),
                            ),
                          ]),
              );
            },
          ),
        ],
      );
    });
  }
}
