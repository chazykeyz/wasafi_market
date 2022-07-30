import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasafi_market/screens/directed_screens/seller_profile.dart';
import 'package:wasafi_market/widgets/text/bold.dart';

class Seller extends StatelessWidget {
  const Seller({Key? key, this.data, this.endIndex}) : super(key: key);
  final dynamic data;
  final dynamic endIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 20,
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(width: 1, color: Colors.white10),
              color: const Color.fromARGB(36, 238, 237, 237),
              image: DecorationImage(
                  image: NetworkImage(data.profilePicture), fit: BoxFit.cover),
            )),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Bold(
                            text: data.shopCategory.name,
                            size: 14,
                          ),
                          Row(children: [
                            Text(
                              data.shopName,
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.white),
                            ),
                            SizedBox(
                                child: data.isVerified
                                    ? const Padding(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 4),
                                        child: Icon(
                                          CupertinoIcons.checkmark_seal_fill,
                                          size: 16,
                                          color: Colors.blueAccent,
                                        ),
                                      )
                                    : null)
                          ]),
                          Text(
                            data.shopLocation,
                            style: const TextStyle(
                                fontSize: 13, color: Colors.white60),
                          ),
                        ]),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const SellerProfile(), arguments: data.id);
                      },
                      child: Container(
                        height: 30,
                        width: 100,
                        margin: const EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white12,
                        ),
                        child: Center(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "View Shop",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.blueAccent),
                                ),
                                Icon(
                                  CupertinoIcons.arrow_up_right,
                                  color: Colors.blueAccent,
                                  size: 13,
                                )
                              ]),
                        ),
                      ),
                    ),
                  ]),
              endIndex == 2
                  ? const SizedBox(
                      height: 0,
                    )
                  : Container(
                      margin: const EdgeInsets.only(top: 8),
                      color: Colors.white12,
                      height: 1.0,
                    )
            ]),
          ),
        ),
      ]),
    );
  }
}
