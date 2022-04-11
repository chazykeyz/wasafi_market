import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          collapsedHeight: 100,
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
        ),
      ],
    );
  }
}
