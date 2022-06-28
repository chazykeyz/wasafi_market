import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasafi_market/screens/directed_screens/seller_profile.dart';
import 'package:wasafi_market/widgets/text/bold.dart';
import 'package:wasafi_market/widgets/text/regular.dart';

class ProductShortCard extends StatelessWidget {
  const ProductShortCard(
      {Key? key,
      required this.isOrder,
      required this.price,
      required this.isCart,
      required this.title,
      required this.thumbnail,
      required this.quantity})
      : super(key: key);
  final String price;
  final String title;
  final String thumbnail;
  final bool isCart;
  final bool isOrder;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: InkWell(
        onTap: () {
          // Get.to(() => const ProductDetail());
        },
        child: ListTile(
          leading: Container(
              width: 58,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white12),
                color: const Color.fromARGB(36, 238, 237, 237),
                image: DecorationImage(
                    image: NetworkImage(thumbnail), fit: BoxFit.cover),
              )),
          title: Bold(
            text: title,
            size: 14,
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isCart
                  ? Regular(
                      text: "Tsh $price x $quantity",
                      size: 14,
                      color: Colors.blueAccent)
                  : Regular(
                      text: "Tsh $price ", size: 14, color: Colors.white54),
              isOrder
                  ? GestureDetector(
                      onTap: () {
                        Get.to(() => const SellerProfile());
                      },
                      child: const Regular(
                          text: "Chazy keyz",
                          size: 14,
                          color: Colors.blueAccent),
                    )
                  : const Regular(
                      text: "out of Stock", size: 14, color: Colors.white54)
            ],
          ),
          trailing: isOrder
              ? const Bold(
                  text: "Tsh 20,000,000",
                  size: 14,
                )
              : const Icon(
                  CupertinoIcons.clear,
                  size: 16,
                  color: Colors.white,
                ),
        ),
      ),
    );
  }
}
