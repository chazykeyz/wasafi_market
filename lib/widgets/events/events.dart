import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasafi_market/screens/directed_screens/event/event_detail.dart';
import 'package:wasafi_market/widgets/text/bold.dart';
import 'package:wasafi_market/widgets/text/regular.dart';

class EventCard extends StatelessWidget {
  const EventCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => const EventDetail());
      },
      child: Container(
        margin: const EdgeInsets.all(4),
        width: MediaQuery.of(context).size.width / 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                height: 150,
                child: Stack(children: [
                  ClipRRect(
                    child: Container(
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://images.unsplash.com/photo-1531058020387-3be344556be6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80"),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  Positioned(
                    top: 4,
                    left: 4,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaY: 7, sigmaX: 7),
                        child: Container(
                          height: 40,
                          width: 50,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white38),
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white38),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Text("Mar",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900)),
                                Regular(
                                    text: "14", size: 14, color: Colors.white)
                              ]),
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Bold(text: "women power", size: 14),
                    Row(
                      children: const [
                        Icon(
                          CupertinoIcons.location,
                          color: Colors.blue,
                          size: 16,
                        ),
                        Regular(
                          text: "Masaki, Dar es salaam",
                          size: 13,
                          color: Colors.blue,
                        )
                      ],
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
