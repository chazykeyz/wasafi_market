import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wasafi_market/widgets/text/bold.dart';
import 'package:wasafi_market/widgets/text/regular.dart';

class ProductAddManage extends StatefulWidget {
  const ProductAddManage({Key? key}) : super(key: key);

  @override
  State<ProductAddManage> createState() => _ProductAddManageState();
}

class _ProductAddManageState extends State<ProductAddManage> {
  final ImagePicker _picker = ImagePicker();
  final List<XFile> _imageList = [];

  @override
  Widget build(BuildContext context) {
    void postImage() {
      showModalBottomSheet(
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) {
            return Builder(builder: (context) {
              return StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                return Container(
                    height: 240,
                    padding: const EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width,
                    child: Column(children: [
                      Container(
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(.1),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  selectedImageFromCamera();
                                  Get.back();
                                },
                                child: Container(
                                  height: 50,
                                  decoration: const BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              width: 1,
                                              color: Colors.white24))),
                                  child: const Center(
                                      child: Regular(
                                          text: "Take Photo",
                                          size: 16,
                                          color: Colors.blue)),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  selectedImageFromGallery();
                                  Get.back();
                                },
                                child: const SizedBox(
                                  height: 50,
                                  child: Center(
                                      child: Regular(
                                          text: "Choose Photo",
                                          size: 16,
                                          color: Colors.blue)),
                                ),
                              ),
                            ]),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(.2),
                              borderRadius: BorderRadius.circular(10)),
                          child: const Center(
                              child: Regular(
                                  text: "Cancel",
                                  size: 16,
                                  color: Colors.blue)),
                        ),
                      ),
                    ]));
              });
            });
          });
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(slivers: [
        SliverAppBar(
          backgroundColor: Colors.black.withOpacity(.5),
          leading: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: const Icon(
                CupertinoIcons.chevron_left,
                color: Colors.blueAccent,
                size: 24,
              )),
          title: const Text(
            "Details",
            style: TextStyle(fontWeight: FontWeight.w400, color: Colors.blue),
          ),
          pinned: true,
          bottom: (PreferredSize(
              child: Container(
                color: const Color.fromARGB(14, 255, 255, 255),
                height: 1.0,
              ),
              preferredSize: const Size.fromHeight(1.0))),
          toolbarHeight: 50,
          floating: false,
          flexibleSpace: FlexibleSpaceBar(
            background: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: const SizedBox(
                height: 30,
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Bold(text: "The black belt", size: 22),
                Row(children: [
                  InkWell(
                    onTap: () {
                      postImage();
                    },
                    child: Container(
                      width: 80,
                      height: 80,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 2, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.white12),
                        color: const Color.fromARGB(36, 238, 237, 237),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(
                            CupertinoIcons.camera,
                            color: Colors.blue,
                          ),
                          Regular(
                              text: "Add Images", size: 10, color: Colors.blue)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 80,
                    width: MediaQuery.of(context).size.width - 105,
                    child: ListView.builder(
                        itemCount: _imageList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: ((context, index) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              width: 80,
                              margin: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white12),
                                color: const Color.fromARGB(36, 238, 237, 237),
                              ),
                              child: Image.file(
                                File(_imageList[index].path),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        })),
                  ),
                ])
              ],
            ),
          ),
        )
      ]),
    );
  }

  void selectedImageFromGallery() async {
    final XFile? selectedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (selectedImage!.path.isNotEmpty) {
      _imageList.add(selectedImage);
    }
    setState(() {});
  }

  // from camera
  void selectedImageFromCamera() async {
    final XFile? selectedImage =
        await _picker.pickImage(source: ImageSource.camera);
    if (selectedImage!.path.isNotEmpty) {
      _imageList.add(selectedImage);
    }
    setState(() {});
  }
}
