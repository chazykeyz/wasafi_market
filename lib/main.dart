import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:wasafi_market/controllers/auth.dart';
import 'package:wasafi_market/controllers/product_category.dart';
import 'package:wasafi_market/controllers/products.dart';
import 'package:wasafi_market/controllers/user.dart';
import 'package:wasafi_market/screens/navigation_screens/account.dart';
import 'package:wasafi_market/screens/navigation_screens/cart.dart';
import 'package:wasafi_market/screens/navigation_screens/events.dart';
import 'package:wasafi_market/screens/navigation_screens/explore.dart';
import 'package:wasafi_market/screens/navigation_screens/home.dart';
import 'package:wasafi_market/widgets/text/regular.dart';
import 'helper/dependencies.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<ProductsController>().getProducts();
    Get.find<ProductCategoryController>().getProductCategory();
    Get.find<UserController>().gettingUser();

    return GetMaterialApp(
      title: 'Wasafi Mall',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Parent(
        isFromDetail: false,
        number: 0,
      ),
    );
  }
}

class Parent extends StatefulWidget {
  const Parent({
    Key? key,
    required this.isFromDetail,
    required this.number,
  }) : super(key: key);
  final bool isFromDetail;
  final int number;
  @override
  State<Parent> createState() => _ParentState();
}

class _ParentState extends State<Parent> {
  int selectedItem = 0;

  void navigationChange(int index) {
    setState(() {
      selectedItem = index;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (widget.isFromDetail == true) {
        navigationChange(widget.number);
      }
      // auth check to get the user data initially
      if (Get.find<AuthController>().logginUser()) {
        Get.find<UserController>().gettingUser();
      }
    });
  }

//  the screen children
  final List _screenChildren = const [
    Home(),
    Explore(),
    Cart(),
    Events(),
    Account(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottom navigations
      backgroundColor: Colors.black,
      body: GetBuilder<UserController>(builder: (userContent) {
        return Stack(children: [
          Center(
            child: _screenChildren[selectedItem],
          ),
          Align(
            alignment: FractionalOffset.bottomCenter,
            child: Container(
              decoration: const BoxDecoration(
                  border:
                      Border(top: BorderSide(color: Colors.white12, width: 1))),
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: BottomNavigationBar(
                      onTap: navigationChange,
                      currentIndex: selectedItem,
                      selectedItemColor: Colors.blue,
                      unselectedItemColor:
                          const Color.fromARGB(255, 169, 169, 169),
                      items: [
                        // the home navigation
                        BottomNavigationBarItem(
                          backgroundColor: Colors.black.withOpacity(.6),
                          icon: const Icon(
                            Ionicons.home_outline,
                            size: 25,
                          ),
                          activeIcon: const Icon(Ionicons.home_sharp),
                          label: "Home",
                        )
                        //        explore navigation
                        ,
                        BottomNavigationBarItem(
                          backgroundColor: Colors.black.withOpacity(.6),
                          icon: const Icon(CupertinoIcons.location_north),
                          activeIcon:
                              const Icon(CupertinoIcons.location_north_fill),
                          label: "Explore",
                        )
                        //  shop navigation
                        ,

                        BottomNavigationBarItem(
                          backgroundColor: Colors.black.withOpacity(.6),
                          icon: SizedBox(
                            width: 40,
                            height: 20,
                            child: Stack(children: [
                              Container(
                                  margin: const EdgeInsets.only(top: 8),
                                  child: const Icon(CupertinoIcons.bag)),
                              Positioned(
                                  left: 15,
                                  child: Container(
                                    padding: const EdgeInsets.all(2),
                                    constraints: const BoxConstraints(
                                        minHeight: 20, minWidth: 20),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.blueAccent),
                                    child: Center(
                                      child: Regular(
                                          text: userContent.userList.isEmpty
                                              ? '0'
                                              : userContent
                                                  .userList[0].cart.length
                                                  .toString(),
                                          size: 12,
                                          color: Colors.white),
                                    ),
                                  ))
                            ]),
                          ),
                          activeIcon: const Icon(CupertinoIcons.bag_fill),
                          label: "Cart",
                        ),
                        BottomNavigationBarItem(
                          backgroundColor: Colors.black.withOpacity(.6),
                          icon: SizedBox(
                            width: 40,
                            child: Column(children: [
                              const Icon(Ionicons.calendar_clear_outline),
                              userContent.userList.isEmpty
                                  ? const SizedBox(
                                      height: 0,
                                    )
                                  : userContent.userList[0].notification
                                              .where((element) =>
                                                  element.isRead == false)
                                              .length !=
                                          0
                                      ? Center(
                                          child: Container(
                                            height: 6,
                                            width: 6,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(3),
                                                color: Colors.blueAccent),
                                          ),
                                        )
                                      : const SizedBox(
                                          height: 0,
                                        )
                            ]),
                          ),
                          activeIcon: const Icon(Ionicons.calendar),
                          label: "Events",
                        ),
                        BottomNavigationBarItem(
                          backgroundColor: Colors.black.withOpacity(.6),
                          icon: const Icon(CupertinoIcons.person_alt_circle),
                          activeIcon:
                              const Icon(CupertinoIcons.person_alt_circle_fill),
                          label: "Account",
                        ),
                      ]),
                ),
              ),
            ),
          ),
        ]);
      }),
    );
  }
}
