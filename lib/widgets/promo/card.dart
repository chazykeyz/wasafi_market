import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasafi_market/screens/directed_screens/promo/details.dart';
import 'package:wasafi_market/widgets/text/bold.dart';
import 'package:wasafi_market/widgets/text/regular.dart';

class PromoCard extends StatelessWidget {
  const PromoCard({Key? key, required this.data}) : super(key: key);

  final dynamic data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => PromoDetail(
              data: data,
            ));
      },
      child: Container(
        margin: const EdgeInsets.all(4),
        width: MediaQuery.of(context).size.width / 2 - 10,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                height: 150,
                child: Stack(children: [
                  Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://indiater.com/wp-content/uploads/2020/02/breakfast-restaurant-promo-ads-banner-design-free-psd-template.jpg"),
                            fit: BoxFit.cover)),
                  ),
                ]),
              ),
            ),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 6),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Bold(text: "The WeekVibe", size: 14),
                          Regular(
                            text: "KFC",
                            size: 13,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ]))
          ],
        ),
      ),
    );
  }
}
