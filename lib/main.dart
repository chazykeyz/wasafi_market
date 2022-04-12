import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:ionicons/ionicons.dart';
import 'package:wasafi_market/screens/navigation_screens/favorite.dart';
import 'package:wasafi_market/screens/navigation_screens/home.dart';
import 'package:wasafi_market/screens/navigation_screens/explore.dart';
import 'package:wasafi_market/screens/navigation_screens/shops.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const Parent(),
    );
  }
}

class Parent extends StatefulWidget {
  const Parent({Key? key}) : super(key: key);

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

//  the screen children
  final List _screenChildren = const [
    Home(),
    Explore(),
    Shops(),
    Favorite(),
    Text("page 5"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottom navigations
      backgroundColor: Colors.black,
      body: Center(
        child: _screenChildren[selectedItem],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(width: 1, color: Colors.black26)),
        ),
        child: BottomNavigationBar(
            onTap: navigationChange,
            currentIndex: selectedItem,
            selectedItemColor: const Color.fromARGB(255, 255, 255, 255),
            unselectedItemColor: const Color.fromARGB(255, 101, 100, 100),
            items: const [
              // the home navigation
              BottomNavigationBarItem(
                backgroundColor: Colors.black,
                icon: Icon(
                  Ionicons.home_outline,
                  size: 25,
                ),
                activeIcon: Icon(Ionicons.home_sharp),
                label: "Home",
              )
//        explore navigation
              ,
              BottomNavigationBarItem(
                backgroundColor: Colors.black,
                icon: Icon(CupertinoIcons.location_north),
                activeIcon: Icon(CupertinoIcons.location_north_fill),
                label: "Explore",
              )
              //  shop navigation
              ,
              BottomNavigationBarItem(
                backgroundColor: Colors.black,
                icon: Icon(CupertinoIcons.bag),
                label: "Shops",
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.black,
                icon: Icon(CupertinoIcons.hand_thumbsup),
                activeIcon: Icon(CupertinoIcons.hand_thumbsup_fill),
                label: "Favorite",
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.person_alt_circle),
                activeIcon: Icon(CupertinoIcons.person_alt_circle_fill),
                label: "Account",
              ),
            ]),
      ),
    );
  }
}
