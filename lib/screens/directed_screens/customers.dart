import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasafi_market/screens/directed_screens/order.dart';
import 'package:wasafi_market/screens/directed_screens/order_list.dart';
import 'package:wasafi_market/widgets/nav_header.dart';
import 'package:wasafi_market/widgets/text/bold.dart';
import 'package:wasafi_market/widgets/text/regular.dart';

class Customers extends StatelessWidget {
  const Customers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void openUser(data) {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              color: Colors.black,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                height: 300,
                width: MediaQuery.of(context).size.width,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Bold(
                            text: "username",
                            size: 16,
                          ),
                          RichText(
                            text: const TextSpan(
                              text: '+255 ',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                              children: <TextSpan>[
                                TextSpan(
                                    text: "420234723",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400)),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            height: .5,
                            color: Colors.black,
                          ),
                          const Bold(
                            text: "Last Order",
                            size: 18,
                          ),
                          ListTile(
                            onTap: () {
                              Get.to(() => const OrderList());
                            },
                            dense: true,
                            horizontalTitleGap: -10,
                            trailing: const Icon(
                              CupertinoIcons.chevron_forward,
                              size: 14,
                              color: Colors.white70,
                            ),
                            title: const Bold(
                              text: "36764299giiygi",
                              size: 15,
                            ),
                            subtitle: const Regular(
                              color: Colors.white70,
                              text: "11-May-2022",
                              size: 13,
                            ),
                            leading: Container(
                              margin: const EdgeInsets.only(left: 5),
                              width: 10,
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white.withOpacity(.3)),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => const Orders(customer: true));
                            },
                            child: Container(
                              margin: const EdgeInsets.all(4),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 60),
                              height: 44,
                              decoration: BoxDecoration(
                                  color: Colors.blueAccent,
                                  borderRadius: BorderRadius.circular(16)),
                              child: const Center(
                                child: Regular(
                                  color: Colors.white,
                                  text: "See all Orders",
                                  size: 15,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]),
              ),
            );
          });
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          const NavHeader(
            userContent: '',
            isPage: false,
            title: 'Customers',
            noCart: false,
          ),
          SliverToBoxAdapter(
              child: Container(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Bold(text: "Customers", size: 24),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Row(children: [
                                const Regular(
                                  color: Colors.white70,
                                  text: "Total Customers ",
                                  size: 15,
                                ),
                                Container(
                                  margin: const EdgeInsets.all(4),
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.blueAccent.withOpacity(.3)),
                                  child: const Regular(
                                    color: Colors.white,
                                    text: "123",
                                    size: 15,
                                  ),
                                ),
                              ]),
                            ),
                            Container(
                              height: 35,
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.all(4),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  color: Colors.white24),
                              child: TextField(
                                onChanged: (value) {},
                                style: const TextStyle(color: Colors.white),
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(color: Colors.white70),
                                    hintText: 'Search'),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height,
                              child: MediaQuery.removePadding(
                                removeTop: true,
                                context: context,
                                child: ListView.separated(
                                  scrollDirection: Axis.vertical,
                                  itemCount: 20,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      onTap: () {
                                        openUser("data");
                                      },
                                      dense: true,
                                      horizontalTitleGap: -10,
                                      trailing: const Icon(
                                        CupertinoIcons.chevron_forward,
                                        size: 14,
                                        color: Colors.white70,
                                      ),
                                      title: const Bold(
                                        text: "Chazy keyz",
                                        size: 15,
                                      ),
                                      subtitle: const Regular(
                                        color: Colors.white70,
                                        text: "+255 787 064 145",
                                        size: 13,
                                      ),
                                      leading: Container(
                                        margin: const EdgeInsets.only(left: 5),
                                        width: 10,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Colors.blueAccent
                                                .withOpacity(.2)),
                                      ),
                                    );
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) =>
                                          const Divider(
                                    color: Colors.white24,
                                  ),
                                ),
                              ),
                            ),
                          ])
                    ],
                  ))),
        ],
      ),
    );
  }
}
