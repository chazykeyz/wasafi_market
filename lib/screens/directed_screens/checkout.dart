import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasafi_market/widgets/text/bold.dart';
import 'package:wasafi_market/widgets/text/regular.dart';

class Checkout extends StatefulWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    var _city;

    void openLocation() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              color: Colors.black,
              child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      const Bold(text: "Reiceving Location", size: 20),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 1, color: Colors.white24))),
                        child: Regular(
                            text: "-Select City $_city",
                            size: 16,
                            color: Colors.blueAccent),
                      ),
                      Expanded(
                        child: ListView.builder(
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return RadioListTile(
                                value: 2,
                                groupValue: index,
                                onChanged: (val) {
                                  setState(() {
                                    _city = val;
                                  });
                                  print(val);
                                },
                                title: const Regular(
                                    text: "Dar es salaam",
                                    size: 15,
                                    color: Colors.white54),
                              );
                            }),
                      )
                    ],
                  )),
            );
          });
    }

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
                    Get.back();
                  },
                  child: Center(
                    child: Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: const Icon(
                          CupertinoIcons.chevron_back,
                          size: 30,
                        )),
                  )),
              const Bold(text: "Check out", size: 20)
            ]),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Bold(text: " Location", size: 16),
                GestureDetector(
                  onTap: () {
                    openLocation();
                  },
                  child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 6),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(width: 1, color: Colors.white30),
                          color: Colors.white12),
                      child: const ListTile(
                        dense: true,
                        title: Regular(
                            text: "Choose your Location",
                            size: 16,
                            color: Colors.white70),
                        trailing: Icon(
                          CupertinoIcons.chevron_right,
                          color: Colors.white70,
                          size: 24,
                        ),
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Bold(text: " Receiving Option", size: 16),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.white12),
                      color: Colors.white12,
                      borderRadius: BorderRadius.circular(16)),
                  child: Expanded(
                      child: Column(
                    children: [
                      RadioListTile(
                        value: 1,
                        groupValue: 1,
                        onChanged: (val) {},
                        title: const Regular(
                          color: Colors.white,
                          text: "Home Delivery",
                          size: 16,
                        ),
                        controlAffinity: ListTileControlAffinity.trailing,
                      ),
                      RadioListTile(
                          value: 2,
                          groupValue: 1,
                          controlAffinity: ListTileControlAffinity.trailing,
                          onChanged: (val) {},
                          title: const Regular(
                            color: Colors.white,
                            text: "W Offices",
                            size: 16,
                          )),
                    ],
                  )),
                )
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Bold(text: " Payment method", size: 16),
                const Bold(text: " Tsh 1,000,000 ", size: 22),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.white12),
                      color: Colors.white12,
                      borderRadius: BorderRadius.circular(16)),
                  child: Expanded(
                      child: Column(
                    children: [
                      RadioListTile(
                          value: 1,
                          groupValue: 1,
                          dense: true,
                          controlAffinity: ListTileControlAffinity.trailing,
                          onChanged: (val) {},
                          secondary: Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.all(5),
                            width: 44,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhWFy_tcr4pRjICkw87T-NkGlMNIxP54MrBTlFJd0nuA1nEJDvunPCasrLtYzKZzQxbSdM76OuqXKjGMnuYGePP1nQpCRKqQQPM0L1LMeJZjj9IlPUjQgZWzrbCP-_4Zdln_aPtAs_mBVugvlcNexJd7W9d2T5EAFskmJ976eDN_FftWBFjJWKCIjRk/s1600/e.png"),
                              ),
                            ),
                          ),
                          title: const Regular(
                            color: Colors.white,
                            text: "W wallet",
                            size: 16,
                          )),
                      RadioListTile(
                          value: 2,
                          groupValue: 1,
                          dense: true,
                          controlAffinity: ListTileControlAffinity.trailing,
                          onChanged: (val) {},
                          secondary: Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.all(5),
                            width: 44,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://blogger.googleusercontent.com/img/a/AVvXsEjrdSunzhOl9xw4GewKOmiImHIPoxE2p4Sw1jEl5Pjx97yLgHLBQJdxXwmOiyt-6nH3sNpSS8cx3V0hU-C7mYuQmv1E-We50xV2GOwL2AD30Wl8cCz9akfCm7WCoflMN6ZAmkySgtPmgkMhyXI9BF4m8efdT8ZTEY_scgcC02FvLoPRrqsT7qzNEY1V=s320"),
                              ),
                            ),
                          ),
                          title: const Regular(
                            color: Colors.white,
                            text: "Tigo Pesa",
                            size: 16,
                          )),
                      RadioListTile(
                          value: 2,
                          groupValue: 1,
                          dense: true,
                          controlAffinity: ListTileControlAffinity.trailing,
                          onChanged: (val) {},
                          secondary: Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.all(5),
                            width: 44,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://blogger.googleusercontent.com/img/a/AVvXsEigfHUJlFdfla_-HM1KW8gKsKjuY7gxqwfzpIgdUhs8vJW7ZuDkEcextQ8mvY4cccyCkUfOSEWhBHdZ6Rn7seSo8Qg5SyXbiDr4kaW27cx0hzmIyfabpBz9GGhHO5VDT0A6KmkgUadAb_k790SJ_Jr-ilRGbaJ8BhRqeEEyP-RrjKHoxjVDRnhYTFy1=s320"),
                              ),
                            ),
                          ),
                          title: const Regular(
                            color: Colors.white,
                            text: "Mpesa ",
                            size: 16,
                          )),
                      RadioListTile(
                          value: 2,
                          groupValue: 1,
                          dense: true,
                          controlAffinity: ListTileControlAffinity.trailing,
                          onChanged: (val) {},
                          secondary: Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.all(5),
                            width: 44,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://blogger.googleusercontent.com/img/a/AVvXsEgJgOyoYc9myRWuf4sQfGeTBvcbC5gQSwKl2g22NaIrlRzyH9XXZMLgHya1_3XV3So_BRRjDm760HS1HcAewF3gWEtB5c-SdCXW-fDzLKSXh56XW4ukrk6GMtYzROWiGq3QKSbyrgUWGWw2DjkIcbnacCx9oU-HBt0rp2G9q4ITn7I5s1thotc3jn-k=s320"),
                              ),
                            ),
                          ),
                          title: const Regular(
                            color: Colors.white,
                            text: "Airtel Money ",
                            size: 16,
                          )),
                    ],
                  )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
