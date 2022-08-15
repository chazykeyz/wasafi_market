import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:wasafi_market/controllers/user.dart';
import 'package:wasafi_market/screens/directed_screens/event/ticket.dart';
import 'package:wasafi_market/widgets/nav_header.dart';
import 'package:wasafi_market/widgets/text/bold.dart';
import 'package:wasafi_market/widgets/text/regular.dart';

class EventDetail extends StatefulWidget {
  const EventDetail({
    Key? key,
  }) : super(key: key);

  @override
  State<EventDetail> createState() => _EventDetailState();
}

class _EventDetailState extends State<EventDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GetBuilder<UserController>(builder: (userContent) {
        return CustomScrollView(slivers: [
          const NavHeader(
            userContent: "",
            isPage: false,
            title: 'Event Details',
            noCart: false,
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 300,
              child: Image.network(
                "https://images.unsplash.com/photo-1505373877841-8d25f7d46678?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1712&q=80",
                fit: BoxFit.fill,
              ),
            ),
          ),

          // upper side of ui the title of product and share button
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Bold(text: "Barnaba Ep Revial Party", size: 22),

                  // descriptions
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Regular(
                        text:
                            "placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.",
                        size: 14,
                        color: Colors.white),
                  ),
                  // time
                  Column(
                    children: [
                      ListTile(
                        leading: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              color: Colors.white24),
                          child: const Icon(
                            CupertinoIcons.time,
                            color: Colors.white,
                          ),
                        ),
                        title: const Regular(
                          color: Colors.white54,
                          text: "MARCH 24,2022",
                          size: 13,
                        ),
                        subtitle: const Bold(text: "9:00 - 12:00 PM", size: 14),
                        trailing: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.white24),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: const Icon(
                            Ionicons.calendar_clear_outline,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              color: Colors.white24),
                          child: const Icon(
                            CupertinoIcons.location,
                            color: Colors.white,
                          ),
                        ),
                        title: const Regular(
                          color: Colors.white54,
                          text: "+255 68 485 8229",
                          size: 13,
                        ),
                        subtitle:
                            const Bold(text: "Masaki, Dar Es Salaam", size: 14),
                        trailing: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.white24),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: const Icon(
                            CupertinoIcons.phone_fill,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => const Ticket());
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                            child: Regular(
                                text: "Buy Ticket - Tsh 1500/=",
                                size: 16,
                                color: Colors.white)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // sizes
        ]);
      }),
    );
  }
}
