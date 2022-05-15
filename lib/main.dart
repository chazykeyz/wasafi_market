import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:wasafi_market/controllers/products.dart';
import 'package:wasafi_market/screens/free_screens/signin.dart';
import 'package:wasafi_market/screens/free_screens/signup.dart';
import 'package:wasafi_market/screens/navigation_screens/account.dart';
import 'package:wasafi_market/screens/navigation_screens/cart.dart';
import 'package:wasafi_market/screens/navigation_screens/explore.dart';
import 'package:wasafi_market/screens/navigation_screens/home.dart';
import 'package:wasafi_market/screens/navigation_screens/shops.dart';
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
    // Get.find<ProductsController>().getProducts();
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
    SignUp(),
    // Explore(),
    // Shops(),
    // Cart(),
    // Account(),
    Text("hi"),
    Text("hi"),
    Text("hi"),
    Text("hi")
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
            items: [
              // the home navigation
              const BottomNavigationBarItem(
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
              const BottomNavigationBarItem(
                backgroundColor: Colors.black,
                icon: Icon(CupertinoIcons.location_north),
                activeIcon: Icon(CupertinoIcons.location_north_fill),
                label: "Explore",
              )
              //  shop navigation
              ,
              const BottomNavigationBarItem(
                backgroundColor: Colors.black,
                icon: Icon(CupertinoIcons.bag),
                label: "Shops",
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.black,
                icon: SizedBox(
                  width: 35,
                  child: Stack(children: [
                    const Icon(CupertinoIcons.cart),
                    Positioned(
                        left: 14,
                        child: Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blueAccent),
                          child: const Center(
                            child: Regular(
                                text: "10", size: 12, color: Colors.white),
                          ),
                        ))
                  ]),
                ),
                activeIcon: const Icon(CupertinoIcons.cart_fill),
                label: "Cart",
              ),
              const BottomNavigationBarItem(
                backgroundColor: Colors.black,
                icon: Icon(CupertinoIcons.person_alt_circle),
                activeIcon: Icon(CupertinoIcons.person_alt_circle_fill),
                label: "Account",
              ),
            ]),
      ),
    );
  }
}
