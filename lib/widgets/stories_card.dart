import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasafi_market/widgets/stories_detail.dart';
import 'package:wasafi_market/widgets/text/regular.dart';

class Status extends StatelessWidget {
  const Status(
      {Key? key,
      required this.data,
      required this.allData,
      required this.index})
      : super(key: key);
  final dynamic data;
  final dynamic allData;
  final dynamic index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => const Story(),
            arguments: [data, allData, index],
            transition: Transition.cupertinoDialog);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(18, 255, 255, 255),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            children: [
              Image(
                width: 130,
                height: 200,
                image: NetworkImage(
                    data.storyInstance[data.storyInstance.length - 1].media),
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                top: 0,
                child: Container(
                  height: 200,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                        Color.fromARGB(255, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 200)
                      ])),
                  child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Center(
                            child: Container(
                              height: 55,
                              width: 55,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color:
                                      const Color.fromARGB(91, 255, 255, 255)),
                              child: Container(
                                margin: const EdgeInsets.all(5),
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white),
                                child: Center(
                                  child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        color: const Color.fromARGB(
                                            255, 238, 237, 237),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                data.user.profilePicture),
                                            fit: BoxFit.cover),
                                      )),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0, bottom: 8),
                            child: Center(
                              child: Regular(
                                text: data.user.shopName,
                                size: 12,
                                color: Colors.white,
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
