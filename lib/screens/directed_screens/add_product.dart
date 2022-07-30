import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:wasafi_market/screens/directed_screens/add_items.dart';
import 'package:wasafi_market/screens/directed_screens/add_product_details.dart';
import 'package:wasafi_market/widgets/text/bold.dart';
import 'package:wasafi_market/widgets/text/regular.dart';

class ProductManagement extends StatefulWidget {
  const ProductManagement({Key? key}) : super(key: key);

  @override
  State<ProductManagement> createState() => _ProductManagementState();
}

class _ProductManagementState extends State<ProductManagement> {
  bool isEmpty = true;

  @override
  Widget build(BuildContext context) {
    var _userId = Get.arguments;

    void addItem() {
      showModalBottomSheet(
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
          isDismissible: false,
          context: context,
          builder: (context) {
            return Builder(builder: (context) {
              return StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                return Container(
                  margin: const EdgeInsets.only(top: 100),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: AddItems(
                        userId: _userId,
                      )),
                );
              });
            });
          });
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(slivers: [
        SliverAppBar(
          backgroundColor: Colors.transparent,
          title: const Bold(
            text: "Products",
            size: 24,
          ),
          centerTitle: false,
          automaticallyImplyLeading: false,
          leading: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Center(
                child: Container(
                    margin: const EdgeInsets.all(5),
                    child: const Icon(
                      CupertinoIcons.chevron_back,
                      size: 30,
                      color: Colors.blue,
                    )),
              )),
          leadingWidth: 20,
          actions: [
            GestureDetector(
                onTap: () {
                  addItem();
                },
                child: Container(
                    margin: const EdgeInsets.all(5),
                    width: 47,
                    child: Stack(children: [
                      Container(
                        margin: const EdgeInsets.only(top: 8),
                        child: const Icon(
                          CupertinoIcons.plus,
                          color: Colors.blue,
                        ),
                      ),
                    ])))
          ],
          pinned: true,
          bottom: (PreferredSize(
              child: Container(
                color: const Color.fromARGB(14, 255, 255, 255),
                height: 1.0,
              ),
              preferredSize: const Size.fromHeight(1.0))),
          floating: false,
          expandedHeight: 100,
          collapsedHeight: 70,
          flexibleSpace: FlexibleSpaceBar(
            background: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Column(children: [
                const SizedBox(
                  height: 90,
                  width: 10,
                ),
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width - 40,
                  margin: const EdgeInsets.all(4),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.white24),
                  child: TextField(
                    onChanged: (value) {
                      if (value != "") {
                        isEmpty = false;
                        setState(() {});
                      } else {
                        isEmpty = true;
                        setState(() {});
                      }
                    },
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.white),
                        hintText: 'Search '),
                  ),
                ),
              ]),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Bold(text: "Products", size: 18),
                    Regular(text: "Delete All", size: 16, color: Colors.blue)
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height - 240,
                child: MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child: ListView.separated(
                      separatorBuilder: (context, index) =>
                          const Divider(color: Colors.white30, height: 1),
                      scrollDirection: Axis.vertical,
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return Slidable(
                          key: const ValueKey(0),
                          endActionPane: ActionPane(
                              motion: const ScrollMotion(),
                              // A pane can dismiss the Slidable.
                              dismissible: DismissiblePane(onDismissed: () {}),
                              children: [
                                SlidableAction(
                                  onPressed: (context) {},
                                  backgroundColor: Colors.redAccent,
                                  foregroundColor: Colors.white,
                                  icon: Icons.delete,
                                  label: 'Delete',
                                )
                              ]),
                          child: InkWell(
                            onTap: () {
                              Get.to(() => const ProductAddManage());
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: ListTile(
                                leading: Container(
                                    width: 58,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(color: Colors.white12),
                                      color: const Color.fromARGB(
                                          36, 238, 237, 237),
                                      image: const DecorationImage(
                                          image: NetworkImage(
                                              "https://images.unsplash.com/photo-1657004252389-958cc6653b1d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80"),
                                          fit: BoxFit.cover),
                                    )),
                                title: const Bold(
                                  text: "Black Jean",
                                  size: 14,
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Regular(
                                        text: "Tsh 200000 /= ",
                                        size: 14,
                                        color: Colors.white54),
                                    Regular(
                                        text: "out of Stock",
                                        size: 14,
                                        color: Colors.white54)
                                  ],
                                ),
                                trailing: const Icon(
                                  CupertinoIcons.chevron_forward,
                                  size: 16,
                                  color: Colors.white54,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
