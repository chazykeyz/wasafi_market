import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasafi_market/screens/directed_screens/seller_profile.dart';
import 'package:wasafi_market/widgets/nav_header.dart';
import 'package:wasafi_market/widgets/text/bold.dart';
import 'package:wasafi_market/widgets/text/regular.dart';

class Subscription extends StatelessWidget {
  const Subscription({Key? key, required this.userInfo}) : super(key: key);
  final dynamic userInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          const NavHeader(
            userContent: '',
            isPage: false,
            title: 'Subscriptions',
            noCart: false,
          ),
          SliverToBoxAdapter(
              child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: ListView.separated(
                itemCount: userInfo.subscriptions.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          dense: true,
                          leading: Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color:
                                      const Color.fromARGB(31, 255, 255, 255),
                                  image: const DecorationImage(
                                      image: NetworkImage(
                                          "https://images.unsplash.com/photo-1609708993734-29d07306bdc7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80"),
                                      fit: BoxFit.cover))),
                          title: const Bold(text: "Chazy keyz", size: 16),
                          subtitle: const Regular(
                              text: "Accessories",
                              size: 14,
                              color: Colors.white70),
                          trailing: GestureDetector(
                            onTap: () {
                              Get.to(() => const SellerProfile(),
                                  arguments: userInfo.subscriptions[index]);
                            },
                            child: const Regular(
                                text: 'See More',
                                size: 14,
                                color: Colors.blueAccent),
                          ),
                        ),
                      ]);
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(
                  color: Colors.white30,
                ),
              ),
            ),
          )),
        ],
      ),
    );
  }
}
