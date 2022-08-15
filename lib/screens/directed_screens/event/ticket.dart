import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:wasafi_market/controllers/user.dart';
import 'package:wasafi_market/widgets/nav_header.dart';
import 'package:wasafi_market/widgets/text/bold.dart';
import 'package:wasafi_market/widgets/text/regular.dart';

class Ticket extends StatefulWidget {
  const Ticket({
    Key? key,
  }) : super(key: key);

  @override
  State<Ticket> createState() => _TicketState();
}

class _TicketState extends State<Ticket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GetBuilder<UserController>(builder: (userContent) {
        return CustomScrollView(slivers: [
          const NavHeader(
            userContent: "",
            isPage: false,
            title: 'Event Ticket',
            noCart: false,
          ),
          SliverToBoxAdapter(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width - 40,
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.purple,
                                Colors.red,
                              ]),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: SizedBox(
                                height: 200,
                                width: MediaQuery.of(context).size.width - 60,
                                child: Image.network(
                                  "https://images.unsplash.com/photo-1505373877841-8d25f7d46678?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1712&q=80",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Bold(
                                  text: "Barnaba Ep Revial Party", size: 22),
                            ),
                            const Regular(
                                text: "By Wasafi Media",
                                size: 14,
                                color: Colors.white),
                            const SizedBox(
                              height: 25,
                            ),
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
                                      CupertinoIcons.person,
                                      color: Colors.white,
                                    ),
                                  ),
                                  title: const Regular(
                                    color: Colors.white54,
                                    text: "FULLNAME",
                                    size: 13,
                                  ),
                                  subtitle: const Bold(
                                      text: "CHARLES JAPHET CHARLES", size: 14),
                                ),
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
                                  subtitle: const Bold(
                                      text: "9:00 - 12:00 PM", size: 14),
                                  trailing: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Colors.white24),
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
                                  subtitle: const Bold(
                                      text: "Masaki, Dar Es Salaam", size: 14),
                                  trailing: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Colors.white24),
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
                            Container(
                              margin: const EdgeInsets.only(top: 20),
                              width: double.infinity,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const Bold(text: "Scan Me", size: 22),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: SizedBox(
                                        height: 100,
                                        child: Image.network(
                                          "https://media-cldnry.s-nbcnews.com/image/upload/t_fit-1240w,f_auto,q_auto:best/MSNBC/Components/Photo/_new/110322-qr-code-hmed-425p.jpg",
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ]),
                            ),
                          ]),
                    ),
                  ),
                ),
                //  TOP

                Positioned(
                    top: 270,
                    right: 0,
                    left: 0,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(15)),
                          ),
                          const Regular(
                              text:
                                  "---------------------------------------------",
                              size: 16,
                              color: Colors.black),
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        ]))
                //  BOTTOM
                ,
                Positioned(
                    top: 500,
                    right: 0,
                    left: 0,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(15)),
                          ),
                          const Regular(
                              text:
                                  "---------------------------------------------",
                              size: 16,
                              color: Colors.black),
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        ]))
              ],
            ),
          )
        ]);
      }),
    );
  }
}
