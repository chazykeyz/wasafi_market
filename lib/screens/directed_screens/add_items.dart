import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wasafi_market/controllers/product_category.dart';
import 'package:wasafi_market/controllers/products.dart';
import 'package:wasafi_market/controllers/shop.dart';
import 'package:wasafi_market/models/products/add_product.dart';
import 'package:wasafi_market/widgets/show_snackbar.dart';
import 'package:wasafi_market/widgets/text/bold.dart';
import 'package:wasafi_market/widgets/text/regular.dart';

class AddItems extends StatefulWidget {
  const AddItems({Key? key, required this.userId}) : super(key: key);
  final String userId;

  @override
  State<AddItems> createState() => _AddItemsState();
}

class _AddItemsState extends State<AddItems> {
  final ImagePicker _picker = ImagePicker();
  final List<XFile> _imageList = [];

  // booleans
  bool _colorValue = false;
  bool _switchValue = false;
  bool _sizeValue = false;
// singles types
  String _size = "";
  Color color = Colors.orange;
  String _category = "";
  String _subCategory = "";
  // lists
  final List _sizeList = [];
  final List<Color> _colorList = [];
  // form inputs
  int _discount = 0;
  String _name = '';
  int _price = 0;
  int _stockCount = 0;
  String _description = '';

  @override
  Widget build(BuildContext context) {
    Get.find<ProductsController>().getSizes();
    Get.find<ProductCategoryController>().getProductCategory();
    Get.find<ShopController>().getShops();

    void sendProduct(_seller) {
      ProductAdd productAdd = ProductAdd(_sizeList, _colorList, _discount,
          name: _name,
          category: _category,
          subCategory: _subCategory,
          thumbnail: _imageList,
          price: _price,
          stockCount: _stockCount,
          description: _description,
          seller: _seller);
      Get.find<ProductsController>().postProducts(productAdd);
    }

    // posting images
    void postImage() {
      showModalBottomSheet(
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) {
            return Builder(builder: (context) {
              return StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                return BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                      height: 240,
                      padding: const EdgeInsets.all(20),
                      width: MediaQuery.of(context).size.width,
                      child: Column(children: [
                        Container(
                          height: 100,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 41, 41, 41),
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
                                color: const Color.fromARGB(255, 41, 41, 41),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                                child: Regular(
                                    text: "Cancel",
                                    size: 16,
                                    color: Colors.blue)),
                          ),
                        ),
                      ])),
                );
              });
            });
          });
    }

// category opening
    void openCategory(mainCategory) {
      showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          builder: (context) {
            return Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 41, 41, 41),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        padding: const EdgeInsets.only(top: 3, bottom: 15),
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 1, color: Colors.white38))),
                        child: const Center(
                            child: Bold(text: "Category", size: 20))),
                    Expanded(
                      child: ListView.separated(
                          separatorBuilder: (context, index) => const Divider(
                                height: 1,
                                color: Colors.white24,
                              ),
                          itemCount: mainCategory.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  _category = mainCategory[index].id;
                                  Get.back();
                                });
                              },
                              child: Container(
                                height: 40,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 2),
                                decoration: BoxDecoration(
                                    color: _category == mainCategory[index].name
                                        ? Colors.white12
                                        : null,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Center(
                                  child: Regular(
                                      text: mainCategory[index].name,
                                      size: 15,
                                      color: Colors.white54),
                                ),
                              ),
                            );
                          }),
                    )
                  ],
                ));
          });
    }

// sub category
    void openSubCategory(mainCategory) {
      var categoryObject =
          mainCategory.where((element) => element.id == _category).toList();
      showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          builder: (context) {
            return Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 41, 41, 41),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        padding: const EdgeInsets.only(top: 3, bottom: 15),
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 1, color: Colors.white38))),
                        child: const Center(
                            child: Bold(text: "Sub Category", size: 20))),
                    Expanded(
                      child: ListView.separated(
                          separatorBuilder: (context, index) => const Divider(
                                height: 1,
                                color: Colors.white24,
                              ),
                          itemCount: categoryObject[0].subCategories.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  _subCategory =
                                      categoryObject[0].subCategories[index].id;
                                  Get.back();
                                });
                              },
                              child: Container(
                                height: 40,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 2),
                                decoration: BoxDecoration(
                                    color: _subCategory ==
                                            categoryObject[0]
                                                .subCategories[index]
                                                .name
                                        ? Colors.white12
                                        : null,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Center(
                                  child: Regular(
                                      text: categoryObject[0]
                                          .subCategories[index]
                                          .name,
                                      size: 15,
                                      color: Colors.white54),
                                ),
                              ),
                            );
                          }),
                    )
                  ],
                ));
          });
    }

    return Scaffold(
      backgroundColor: Colors.black87,
      body: GetBuilder<ProductsController>(builder: (productContent) {
        return CustomScrollView(slivers: [
          SliverAppBar(
            backgroundColor: const Color.fromARGB(255, 34, 34, 34),
            elevation: 0,
            leadingWidth: 100,
            leading: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: const Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Center(
                      child: Regular(
                          text: "Cancel", size: 18, color: Colors.blue)),
                )),
            title: const Text(
              "Add Product",
              style:
                  TextStyle(fontWeight: FontWeight.w800, color: Colors.white),
            ),
            pinned: true,
            toolbarHeight: 50,
            floating: false,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                                text: "Add Images",
                                size: 10,
                                color: Colors.blue)
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
                            return Stack(children: [
                              Container(
                                width: 80,
                                height: 80,
                                margin: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white12),
                                  borderRadius: BorderRadius.circular(20),
                                  color:
                                      const Color.fromARGB(36, 238, 237, 237),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.file(
                                    File(_imageList[index].path),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                  right: 0,
                                  child: GestureDetector(
                                    onTap: () {
                                      _imageList.remove(_imageList[index]);
                                      setState(() {});
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.blue,
                                          border: Border.all(
                                              width: 2,
                                              color: const Color.fromARGB(
                                                  255, 37, 37, 37))),
                                      child: const Icon(
                                        CupertinoIcons.clear,
                                        size: 15,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )),
                            ]);
                          })),
                    ),
                  ]),
                  // primary
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    width: MediaQuery.of(context).size.width,
                    child: const Regular(
                      text: "PRIMARY ITEMS",
                      size: 14,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      // inputs
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: Colors.white12),
                            ),
                          ),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 2),
                          child: Container(
                            height: 30,
                            margin: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            width: MediaQuery.of(context).size.width - 20,
                            child: TextField(
                              onChanged: (value) {
                                setState(() {
                                  _name = value;
                                });
                              },
                              keyboardAppearance: Brightness.dark,
                              maxLines: 1,
                              maxLength: 40,
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  counterText: "",
                                  hintStyle: TextStyle(color: Colors.white70),
                                  hintText: 'Product Name '),
                            ),
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: Colors.white12),
                            ),
                          ),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 2),
                          child: Container(
                            height: 30,
                            margin: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            width: MediaQuery.of(context).size.width - 20,
                            child: TextField(
                              onChanged: (value) {
                                setState(() {
                                  _price = int.parse(value);
                                });
                              },
                              style: const TextStyle(color: Colors.white),
                              keyboardAppearance: Brightness.dark,
                              keyboardType: TextInputType.number,
                              maxLines: 1,
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(color: Colors.white70),
                                  hintText: 'Product Price'),
                            ),
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: Colors.white12),
                            ),
                          ),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 2),
                          child: Container(
                            height: 30,
                            margin: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            width: MediaQuery.of(context).size.width - 20,
                            child: TextField(
                              onChanged: (value) {
                                setState(() {
                                  _stockCount = int.parse(value);
                                });
                              },
                              style: const TextStyle(color: Colors.white),
                              keyboardAppearance: Brightness.dark,
                              keyboardType: TextInputType.number,
                              maxLines: 1,
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(color: Colors.white70),
                                  hintText: 'Stock Count'),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 2),
                          child: InkWell(
                            onTap: () {
                              detailSheet();
                            },
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: const [
                                      Regular(
                                        text: "Product Details",
                                        size: 15,
                                        color: Colors.white70,
                                      )
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        CupertinoIcons.chevron_right,
                                        color: Colors.white60,
                                        size: 20,
                                      ),
                                    ],
                                  )
                                ]),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // secondary
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    width: MediaQuery.of(context).size.width,
                    child: const Regular(
                      text: "SECONDARY ITEMS",
                      size: 14,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(2),
                          decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.white12)),
                          ),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 2),
                          child: Column(children: [
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: const [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Regular(
                                          text: "Discount",
                                          size: 16,
                                          color: Colors.white70,
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _switchValue = true;
                                          });
                                        },
                                        child: CupertinoSwitch(
                                          value: _switchValue,
                                          activeColor: Colors.blue,
                                          onChanged: (bool value) {
                                            setState(() {
                                              _switchValue = value;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  )
                                ]),
                            _switchValue
                                ? Container(
                                    height: _switchValue ? 30 : 0,
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 10),
                                    width:
                                        MediaQuery.of(context).size.width - 20,
                                    child: TextField(
                                      onChanged: (value) {
                                        setState(() {
                                          _discount = int.parse(value);
                                        });
                                      },
                                      style:
                                          const TextStyle(color: Colors.white),
                                      keyboardType: TextInputType.number,
                                      keyboardAppearance: Brightness.dark,
                                      decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          hintStyle:
                                              TextStyle(color: Colors.blue),
                                          hintText: 'Discount Price'),
                                    ),
                                  )
                                : const SizedBox(
                                    height: 0,
                                  ),
                          ]),
                        ),
                        Container(
                          padding: const EdgeInsets.all(2),
                          decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.white12)),
                          ),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 2),
                          child: Column(children: [
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: const [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Regular(
                                          text: "Size",
                                          size: 16,
                                          color: Colors.white70,
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _sizeValue = true;
                                          });
                                        },
                                        child: CupertinoSwitch(
                                          value: _sizeValue,
                                          activeColor: Colors.blue,
                                          onChanged: (bool value) {
                                            setState(() {
                                              _sizeValue = value;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  )
                                ]),
                            _sizeValue
                                ? Row(children: [
                                    InkWell(
                                      onTap: () {
                                        openSize(productContent.sizeList);
                                        setState(() {});
                                      },
                                      child: Container(
                                        height: 40,
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 0, horizontal: 10),
                                        width: 40,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: .5,
                                                color: Colors.white24),
                                            color: Colors.white24,
                                            shape: BoxShape.circle),
                                        child: const Center(
                                            child: Icon(
                                          CupertinoIcons.add,
                                        )),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 40,
                                      width: MediaQuery.of(context).size.width -
                                          120,
                                      child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: _sizeList.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return InkWell(
                                              onTap: () {
                                                _sizeList
                                                    .remove(_sizeList[index]);
                                                setState(() {});
                                              },
                                              child: Stack(children: [
                                                Center(
                                                  child: Container(
                                                    margin: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 0,
                                                        horizontal: 10),
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    constraints:
                                                        const BoxConstraints(
                                                      minWidth: 40,
                                                    ),
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            width: .5,
                                                            color:
                                                                Colors.white24),
                                                        color: Colors.white24,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(18)),
                                                    child: Center(
                                                      child: Regular(
                                                          text: productContent
                                                              .sizeList
                                                              .firstWhere(
                                                                  (element) =>
                                                                      element
                                                                          .id ==
                                                                      _sizeList[
                                                                          index])
                                                              .size,
                                                          size: 14,
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                    right: 0,
                                                    child: GestureDetector(
                                                      child: Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(2),
                                                        decoration: BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color: const Color
                                                                    .fromARGB(
                                                                255,
                                                                69,
                                                                69,
                                                                69),
                                                            border: Border.all(
                                                                width: 1,
                                                                color: Colors
                                                                    .black)),
                                                        child: const Icon(
                                                          CupertinoIcons.clear,
                                                          size: 15,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    )),
                                              ]),
                                            );
                                          }),
                                    )
                                  ])
                                : const SizedBox(
                                    height: 0,
                                  ),
                          ]),
                        ),
                        Container(
                          padding: const EdgeInsets.all(2),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 2),
                          child: Column(children: [
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: const [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Regular(
                                          text: "Color",
                                          size: 16,
                                          color: Colors.white70,
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _colorValue = true;
                                          });
                                        },
                                        child: CupertinoSwitch(
                                          value: _colorValue,
                                          activeColor: Colors.blue,
                                          onChanged: (bool value) {
                                            setState(() {
                                              _colorValue = value;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  )
                                ]),
                            _colorValue
                                ? Row(children: [
                                    InkWell(
                                      onTap: () {
                                        pickColor(context);
                                      },
                                      child: Container(
                                        height: 40,
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 0, horizontal: 10),
                                        width: 40,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: .5,
                                                color: Colors.white24),
                                            color: Colors.white24,
                                            shape: BoxShape.circle),
                                        child: const Center(
                                            child: Icon(
                                          CupertinoIcons.add,
                                        )),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 40,
                                      width: MediaQuery.of(context).size.width -
                                          120,
                                      child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: _colorList.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return InkWell(
                                              onTap: () {
                                                _colorList
                                                    .remove(_colorList[index]);
                                                setState(() {});
                                              },
                                              child: Stack(children: [
                                                Container(
                                                  margin: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 0,
                                                      horizontal: 10),
                                                  width: 40,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          width: .5,
                                                          color:
                                                              Colors.white24),
                                                      color: _colorList[index],
                                                      shape: BoxShape.circle),
                                                ),
                                                Positioned(
                                                    right: 0,
                                                    child: GestureDetector(
                                                      child: Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(2),
                                                        decoration: BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color: const Color
                                                                    .fromARGB(
                                                                255,
                                                                69,
                                                                69,
                                                                69),
                                                            border: Border.all(
                                                                width: 1,
                                                                color: Colors
                                                                    .black)),
                                                        child: const Icon(
                                                          CupertinoIcons.clear,
                                                          size: 15,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    )),
                                              ]),
                                            );
                                          }),
                                    )
                                  ])
                                : const SizedBox(
                                    height: 0,
                                  ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                  //  category
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    width: MediaQuery.of(context).size.width,
                    child: const Regular(
                      text: "CATEGORY",
                      size: 14,
                      color: Colors.white,
                    ),
                  ),

                  GetBuilder<ProductCategoryController>(
                      builder: (categoryContent) {
                    return Container(
                      decoration: BoxDecoration(
                          color: Colors.white10,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.white12)),
                            ),
                            child: InkWell(
                              onTap: () {
                                openCategory(
                                    categoryContent.productCategoryList);
                              },
                              child: Column(children: [
                                ListTile(
                                  dense: true,
                                  title: const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 3.0),
                                    child: Text(
                                      "Category",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        color: Colors.white70,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  subtitle: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 3.0),
                                    child: Regular(
                                      text: _category == ""
                                          ? "select category"
                                          : _category,
                                      size: 16,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  trailing: const Icon(
                                    CupertinoIcons.chevron_forward,
                                    color: Colors.white38,
                                  ),
                                )
                              ]),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 2),
                            margin: const EdgeInsets.symmetric(vertical: 2),
                            child: GestureDetector(
                              onTap: () {
                                if (_category.isEmpty) {
                                  showCustomSnackBar(
                                      "Please select the category first!",
                                      isError: true,
                                      title: "Category not selected");
                                } else {
                                  openSubCategory(
                                      categoryContent.productCategoryList);
                                }
                              },
                              child: Column(children: [
                                ListTile(
                                  dense: true,
                                  title: const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 3.0),
                                    child: Text(
                                      "Sub Category",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        color: Colors.white70,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  subtitle: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 3.0),
                                    child: Regular(
                                      text: _subCategory == ""
                                          ? "select category"
                                          : _subCategory,
                                      size: 16,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  trailing: const Icon(
                                    CupertinoIcons.chevron_forward,
                                    color: Colors.white38,
                                  ),
                                )
                              ]),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                  //  submit
                  GetBuilder<ShopController>(builder: (shopContent) {
                    var _idInstance = shopContent.shopList
                        .where((e) => e.user.id == widget.userId)
                        .toList();

                    return GestureDetector(
                      onTap: () {
                        if (shopContent.shopList.isNotEmpty) {
                          sendProduct(_idInstance[0].id);
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                            child: Regular(
                                text: "Save Product",
                                size: 16,
                                color: Colors.white)),
                      ),
                    );
                  }),
                ],
              ),
            ),
          )
        ]);
      }),
    );
  }

// description sheet
  void detailSheet() {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        isDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: MediaQuery.of(context).size.height - 100,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 41, 41, 41),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(width: 1, color: Colors.white38))),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Bold(text: "Description", size: 20),
                              GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: const Text(
                                  "Done",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 18),
                                ),
                              )
                            ]),
                      )),
                  Expanded(
                    child: TextField(
                      style: const TextStyle(color: Colors.white70),
                      onChanged: (value) {
                        setState(() {
                          _description = value;
                        });
                      },
                      autofocus: true,
                      maxLines: null,
                      minLines: null,
                      expands: true,
                      keyboardAppearance: Brightness.dark,
                      decoration: const InputDecoration(
                          hintText: "Add product Detail",
                          hintStyle: TextStyle(color: Colors.blue)),
                    ),
                  ),
                ],
              ));
        });
  }

// color sheet
  void pickColor(BuildContext context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 41, 41, 41),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: Column(
              children: [
                ColorPicker(
                    labelTypes: const [],
                    enableAlpha: false,
                    pickerColor: color,
                    onColorChanged: (color) {
                      setState(() {
                        this.color = color;
                      });
                    }),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _colorList.add(color);
                      Get.back();
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                        child: Regular(
                            text: "Select", size: 16, color: Colors.white)),
                  ),
                ),
              ],
            ),
          );
        });
  }

// size sheet
  void openSize(sizeData) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 41, 41, 41),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      padding: const EdgeInsets.only(top: 3, bottom: 15),
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(width: 1, color: Colors.white38))),
                      child: const Center(child: Bold(text: "Size", size: 25))),
                  Expanded(
                    child: ListView.separated(
                        separatorBuilder: (context, index) => const Divider(
                              height: 1,
                              color: Colors.white24,
                            ),
                        itemCount: sizeData.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                setState(() {
                                  if (_sizeList
                                      .where((element) =>
                                          element == sizeData[index].id)
                                      .isEmpty) {
                                    _size = sizeData[index].size;
                                    _sizeList.add(sizeData[index].id);
                                  }
                                  Get.back();
                                });
                              });
                            },
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  color: _size == sizeData[index].size
                                      ? Colors.white12
                                      : null,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Center(
                                child: Regular(
                                    text: sizeData[index].size,
                                    size: 15,
                                    color: Colors.white70),
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ));
        });
  }

// from gallery
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
    if (selectedImage != null) {
      if (selectedImage.path.isNotEmpty) {
        _imageList.add(selectedImage);
      }
    } else {
      _imageList;
    }
    setState(() {});
  }
}
