import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:wasafi_market/controllers/user.dart';
import 'package:wasafi_market/screens/directed_screens/user/seller_profile.dart';
import 'package:wasafi_market/widgets/nav_header.dart';
import 'package:wasafi_market/widgets/text/bold.dart';
import 'package:wasafi_market/widgets/text/regular.dart';

class PromoDetail extends StatefulWidget {
  const PromoDetail({
    Key? key,
    required this.data,
  }) : super(key: key);
  final dynamic data;

  @override
  State<PromoDetail> createState() => _PromoDetailState();
}

class _PromoDetailState extends State<PromoDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GetBuilder<UserController>(builder: (userContent) {
        return CustomScrollView(slivers: [
          const NavHeader(
            userContent: "",
            isPage: false,
            title: 'Promo & Offers',
            noCart: false,
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 300,
              child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://indiater.com/wp-content/uploads/2020/02/breakfast-restaurant-promo-ads-banner-design-free-psd-template.jpg"),
                        fit: BoxFit.cover)),
              ),
            ),
          ),
          // upper side of ui the title of product and share button
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      height: .5,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white24,
                    ),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color:
                                      const Color.fromARGB(31, 255, 255, 255),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          widget.data.seller.profilePicture),
                                      fit: BoxFit.cover))),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => const SellerProfile(),
                                  arguments: widget.data.seller.id);
                            },
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Regular(
                                        text: widget.data.seller.shopName,
                                        size: 14,
                                        color: Colors.white),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Regular(
                                        text: widget.data.seller.shopLocation,
                                        size: 12,
                                        color: Colors.blue),
                                  ),
                                ]),
                          )
                        ]),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => const SellerProfile(),
                                arguments: widget.data.seller.id);
                          },
                          child: const Icon(
                            CupertinoIcons.chevron_right,
                            color: Colors.blue,
                            size: 20,
                          ),
                        )
                      ]),
                  Center(
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      height: .5,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white24,
                    ),
                  ),
                  const Bold(text: "The WeekVibe", size: 22),
                  // descriptions
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Regular(
                        text: widget.data.description,
                        size: 16,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: // time
                Column(
              children: [
                ListTile(
                  leading: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: Colors.white24),
                    child: const Icon(
                      CupertinoIcons.time,
                      color: Colors.white,
                    ),
                  ),
                  title: const Regular(
                    color: Colors.white54,
                    text: "DURATION",
                    size: 13,
                  ),
                  subtitle: const Bold(text: "12 MAR - 20 MAY", size: 14),
                  trailing: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.white24),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Icon(
                      Ionicons.calendar_clear_outline,
                      color: Colors.white,
                    ),
                  ),
                ),
                ListTile(
                  leading: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: Colors.white24),
                    child: const Icon(
                      CupertinoIcons.location,
                      color: Colors.white,
                    ),
                  ),
                  title: const Regular(
                    color: Colors.white54,
                    text: "+255 68 485 8229",
                    size: 13,
                  ),
                  subtitle: const Bold(text: "Masaki, Dar Es Salaam", size: 14),
                  trailing: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.white24),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Icon(
                      CupertinoIcons.phone_fill,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          )
        ]);
      }),
    );
  }
}
