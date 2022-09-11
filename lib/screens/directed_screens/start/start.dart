import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wasafi_market/widgets/text/bold.dart';
import 'package:wasafi_market/widgets/text/regular.dart';

class Start extends StatelessWidget {
  const Start({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
          children: [
            const SizedBox(
              height: 150,
            ),
            const Center(
                child: Text(
              "Welcome to Wasafi Mall",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w800,
                  color: Colors.white),
            )),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              child: const Regular(
                  text:
                      "is the buying and selling of goods and services over the Internet.It is conducted over computers, tablets, smartphones, and other smart devices.",
                  size: 14,
                  color: Colors.white60),
            ),
            const SizedBox(
              height: 30,
            ),
            const ListTile(
              leading: Icon(
                CupertinoIcons.bag_fill,
                color: Colors.blue,
              ),
              minLeadingWidth: 20,
              horizontalTitleGap: 10,
              title: Bold(
                text: "Online Shop",
                size: 14,
              ),
              subtitle: Regular(
                  text:
                      "Lorem ipsum may be used as a placeholder before final copy is available.",
                  size: 14,
                  color: Colors.white60),
            ),
            const SizedBox(
              height: 20,
            ),
            const ListTile(
              leading: Icon(
                CupertinoIcons.tickets_fill,
                color: Colors.blue,
                size: 30,
              ),
              minLeadingWidth: 20,
              horizontalTitleGap: 10,
              title: Bold(
                text: "Online Booking",
                size: 14,
              ),
              subtitle: Regular(
                  text:
                      "Lorem ipsum may be used as a placeholder before final copy is available.",
                  size: 14,
                  color: Colors.white60),
            ),
            const SizedBox(
              height: 20,
            ),
            const ListTile(
              leading: Icon(
                CupertinoIcons.quote_bubble_fill,
                color: Colors.blue,
                size: 30,
              ),
              minLeadingWidth: 20,
              horizontalTitleGap: 10,
              title: Bold(
                text: "Social Platform",
                size: 14,
              ),
              subtitle: Regular(
                  text:
                      "Lorem ipsum may be used as a placeholder before final copy is available.",
                  size: 14,
                  color: Colors.white60),
            )
          ],
        ),
        Column(
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                    child: Regular(
                        text: "Continue", size: 16, color: Colors.white)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Regular(
                      text: "By continuing, you agree to the",
                      size: 13,
                      color: Colors.white),
                  Regular(
                      text: "Terms of Services", size: 13, color: Colors.blue),
                  Regular(text: " and", size: 13, color: Colors.white)
                ],
              ),
            ),
            const Center(
                child: Regular(
                    text: "Privacy Policy.", size: 13, color: Colors.blue)),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ]),
    );
  }
}
