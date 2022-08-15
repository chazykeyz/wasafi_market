import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasafi_market/controllers/auth.dart';
import 'package:wasafi_market/controllers/user.dart';
import 'package:wasafi_market/main.dart';
import 'package:wasafi_market/models/user/user.dart';
import 'package:wasafi_market/screens/directed_screens/product_detail.dart';
import 'package:wasafi_market/screens/free_screens/signup.dart';
import 'package:wasafi_market/widgets/nav_header.dart';
import 'package:wasafi_market/widgets/show_snackbar.dart';
import 'package:wasafi_market/widgets/text/bold.dart';
import 'package:wasafi_market/widgets/text/regular.dart';

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (!Get.find<AuthController>().logginUser()) {
        Get.offAll(() => const SignUp(
              signDestination: Parent(
                isFromDetail: true,
                number: 0,
              ),
            ));
      } else {
        Get.find<UserController>().gettingUser();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GetBuilder<UserController>(builder: (userContent) {
        return userContent.userList.isEmpty
            ? const Center(
                child: CupertinoActivityIndicator(
                  color: Colors.blueAccent,
                  radius: 14,
                ),
              )
            : CustomScrollView(
                slivers: [
                  const NavHeader(
                    userContent: '',
                    isPage: false,
                    title: 'Wish List',
                    noCart: false,
                  ),
                  SliverToBoxAdapter(
                      child: Container(
                          height: MediaQuery.of(context).size.height,
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height -
                                              20,
                                      child: MediaQuery.removePadding(
                                        removeTop: true,
                                        context: context,
                                        child: ListView.builder(
                                            scrollDirection: Axis.vertical,
                                            itemCount: userContent
                                                .userList[0].favorite.length,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5),
                                                child: InkWell(
                                                  onTap: () {
                                                    Get.to(() => ProductDetail(
                                                        data: userContent
                                                            .userList[0]
                                                            .favorite[index]));
                                                  },
                                                  child: ListTile(
                                                    leading: Container(
                                                        width: 58,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                          border: Border.all(
                                                              color: Colors
                                                                  .white12),
                                                          color: const Color
                                                                  .fromARGB(36,
                                                              238, 237, 237),
                                                          image: DecorationImage(
                                                              image: NetworkImage(
                                                                  userContent
                                                                      .userList[
                                                                          0]
                                                                      .favorite[
                                                                          index]
                                                                      .thumbnail[0]),
                                                              fit: BoxFit.cover),
                                                        )),
                                                    title: Bold(
                                                      text: userContent
                                                          .userList[0]
                                                          .favorite[index]
                                                          .name,
                                                      size: 14,
                                                    ),
                                                    subtitle: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Regular(
                                                            text:
                                                                "Tsh ${userContent.userList[0].favorite[index].price.toString()} ",
                                                            size: 14,
                                                            color:
                                                                Colors.white54),
                                                        const Regular(
                                                            text:
                                                                "out of Stock",
                                                            size: 14,
                                                            color:
                                                                Colors.white54)
                                                      ],
                                                    ),
                                                    trailing: GestureDetector(
                                                      onTap: () {
                                                        List<String> newList =
                                                            [];
                                                        newList.add(userContent
                                                            .userList[0]
                                                            .favorite[index]
                                                            .id);
                                                        FavoriteModel
                                                            favoriteModel =
                                                            FavoriteModel(
                                                                favorite:
                                                                    newList);

                                                        Get.find<
                                                                UserController>()
                                                            .updateUserInfo(
                                                                favoriteModel)
                                                            .then((status) {
                                                          if (status
                                                              .isSuccess) {
                                                            showCustomSnackBar(
                                                                "${userContent.userList[0].favorite[index].name} has been removed to favorite List!",
                                                                title:
                                                                    "Favorite List");
                                                            Get.find<
                                                                    UserController>()
                                                                .gettingUser();
                                                          } else {
                                                            showCustomSnackBar(
                                                                "${userContent.userList[0].favorite[index].name} failed to be removed to favorite List!",
                                                                title:
                                                                    "Favorite List");
                                                          }
                                                        });
                                                      },
                                                      child: const Icon(
                                                        CupertinoIcons.clear,
                                                        size: 16,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }),
                                      ),
                                    ),
                                  ])
                            ],
                          ))),
                ],
              );
      }),
    );
  }
}
