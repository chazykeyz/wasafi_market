import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasafi_market/screens/category.dart';
import 'package:wasafi_market/widgets/text/regular.dart';

class CatergoryCard extends StatelessWidget {
  const CatergoryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => const CategoryDetail());
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        width: 100,
        child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(width: 1, color: Colors.blueAccent),
                color: Colors.black),
            child: Center(
              child: Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(45),
                    color: const Color.fromARGB(41, 238, 237, 237),
                    image: const DecorationImage(
                        image: NetworkImage(
                            "https://images.unsplash.com/photo-1521146764736-56c929d59c83?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80"),
                        fit: BoxFit.cover),
                  )),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 4.0, bottom: 8),
            child: Center(
              child: Regular(
                text: "Women Clothes",
                size: 12,
                color: Colors.white,
              ),
            ),
          )
        ]),
      ),
    );
  }
}
