import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasafi_market/widgets/stories.dart';
import 'package:wasafi_market/widgets/text/bold.dart';

class Status extends StatelessWidget {
  const Status({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => const Story());
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(18, 255, 255, 255),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            children: [
              const Image(
                width: 150,
                image: NetworkImage(
                    "https://images.unsplash.com/photo-1554151228-14d9def656e4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2786&q=80"),
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                top: 0,
                child: Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                        Color.fromARGB(206, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0)
                      ])),
                  child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(width: 2, color: Colors.red),
                                color: Colors.white),
                            child: Center(
                              child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: const Color.fromARGB(
                                        255, 238, 237, 237),
                                    image: const DecorationImage(
                                        image: NetworkImage(
                                            "https://images.unsplash.com/photo-1596215143922-eedeaba0d91c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDF8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=800&q=60"),
                                        fit: BoxFit.cover),
                                  )),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 4.0, bottom: 8),
                            child: Center(
                              child: Bold(
                                text: "chazy keyz",
                                size: 14,
                              ),
                            ),
                          )
                        ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
