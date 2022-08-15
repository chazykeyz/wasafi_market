import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasafi_market/controllers/order.dart';
import 'package:wasafi_market/main.dart';
import 'package:wasafi_market/widgets/nav_header.dart';
import 'package:wasafi_market/widgets/text/bold.dart';
import 'package:wasafi_market/widgets/text/regular.dart';

class Checkout extends StatefulWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  bool _delivery = false;
  List location = [];
  String network = "M-pesa";
  String phoneNumber = "";

  @override
  Widget build(BuildContext context) {
    void openLocation() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Builder(builder: (context) {
              return GetBuilder<OrderController>(builder: (mapData) {
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
                            height: 10,
                          ),
                          Row(children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Icon(
                                CupertinoIcons.search,
                                color: Colors.blueAccent,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: const Bold(
                                text: "SEARCH YOUR LOCATION",
                                size: 14,
                              ),
                            ),
                          ]),
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                              color: Colors.white10,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              // inputs
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 2),
                                  child: Container(
                                    height: 30,
                                    margin: const EdgeInsets.only(
                                        top: 10,
                                        bottom: 4,
                                        left: 10,
                                        right: 10),
                                    width:
                                        MediaQuery.of(context).size.width - 20,
                                    child: TextField(
                                      onChanged: (value) {
                                        Get.find<OrderController>()
                                            .fetchPlaces(value);
                                      },
                                      keyboardAppearance: Brightness.dark,
                                      maxLines: 1,
                                      autocorrect: false,
                                      autofocus: true,
                                      style:
                                          const TextStyle(color: Colors.white),
                                      decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          counterText: "",
                                          hintStyle:
                                              TextStyle(color: Colors.white70),
                                          hintText: 'Search place'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 300,
                            margin: const EdgeInsets.only(top: 20),
                            child: ListView.separated(
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        location.clear();
                                        location.add(mapData.mapSearch[index]);
                                      });
                                      Get.back();
                                    },
                                    child: Row(
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 4),
                                          child: Icon(
                                            CupertinoIcons.location,
                                            color: Colors.blueAccent,
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Bold(
                                                text: mapData
                                                    .mapSearch[index].text
                                                    .toString(),
                                                size: 14),
                                            Regular(
                                                text: mapData
                                                    .mapSearch[index].placeName
                                                    .toString(),
                                                size: 13,
                                                color: Colors.white30)
                                          ],
                                        )
                                      ],
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) =>
                                    const Divider(
                                      color: Colors.white30,
                                    ),
                                itemCount: mapData.mapSearch.length),
                          )
                        ],
                      )),
                );
              });
            });
          });
    }

    void payInfo() {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return Scaffold(
              backgroundColor: Colors.transparent,
              body: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Center(
                  child: Container(
                    height: 180,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.3),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 10),
                          child: Bold(text: network, size: 18),
                        ),
                        Container(
                          height: 1,
                          color: Colors.black,
                          margin: const EdgeInsets.symmetric(vertical: 10),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          width: double.infinity,
                          child: Center(
                            child: Regular(
                                text:
                                    "You will receive a prompt on mobile number  $phoneNumber, Enter your PIN to authorize your payment of TZS 1,000,000 to account number 23435656",
                                size: 16,
                                color: Colors.white),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.offAll(const Parent(
                              isFromDetail: false,
                              number: 1,
                            ));
                          },
                          child: const Text('Ok'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          });
    }

    void openPay() {
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
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      const Bold(text: "Tsh 1,000,000", size: 20),
                      Regular(
                          text: "Pay with $network",
                          size: 16,
                          color: Colors.white70),
                      const SizedBox(
                        height: 4,
                      ),
                      const Regular(
                          text: "Ref:23545435",
                          size: 16,
                          color: Colors.blueAccent),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 1,
                        color: Colors.black,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                      ),
                      const Bold(text: "Mobile Number", size: 16),
                      Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 4, vertical: 6),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border:
                                  Border.all(width: 1, color: Colors.white30),
                              color: Colors.white12),
                          child: TextField(
                            onChanged: (value) {
                              setState(() {
                                phoneNumber = value;
                              });
                            },
                            maxLength: 10,
                            keyboardType: TextInputType.number,
                            style: const TextStyle(color: Colors.white70),
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                counterText: "",
                                hintStyle: TextStyle(color: Colors.white70),
                                hintText: "Enter Phone Number"),
                          )),
                      GestureDetector(
                        onTap: () {
                          payInfo();
                        },
                        child: Container(
                          margin: const EdgeInsets.all(4),
                          padding: const EdgeInsets.symmetric(horizontal: 60),
                          height: 44,
                          decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(16)),
                          child: const Center(
                            child: Regular(
                              color: Colors.white,
                              text: "Pay Tsh 1,000,000 ",
                              size: 15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            );
          });
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          const NavHeader(
            userContent: '',
            isPage: false,
            title: 'Checkout',
            noCart: false,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Bold(text: "Checkout", size: 24),
                  const SizedBox(
                    height: 20,
                  ),
                  const Bold(text: "Location", size: 16),
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
                            color: Colors.white12),
                        child: ListTile(
                          dense: true,
                          title: Regular(
                              text: location.isEmpty
                                  ? "Search your place"
                                  : location[0].text.toString(),
                              size: 16,
                              color: Colors.white70),
                          trailing: const Icon(
                            CupertinoIcons.search,
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
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(
                        color: Colors.white12,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              _delivery = true;
                            });
                          },
                          child: Container(
                            height: 40,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 2),
                            decoration: BoxDecoration(
                                color: _delivery ? Colors.white12 : null,
                                borderRadius: BorderRadius.circular(15)),
                            child: const Center(
                              child: Regular(
                                  text: "Home Delivery",
                                  size: 15,
                                  color: Colors.white54),
                            ),
                          ),
                        ),
                        Container(
                          height: 1,
                          color: Colors.black,
                          margin: const EdgeInsets.symmetric(vertical: 5),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _delivery = false;
                            });
                          },
                          child: Container(
                            height: 40,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 2),
                            decoration: BoxDecoration(
                                color: !_delivery ? Colors.white12 : null,
                                borderRadius: BorderRadius.circular(15)),
                            child: const Center(
                              child: Regular(
                                  text: "WM Offices",
                                  size: 15,
                                  color: Colors.white54),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Bold(text: "Payment method", size: 16),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.white12,
                        borderRadius: BorderRadius.circular(16)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Bold(text: " Tsh 1,000,000 ", size: 22),
                        ),
                        Container(
                          height: 1,
                          color: Colors.black,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              network = "M-pesa";
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 2),
                            decoration: BoxDecoration(
                                color:
                                    network == "M-pesa" ? Colors.white12 : null,
                                borderRadius: BorderRadius.circular(15)),
                            child: ListTile(
                                title: const Regular(
                                  color: Colors.white,
                                  text: "M-Pesa",
                                  size: 16,
                                ),
                                leading: Container(
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.all(5),
                                  width: 44,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          "https://blogger.googleusercontent.com/img/a/AVvXsEigfHUJlFdfla_-HM1KW8gKsKjuY7gxqwfzpIgdUhs8vJW7ZuDkEcextQ8mvY4cccyCkUfOSEWhBHdZ6Rn7seSo8Qg5SyXbiDr4kaW27cx0hzmIyfabpBz9GGhHO5VDT0A6KmkgUadAb_k790SJ_Jr-ilRGbaJ8BhRqeEEyP-RrjKHoxjVDRnhYTFy1=s320"),
                                    ),
                                  ),
                                )),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              network = "Tigo pesa";
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 2),
                            decoration: BoxDecoration(
                                color: network == "Tigo pesa"
                                    ? Colors.white12
                                    : null,
                                borderRadius: BorderRadius.circular(15)),
                            child: ListTile(
                                title: const Regular(
                                  color: Colors.white,
                                  text: "Tigo Pesa",
                                  size: 16,
                                ),
                                leading: Container(
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.all(5),
                                  width: 44,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          "https://blogger.googleusercontent.com/img/a/AVvXsEjrdSunzhOl9xw4GewKOmiImHIPoxE2p4Sw1jEl5Pjx97yLgHLBQJdxXwmOiyt-6nH3sNpSS8cx3V0hU-C7mYuQmv1E-We50xV2GOwL2AD30Wl8cCz9akfCm7WCoflMN6ZAmkySgtPmgkMhyXI9BF4m8efdT8ZTEY_scgcC02FvLoPRrqsT7qzNEY1V=s320"),
                                    ),
                                  ),
                                )),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              network = "Airtel money";
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 2),
                            decoration: BoxDecoration(
                                color: network == 'Airtel money'
                                    ? Colors.white12
                                    : null,
                                borderRadius: BorderRadius.circular(15)),
                            child: ListTile(
                                title: const Regular(
                                  color: Colors.white,
                                  text: "Airtel Money",
                                  size: 16,
                                ),
                                leading: Container(
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.all(5),
                                  width: 44,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          "https://blogger.googleusercontent.com/img/a/AVvXsEgJgOyoYc9myRWuf4sQfGeTBvcbC5gQSwKl2g22NaIrlRzyH9XXZMLgHya1_3XV3So_BRRjDm760HS1HcAewF3gWEtB5c-SdCXW-fDzLKSXh56XW4ukrk6GMtYzROWiGq3QKSbyrgUWGWw2DjkIcbnacCx9oU-HBt0rp2G9q4ITn7I5s1thotc3jn-k=s320"),
                                    ),
                                  ),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      openPay();
                    },
                    child: Center(
                      child: Container(
                        margin: const EdgeInsets.all(4),
                        padding: const EdgeInsets.symmetric(horizontal: 60),
                        height: 44,
                        decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(16)),
                        child: const Center(
                          child: Regular(
                            color: Colors.white,
                            text: "Pay Now",
                            size: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
