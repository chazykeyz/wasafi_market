import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasafi_market/screens/directed_screens/user/seller_profile.dart';
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
                                  image: DecorationImage(
                                      image: NetworkImage(userInfo
                                          .subscriptions[index].profilePicture),
                                      fit: BoxFit.cover))),
                          title: Bold(
                              text: userInfo.subscriptions[index].shopName,
                              size: 16),
                          subtitle: Regular(
                              text: userInfo.subscriptions[index].shopLocation,
                              size: 14,
                              color: Colors.white70),
                          trailing: GestureDetector(
                            onTap: () {
                              Get.to(() => const SellerProfile(),
                                  arguments: userInfo.subscriptions[index].id);
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
