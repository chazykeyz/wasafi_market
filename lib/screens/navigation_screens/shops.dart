import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wasafi_market/widgets/seller.dart';
import 'package:wasafi_market/widgets/text/bold.dart';
import 'package:wasafi_market/widgets/text/regular.dart';

class Shops extends StatelessWidget {
  const Shops({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      const SliverAppBar(
        centerTitle: false,
        pinned: true,
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: Bold(text: "Shops", size: 26),
      ),
      SliverToBoxAdapter(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const ListTile(
              title: Bold(text: "SuperMakert ", size: 17),
              trailing: Icon(
                CupertinoIcons.chevron_right,
                color: Colors.blue,
                size: 20,
              )),
          SizedBox(
            height: 180,
            child: ListView.builder(
                itemCount: 6,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, index) {
                  return const Seller();
                }),
          ),
        ]),
      ),
      SliverToBoxAdapter(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const ListTile(
              title: Bold(text: "Clothes ", size: 17),
              trailing: Icon(
                CupertinoIcons.chevron_right,
                color: Colors.blue,
                size: 20,
              )),
          SizedBox(
            height: 180,
            child: ListView.builder(
                itemCount: 6,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, index) {
                  return const Seller();
                }),
          ),
        ]),
      ),
      SliverToBoxAdapter(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const ListTile(
              title: Bold(text: "Accessories ", size: 17),
              trailing: Icon(
                CupertinoIcons.chevron_right,
                color: Colors.blue,
                size: 20,
              )),
          SizedBox(
            height: 180,
            child: ListView.builder(
                itemCount: 6,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, index) {
                  return const Seller();
                }),
          ),
        ]),
      )
    ]);
  }
}
