import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasafi_market/screens/directed_screens/seller_profile.dart';
import 'package:wasafi_market/widgets/text/bold.dart';

class Seller extends StatelessWidget {
  const Seller({Key? key, this.data}) : super(key: key);
  final dynamic data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => SellerProfile(userId: data.id));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 3),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white10,
            border: Border.all(width: 1, color: Colors.white10)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: Center(
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(33),
                      border: Border.all(width: 2, color: Colors.white24),
                      color: Colors.black),
                  child: Center(
                    child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28),
                          border: Border.all(width: 1, color: Colors.white10),
                          color: const Color.fromARGB(36, 238, 237, 237),
                          image: DecorationImage(
                              image: NetworkImage(data.profilePicture),
                              fit: BoxFit.cover),
                        )),
                  ),
                ),
                Container(
                  constraints: const BoxConstraints(minWidth: 120),
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white12),
                  child: Center(
                    child: Row(children: [
                      data.user.username.length >= 10
                          ? Row(children: [
                              Bold(
                                text: data.user.username
                                    .toString()
                                    .substring(0, 10),
                                size: 14,
                              ),
                              const Bold(
                                text: "...",
                                size: 14,
                              )
                            ])
                          : Bold(
                              text: data.user.username,
                              size: 14,
                            ),
                      SizedBox(
                          child: data.isVerified
                              ? const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 4),
                                  child: Icon(
                                    CupertinoIcons.checkmark_seal_fill,
                                    size: 16,
                                    color: Colors.blueAccent,
                                  ),
                                )
                              : null)
                    ]),
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
