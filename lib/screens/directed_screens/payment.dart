import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasafi_market/main.dart';
import 'package:wasafi_market/widgets/text/bold.dart';
import 'package:wasafi_market/widgets/text/regular.dart';

class Payment extends StatelessWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: false,
            pinned: true,
            backgroundColor: Colors.black,
            automaticallyImplyLeading: false,
            title: Row(children: [
              GestureDetector(
                  onTap: () {
                    Get.offAll(const Parent(
                      isFromDetail: false,
                      number: 1,
                    ));
                  },
                  child: Center(
                    child: Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: const Icon(
                          CupertinoIcons.chevron_back,
                          size: 30,
                        )),
                  )),
              const Bold(text: "Airtel Money", size: 20)
            ]),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: const [
                  Regular(
                      text:
                          "you will receive a prompt on mobile number  0787064145",
                      size: 16,
                      color: Colors.white70),
                  Regular(
                      text:
                          "Enter your PIN to authorize your payment of TZS 1,000,000 to account number 23435656",
                      size: 16,
                      color: Colors.white70),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
