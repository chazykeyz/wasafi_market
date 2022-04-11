import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasafi_market/widgets/text/bold.dart';
import 'package:wasafi_market/widgets/text/regular.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

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
              collapsedHeight: 120,
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
                  child: const TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.white),
                        hintText: 'Search '),
                  ),
                ),
              ]),
              flexibleSpace: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    TabBar(tabs: [
                      Tab(
                        text: "Top",
                      ),
                      Tab(
                        text: "Sellers",
                      ),
                      Tab(
                        text: "Products",
                      ),
                      Tab(
                        text: "Places",
                      )
                    ]),
                  ]),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: TabBarView(children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Bold(
                          text: "Recents",
                          size: 20,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height - 200,
                          child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: 20,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading: Container(
                                      width: 58,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(40),
                                        border:
                                            Border.all(color: Colors.white12),
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
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 4),
                                      child: Icon(
                                        CupertinoIcons.checkmark_seal_fill,
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
                        )
                      ],
                    ),
                  ),
                  Bold(
                    text: "Sellers",
                    size: 20,
                  ),
                  Bold(
                    text: "Products",
                    size: 20,
                  ),
                  Bold(
                    text: "Places",
                    size: 20,
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
