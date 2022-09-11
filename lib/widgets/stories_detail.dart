import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:story/story.dart';
import 'package:story_view/story_view.dart';
import 'package:wasafi_market/screens/directed_screens/user/seller_profile.dart';
import 'package:wasafi_market/widgets/avatar.dart';
import 'package:wasafi_market/widgets/text/bold.dart';
import 'package:wasafi_market/widgets/text/regular.dart';

class Story extends StatefulWidget {
  const Story({Key? key}) : super(key: key);

  @override
  State<Story> createState() => _StoryState();
}

class _StoryState extends State<Story> {
  bool isEnd = false;
  late StoryController storyController;
  dynamic allStoriesData = Get.arguments[1];
  dynamic stories = Get.arguments[0];
  dynamic indexOfAllStories = Get.arguments[2];

  @override
  Widget build(BuildContext context) {
// TIME AGO FUNCTION
    String timeAgo(DateTime d) {
      Duration diff = DateTime.now().difference(d);
      if (diff.inDays > 365) {
        return "${(diff.inDays / 365).floor()} ${(diff.inDays / 365).floor() == 1 ? "year" : "years"} Ago";
      }
      if (diff.inDays > 30) {
        return "${(diff.inDays / 30).floor()} ${(diff.inDays / 30).floor() == 1 ? "month" : "months"} Ago";
      }
      if (diff.inDays > 7) {
        return "${(diff.inDays / 7).floor()} ${(diff.inDays / 7).floor() == 1 ? "week" : "weeks"} Ago";
      }
      if (diff.inDays > 0) {
        return "${diff.inDays} ${diff.inDays == 1 ? "day" : "days"} Ago";
      }
      if (diff.inHours > 0) {
        return "${diff.inHours} ${diff.inHours == 1 ? "hour" : "hours"} Ago";
      }
      if (diff.inMinutes > 0) {
        return "${diff.inMinutes} ${diff.inMinutes == 1 ? "minute" : "minutes"} Ago";
      }
      return "Just now";
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: StoryPageView(
          initialPage: indexOfAllStories,
          itemBuilder: (context, pageIndex, storyIndex) {
            var storyUsers = allStoriesData[pageIndex];
            var stories = storyUsers.storyInstance[storyIndex];

            return Container(
              color: Colors.black,
              child: Stack(children: [
                //  blurred main image with blurred image
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(stories.media), fit: BoxFit.cover),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaY: 10, sigmaX: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        image:
                            DecorationImage(image: NetworkImage(stories.media)),
                      ),
                    ),
                  ),
                ),
                // caption
                Positioned(
                  bottom: 50,
                  right: 20,
                  left: 20,
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white12),
                    child: Regular(
                      color: Colors.white,
                      size: 14,
                      text: stories.caption,
                    ),
                  ),
                ),
              ]),
            );
          },
          pageLength: allStoriesData.length,
          onPageLimitReached: () {
            Get.back();
          },
          gestureItemBuilder: (context, pageIndex, storyIndex) {
            var storyUsers = allStoriesData[pageIndex];
            return Align(
              alignment: Alignment.topRight,
              child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: ListTile(
                    leading: GestureDetector(
                      onTap: () {
                        Get.to(() => const SellerProfile(),
                            arguments: storyUsers.user.id);
                      },
                      child: AvatarCircle(
                          width: 50,
                          height: 50,
                          thumbnail: storyUsers.user.profilePicture),
                    ),
                    title: GestureDetector(
                      onTap: () {
                        Get.to(() => const SellerProfile(),
                            arguments: storyUsers.user.id);
                      },
                      child: Bold(text: storyUsers.user.shopName, size: 14),
                    ),
                    subtitle: Regular(
                      text: timeAgo(storyUsers.storyInstance[0].createdAt),
                      size: 13,
                      color: Colors.white,
                    ),
                    trailing: IconButton(
                        onPressed: () {
                          print("clicked");
                          Get.back();
                        },
                        icon: const Icon(
                          CupertinoIcons.clear,
                          color: Colors.white,
                        )),
                  )),
            );
          },
          storyLength: (pageIndex) =>
              allStoriesData[pageIndex].storyInstance.length,
        ),
      ),
    );
  }
}
