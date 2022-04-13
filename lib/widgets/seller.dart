import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasafi_market/screens/directed_screens/seller_profile.dart';
import 'package:wasafi_market/widgets/text/bold.dart';

class Seller extends StatelessWidget {
  const Seller({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => const SellerProfile());
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
                      borderRadius: BorderRadius.circular(35),
                      border: Border.all(width: 1, color: Colors.blueAccent),
                      color: Colors.black),
                  child: Center(
                    child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: const Color.fromARGB(36, 238, 237, 237),
                          image: const DecorationImage(
                              image: NetworkImage(
                                  "https://images.unsplash.com/photo-1596215143922-eedeaba0d91c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDF8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=800&q=60"),
                              fit: BoxFit.cover),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0, bottom: 8),
                  child: Center(
                    child: Row(children: const [
                      Bold(
                        text: "chazy keyz",
                        size: 14,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4),
                        child: Icon(
                          CupertinoIcons.checkmark_seal_fill,
                          size: 16,
                          color: Colors.blueAccent,
                        ),
                      )
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
