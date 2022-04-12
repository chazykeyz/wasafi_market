import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasafi_market/screens/directed_screens/product_detail.dart';
import 'package:wasafi_market/widgets/text/bold.dart';
import 'package:wasafi_market/widgets/text/regular.dart';

class ProductShortCard extends StatelessWidget {
  const ProductShortCard(
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
        Get.to(() => const ProductDetail());
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
        subtitle:
            Regular(text: "Tsh $price", size: 14, color: Colors.blueAccent),
        trailing: const Icon(
          CupertinoIcons.clear,
          size: 16,
          color: Colors.white,
        ),
      ),
    );
  }
}
