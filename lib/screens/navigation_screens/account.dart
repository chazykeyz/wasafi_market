import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasafi_market/screens/directed_screens/favorite.dart';
import 'package:wasafi_market/screens/directed_screens/order.dart';
import 'package:wasafi_market/widgets/order_card.dart';
import 'package:wasafi_market/widgets/text/bold.dart';
import 'package:wasafi_market/widgets/text/regular.dart';

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          centerTitle: false,
          pinned: true,
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
          title: Bold(text: "Account", size: 26),
        ),
        SliverToBoxAdapter(
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 1, color: Colors.white12))),
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white12),
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white12),
                child: const Icon(
                  CupertinoIcons.person,
                  size: 50,
                  color: Colors.white70,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Regular(
                    text: "Chazy keyz",
                    size: 16,
                    color: Colors.white,
                  ),
                  const Regular(
                      text: "0787064145", size: 14, color: Colors.white),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Regular(
                            color: Colors.blueAccent,
                            text: "Edit profile",
                            size: 14,
                          ),
                          Icon(
                            CupertinoIcons.chevron_right,
                            color: Colors.blue,
                            size: 20,
                          )
                        ]),
                  )
                ],
              ),
            ]),
          ),
        ),
        SliverToBoxAdapter(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 2),
              child: Bold(text: " Wallet Balance", size: 22),
            ),
            Container(
              padding: const EdgeInsets.only(
                  left: 10, right: 10, top: 2, bottom: 10),
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 1, color: Colors.white12))),
              child: Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white12),
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white12),
                  child: ListTile(
                    title: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Icon(
                          CupertinoIcons.creditcard,
                          color: Colors.blue,
                          size: 24,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Regular(
                            text: "Balance as of 12 April, 2022 ",
                            size: 15,
                            color: Colors.white70,
                          ),
                        )
                      ],
                    ),
                    subtitle: const Bold(
                      size: 25,
                      text: " 2,000,000/=",
                    ),
                  )),
            ),
          ]),
        ),
        SliverToBoxAdapter(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      child: Bold(
                        text: "Orders",
                        size: 16,
                      )),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const Orders());
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Regular(
                          text: "View All ",
                          color: Colors.blue,
                          size: 14,
                        ),
                        Icon(
                          CupertinoIcons.chevron_right,
                          color: Colors.blue,
                          size: 20,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                  itemCount: 6,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, index) {
                    return const OrderCard(
                      price: '500,000',
                      thumbnail:
                          "https://images.unsplash.com/photo-1649798511342-b468e770c222?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80",
                      title: 'dfjskfhi5b',
                    );
                  }),
            ),
          ]),
        ),
        SliverToBoxAdapter(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.white12),
                        top: BorderSide(color: Colors.white12)),
                  ),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Icon(
                              CupertinoIcons.bell,
                              color: Colors.blue,
                              size: 24,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Regular(
                                text: "Notification ",
                                size: 15,
                                color: Colors.white70,
                              ),
                            )
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => const Favorite());
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Regular(
                                  text: "12", size: 16, color: Colors.white),
                              Icon(
                                CupertinoIcons.chevron_right,
                                color: Colors.blue,
                                size: 24,
                              ),
                            ],
                          ),
                        )
                      ]),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.white12),
                    ),
                  ),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Icon(
                              CupertinoIcons.hand_thumbsup,
                              color: Colors.blue,
                              size: 24,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Regular(
                                text: "Wish List ",
                                size: 15,
                                color: Colors.white70,
                              ),
                            )
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => const Favorite());
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Regular(
                                text: "12",
                                size: 16,
                                color: Colors.white,
                              ),
                              Icon(
                                CupertinoIcons.chevron_right,
                                color: Colors.blue,
                                size: 24,
                              ),
                            ],
                          ),
                        )
                      ]),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.white12)),
                  ),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Icon(
                              CupertinoIcons.person_2,
                              color: Colors.blue,
                              size: 24,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Regular(
                                text: "Subscriptions ",
                                size: 15,
                                color: Colors.white70,
                              ),
                            )
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => const Favorite());
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Regular(
                                text: "12",
                                size: 16,
                                color: Colors.white,
                              ),
                              Icon(
                                CupertinoIcons.chevron_right,
                                color: Colors.blue,
                                size: 24,
                              ),
                            ],
                          ),
                        )
                      ]),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.white12)),
                  ),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Icon(
                              CupertinoIcons.time,
                              color: Colors.blue,
                              size: 24,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Regular(
                                text: "History ",
                                size: 15,
                                color: Colors.white70,
                              ),
                            )
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => const Favorite());
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Icon(
                                CupertinoIcons.chevron_right,
                                color: Colors.blue,
                                size: 24,
                              ),
                            ],
                          ),
                        )
                      ]),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.white12)),
                  ),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Icon(
                              CupertinoIcons.info,
                              color: Colors.blue,
                              size: 24,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Regular(
                                text: "Help ",
                                size: 15,
                                color: Colors.white70,
                              ),
                            )
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => const Favorite());
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Icon(
                                CupertinoIcons.chevron_right,
                                color: Colors.blue,
                                size: 24,
                              ),
                            ],
                          ),
                        )
                      ]),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  height: 44,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.white12),
                      color: const Color.fromARGB(55, 68, 137, 255),
                      borderRadius: BorderRadius.circular(16)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Regular(
                          color: Colors.white,
                          text: "Log Out ",
                          size: 15,
                        ),
                      ]),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
