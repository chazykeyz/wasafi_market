import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasafi_market/screens/directed_screens/order_list.dart';
import 'package:wasafi_market/widgets/nav_header.dart';
import 'package:wasafi_market/widgets/text/bold.dart';
import 'package:wasafi_market/widgets/text/regular.dart';

class Orders extends StatelessWidget {
  const Orders({Key? key, required this.customer}) : super(key: key);
  final bool customer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          const NavHeader(
            userContent: '',
            isPage: false,
            title: 'Orders',
            noCart: false,
          ),
          SliverToBoxAdapter(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: customer
                    ? const Bold(text: "Customer's Orders", size: 24)
                    : const Bold(text: "Shop Orders", size: 24),
              ),
              Container(
                height: 40,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(left: 4, bottom: 4, top: 10),
                padding: const EdgeInsets.symmetric(horizontal: 10),
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
              Center(
                  child: Container(
                height: .5,
                width: MediaQuery.of(context).size.width,
                color: Colors.white24,
              )),
            ],
          )),
          SliverToBoxAdapter(
              child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: MediaQuery.of(context).size.height,
            child: MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: ListView.separated(
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Get.to(() => const OrderList());
                    },
                    child: ListTile(
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
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(
                  color: Colors.white30,
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
