import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasafi_market/widgets/text/bold.dart';
import 'package:wasafi_market/widgets/text/regular.dart';

class SearchHistory extends StatelessWidget {
  const SearchHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        margin: const EdgeInsets.only(right: 10),
                        child: const Icon(
                          CupertinoIcons.chevron_back,
                          size: 30,
                        )),
                  )),
              const Bold(text: "Search History", size: 20)
            ]),
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
                              text: "Recents Searches",
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
                                return ListTile(
                                  leading: Container(
                                      width: 58,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border:
                                            Border.all(color: Colors.white12),
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
                  )))
        ],
      ),
    );
  }
}
