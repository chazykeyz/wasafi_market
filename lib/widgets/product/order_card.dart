import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasafi_market/screens/directed_screens/order/order_list.dart';
import 'package:wasafi_market/widgets/text/bold.dart';
import 'package:wasafi_market/widgets/text/regular.dart';

class OrderCard extends StatelessWidget {
  const OrderCard(
      {Key? key,
      required this.price,
      required this.title,
      required this.thumbnail})
      : super(key: key);
  final String price;
  final String title;
  final String thumbnail;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => const OrderList());
      },
      child: Container(
          width: 150,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          margin: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white12),
            color: const Color.fromARGB(36, 238, 237, 237),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Bold(
                text: 'Tsh $price ',
                size: 14,
              ),
              const Regular(
                  text: "12 June, 2022", size: 14, color: Colors.white60),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: const Bold(
                    text: '100 Items',
                    size: 14,
                  )),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blueAccent,
                ),
                child: const Center(
                  child: Regular(
                    text: "In Progress",
                    size: 14,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          )),
    );
  }
}
