import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:story_view/story_view.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:transformer_page_view/transformer_page_view.dart';
import 'package:wasafi_market/screens/home.dart';
import 'package:wasafi_market/widgets/avatar.dart';
import 'package:wasafi_market/widgets/text/bold.dart';
import 'package:wasafi_market/widgets/text/regular.dart';
import 'package:wasafi_market/widgets/transformaters.dart';

class Story extends StatefulWidget {
  const Story({Key? key}) : super(key: key);

  @override
  State<Story> createState() => _StoryState();
}

class _StoryState extends State<Story> {
  final pageController = IndexController();
  bool isEnd = false;
  final storyController = StoryController();

  @override
  void dispose() {
    storyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: TransformerPageView(
          scrollDirection: Axis.horizontal,
          curve: Curves.easeInBack,
          transformer: transformers[4],
          controller: pageController,
          itemCount: 2,
          onPageChanged: (i) {
            if (i == 2 - 1) {
              setState(() {
                isEnd = true;
              });
            }
          },
          itemBuilder: (context, index) {
            return Stack(children: [
              StoryView(
                controller: storyController,
                onComplete: () {
                  if (isEnd) {
                    Get.back();
                  }
                },
                repeat: true,
                storyItems: [
                  StoryItem.pageImage(
                    controller: storyController,
                    url:
                        "https://images.unsplash.com/photo-1596215143922-eedeaba0d91c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80",
                    caption: "Simply beautiful😘😘😘",
                  ),
                  StoryItem.pageImage(
                    controller: storyController,
                    imageFit: BoxFit.cover,
                    url:
                        "https://images.unsplash.com/photo-1596215143762-aedbf154e539?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDJ8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=800&q=60",
                    caption: "Simply beautiful😘😘😘",
                  ),
                  StoryItem.pageImage(
                    controller: storyController,
                    url:
                        "https://images.unsplash.com/photo-1571816119607-57e48af1caa9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDExfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=800&q=60",
                    caption: "Simply beautiful😘😘😘",
                  ),
                  StoryItem.text(
                      title: "WOW !!! i built my first status story",
                      backgroundColor: const Color.fromARGB(255, 204, 104, 84),
                      roundedTop: true,
                      roundedBottom: true,
                      shown: false),
                ],
              ),
              Positioned(
                  top: 65,
                  left: 0,
                  right: 0,
                  child: ListTile(
                    leading: const AvatarCircle(
                        width: 50,
                        height: 50,
                        thumbnail:
                            "https://images.unsplash.com/photo-1521146764736-56c929d59c83?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDF8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=800&q=60"),
                    title: const Bold(text: "Chazy Keyz", size: 14),
                    subtitle: const Regular(
                      text: "14 Hours Ago",
                      size: 13,
                      color: Colors.white,
                    ),
                    trailing: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(
                          CupertinoIcons.clear,
                          color: Colors.white,
                        )),
                  )),
              Positioned(
                  left: 0,
                  right: 0,
                  bottom: 25,
                  child: InkWell(
                    onTap: () {
                      Get.to(() => const Home());
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Bold(text: "See More", size: 13),
                          Icon(
                            CupertinoIcons.chevron_compact_right,
                            color: Colors.white,
                          )
                        ]),
                  ))
            ]);
          },
        ));
  }
}
