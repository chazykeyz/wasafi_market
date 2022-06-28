import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasafi_market/widgets/product_short_card.dart';
import 'package:wasafi_market/screens/directed_screens/search_history.dart';
import 'package:wasafi_market/widgets/text/bold.dart';
import 'package:wasafi_market/widgets/text/regular.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  bool isEmpty = true;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
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
                          margin: const EdgeInsets.all(5),
                          child: const Icon(
                            CupertinoIcons.chevron_back,
                            size: 30,
                          )),
                    )),
                Container(
                  height: 48,
                  width: MediaQuery.of(context).size.width - 80,
                  margin: const EdgeInsets.all(4),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.white24),
                  child: TextField(
                    onChanged: (value) {
                      if (value != "") {
                        isEmpty = false;
                        setState(() {});
                      } else {
                        isEmpty = true;
                        setState(() {});
                      }
                    },
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.white),
                        hintText: 'Search '),
                  ),
                ),
              ]),
            ),
            SliverToBoxAdapter(
              child: Container(
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 1, color: Colors.white12))),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      TabBar(tabs: [
                        Tab(
                          text: "Top",
                        ),
                        Tab(
                          text: "Products",
                        ),
                        Tab(
                          text: " Sellers",
                        ),
                        Tab(
                          text: "Places",
                        )
                      ]),
                    ]),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: TabBarView(children: [
                  // top searches
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: isEmpty
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 8.0),
                                child: Bold(
                                  text: "Recents",
                                  size: 20,
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
                                      primary: false,
                                      itemBuilder: (context, index) {
                                        return ListTile(
                                          leading: Container(
                                              width: 58,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(40),
                                                border: Border.all(
                                                    color: Colors.white12),
                                                color: const Color.fromARGB(
                                                    36, 238, 237, 237),
                                                image: const DecorationImage(
                                                    image: NetworkImage(
                                                        "https://images.unsplash.com/photo-1596215143922-eedeaba0d91c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDF8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=800&q=60"),
                                                    fit: BoxFit.cover),
                                              )),
                                          title: Row(children: const [
                                            Bold(
                                              text: "chazy keyz",
                                              size: 14,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 4),
                                              child: Icon(
                                                CupertinoIcons
                                                    .checkmark_seal_fill,
                                                size: 16,
                                                color: Colors.blueAccent,
                                              ),
                                            )
                                          ]),
                                          subtitle: const Regular(
                                              text: "Clothing Shop",
                                              size: 14,
                                              color: Colors.blueAccent),
                                          trailing: const Icon(
                                            CupertinoIcons.clear,
                                            size: 16,
                                            color: Colors.white,
                                          ),
                                        );
                                      }),
                                ),
                              )
                            ],
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                Expanded(
                                  flex: 1,
                                  child: MediaQuery.removePadding(
                                    removeTop: true,
                                    context: context,
                                    child: ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        itemCount: 20,
                                        primary: false,
                                        itemBuilder: (context, index) {
                                          return ListTile(
                                            leading: Container(
                                                width: 58,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(40),
                                                  border: Border.all(
                                                      color: Colors.white12),
                                                  color: const Color.fromARGB(
                                                      36, 238, 237, 237),
                                                  image: const DecorationImage(
                                                      image: NetworkImage(
                                                          "https://images.unsplash.com/photo-1596215143922-eedeaba0d91c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDF8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=800&q=60"),
                                                      fit: BoxFit.cover),
                                                )),
                                            title: Row(children: const [
                                              Bold(
                                                text: "chazy keyz",
                                                size: 14,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 4),
                                                child: Icon(
                                                  CupertinoIcons
                                                      .checkmark_seal_fill,
                                                  size: 16,
                                                  color: Colors.blueAccent,
                                                ),
                                              )
                                            ]),
                                            subtitle: const Regular(
                                                text: "Clothing Shop",
                                                size: 14,
                                                color: Colors.blueAccent),
                                          );
                                        }),
                                  ),
                                ),
                              ]),
                  ),
                  // products
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: isEmpty
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Bold(
                                    text: "Recents",
                                    size: 20,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(() => const SearchHistory());
                                    },
                                    child: const Regular(
                                        text: "See All",
                                        size: 14,
                                        color: Colors.blueAccent),
                                  )
                                ],
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
                                            isCart: false,
                                            isOrder: false,
                                            quantity: 1,
                                            price: "1,000,000",
                                            title: "Iphone 13 Pro Max",
                                            thumbnail:
                                                "https://images.unsplash.com/photo-1502823403499-6ccfcf4fb453?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80");
                                      }),
                                ),
                              )
                            ],
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child: MediaQuery.removePadding(
                                  removeTop: true,
                                  context: context,
                                  child: ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      itemCount: 20,
                                      itemBuilder: (context, index) {
                                        return ListTile(
                                          leading: Container(
                                              width: 58,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                border: Border.all(
                                                    color: Colors.white12),
                                                color: const Color.fromARGB(
                                                    36, 238, 237, 237),
                                                image: const DecorationImage(
                                                    image: NetworkImage(
                                                        "https://images.unsplash.com/photo-1596215143922-eedeaba0d91c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDF8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=800&q=60"),
                                                    fit: BoxFit.cover),
                                              )),
                                          title: const Bold(
                                            text: "Iphone 13 Pro max",
                                            size: 14,
                                          ),
                                          subtitle: const Regular(
                                              text: "Tsh 3,500,000",
                                              size: 14,
                                              color: Colors.blueAccent),
                                        );
                                      }),
                                ),
                              )
                            ],
                          ),
                  ),

                  // the sellers
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: isEmpty
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Bold(
                                    text: "Recents",
                                    size: 20,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(() => const SearchHistory());
                                    },
                                    child: const Regular(
                                        text: "See All",
                                        size: 14,
                                        color: Colors.blueAccent),
                                  )
                                ],
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
                                        return ListTile(
                                          leading: Container(
                                              width: 58,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(40),
                                                border: Border.all(
                                                    color: Colors.white12),
                                                color: const Color.fromARGB(
                                                    36, 238, 237, 237),
                                                image: const DecorationImage(
                                                    image: NetworkImage(
                                                        "https://images.unsplash.com/photo-1596215143922-eedeaba0d91c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDF8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=800&q=60"),
                                                    fit: BoxFit.cover),
                                              )),
                                          title: Row(children: const [
                                            Bold(
                                              text: "chazy keyz",
                                              size: 14,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 4),
                                              child: Icon(
                                                CupertinoIcons
                                                    .checkmark_seal_fill,
                                                size: 16,
                                                color: Colors.blueAccent,
                                              ),
                                            )
                                          ]),
                                          subtitle: const Regular(
                                              text: "Clothing Shop",
                                              size: 14,
                                              color: Colors.blueAccent),
                                          trailing: const Icon(
                                            CupertinoIcons.clear,
                                            size: 16,
                                            color: Colors.white,
                                          ),
                                        );
                                      }),
                                ),
                              )
                            ],
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child: MediaQuery.removePadding(
                                  removeTop: true,
                                  context: context,
                                  child: ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      itemCount: 20,
                                      itemBuilder: (context, index) {
                                        return ListTile(
                                          leading: Container(
                                              width: 58,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(40),
                                                border: Border.all(
                                                    color: Colors.white12),
                                                color: const Color.fromARGB(
                                                    36, 238, 237, 237),
                                                image: const DecorationImage(
                                                    image: NetworkImage(
                                                        "https://images.unsplash.com/photo-1596215143922-eedeaba0d91c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDF8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=800&q=60"),
                                                    fit: BoxFit.cover),
                                              )),
                                          title: Row(children: const [
                                            Bold(
                                              text: "chazy keyz",
                                              size: 14,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 4),
                                              child: Icon(
                                                CupertinoIcons
                                                    .checkmark_seal_fill,
                                                size: 16,
                                                color: Colors.blueAccent,
                                              ),
                                            )
                                          ]),
                                          subtitle: const Regular(
                                              text: "Clothing Shop",
                                              size: 14,
                                              color: Colors.blueAccent),
                                        );
                                      }),
                                ),
                              )
                            ],
                          ),
                  ),
                  //  places
                  // the sellers
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: isEmpty
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Bold(
                                    text: "Recents",
                                    size: 20,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(() => const SearchHistory());
                                    },
                                    child: const Regular(
                                        text: "See All",
                                        size: 14,
                                        color: Colors.blueAccent),
                                  )
                                ],
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
                                        return ListTile(
                                          title: Row(children: const [
                                            Bold(
                                              text: "Kariakoo",
                                              size: 14,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 4),
                                              child: Icon(
                                                CupertinoIcons
                                                    .checkmark_seal_fill,
                                                size: 16,
                                                color: Colors.blueAccent,
                                              ),
                                            )
                                          ]),
                                          subtitle: const Regular(
                                              text: "123 Shops",
                                              size: 14,
                                              color: Colors.blueAccent),
                                          trailing: const Icon(
                                            CupertinoIcons.clear,
                                            size: 16,
                                            color: Colors.white,
                                          ),
                                        );
                                      }),
                                ),
                              )
                            ],
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child: MediaQuery.removePadding(
                                  removeTop: true,
                                  context: context,
                                  child: ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      itemCount: 20,
                                      itemBuilder: (context, index) {
                                        return ListTile(
                                          title: Row(children: const [
                                            Bold(
                                              text: "Kariakoo",
                                              size: 14,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 4),
                                              child: Icon(
                                                CupertinoIcons
                                                    .checkmark_seal_fill,
                                                size: 16,
                                                color: Colors.blueAccent,
                                              ),
                                            )
                                          ]),
                                          subtitle: const Regular(
                                              text: "123 Shops",
                                              size: 14,
                                              color: Colors.blueAccent),
                                        );
                                      }),
                                ),
                              )
                            ],
                          ),
                  ),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
