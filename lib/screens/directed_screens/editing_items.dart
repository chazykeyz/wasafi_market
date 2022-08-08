import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:wasafi_market/controllers/product_category.dart';
import 'package:wasafi_market/controllers/products.dart';
import 'package:wasafi_market/controllers/shop.dart';
import 'package:wasafi_market/models/products/edit_product.dart';
import 'package:wasafi_market/widgets/show_snackbar.dart';
import 'package:wasafi_market/widgets/text/bold.dart';
import 'package:wasafi_market/widgets/text/regular.dart';

class EditingItems extends StatefulWidget {
  const EditingItems(
      {Key? key,
      required this.userId,
      required this.product,
      required this.shopId})
      : super(key: key);
  final String userId;
  final dynamic product;
  final dynamic shopId;

  @override
  State<EditingItems> createState() => _EditingItemsState();
}

class _EditingItemsState extends State<EditingItems> {
  // booleans
  bool _colorValue = false;
  bool _switchValue = false;
  bool _sizeValue = false;
// singles types
  String _size = "";
  Color color = Colors.orange;

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
  void initState() {
    super.initState();
    setState(() {
      _discount = widget.product.discount;
      _name = widget.product.name;
      _price = widget.product.price;
      _stockCount = widget.product.stockCount;
      _description = widget.product.description;
      if (widget.product.discount != 0) {
        _switchValue = false;
      }
// adding size
      if (widget.product.size.isNotEmpty) {
        _sizeValue = true;
        _sizeList.addAll(widget.product.size);
      }
      // adding color
      if (widget.product.color.isNotEmpty) {
        _colorValue = true;
        _colorList.addAll(widget.product.color);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Get.find<ProductsController>().getSizes();
    Get.find<ProductCategoryController>().getProductCategory();
    Get.find<ShopController>().getShops();
// final fucntion to submit
    void sendProduct(_seller) {
      // color to string
      List<String> colorString = _colorList.map((e) => e.toString()).toList();
      // size check
      if (_sizeValue == false) {
        _sizeList.clear();
      }
// color check
      if (_colorValue == false) {
        _colorList.clear();
      }
      // dicount
      if (_switchValue == false) {
        _discount = 0;
      }

      ProductEdit productEdit = ProductEdit(_sizeList, colorString, _discount,
          _name, _price, _stockCount, _description, _seller);

      if (_name == '') {
        showCustomSnackBar(
            "field name can't be empty, please assign product's name",
            title: "Product Name");
      } else if (_price == 0) {
        showCustomSnackBar(
            "field price can't be empty, please assign product's price",
            title: "Product price");
      } else if (_stockCount == 0) {
        showCustomSnackBar(
            "field stock count can't be empty, please assign product's stock count",
            title: "Product stock count");
      } else if (_description == "") {
        showCustomSnackBar(
            "field details can't be empty, please assign product's details",
            title: "Product details");
      } else {
        Get.find<ProductsController>()
            .editProduct(productEdit, widget.product.id)
            .then((status) {
          if (status.isSuccess) {
            showCustomSnackBar(status.message, title: "Editing product");
            Get.find<ShopController>().getShop(widget.shopId);
          } else {
            showCustomSnackBar(status.message, title: "Editing product");
          }
        });
      }
    }

    return Scaffold(
      backgroundColor: Colors.black87,
      body: GetBuilder<ProductsController>(builder: (productContent) {
        return productContent.sizeList.isEmpty
            ? const Center(
                child: CupertinoActivityIndicator(
                  color: Colors.blueAccent,
                  radius: 14,
                ),
              )
            : CustomScrollView(slivers: [
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
                                text: "Done", size: 16, color: Colors.blue)),
                      )),
                  title: const Text(
                    "Edit Product",
                    style: TextStyle(
                        fontWeight: FontWeight.w800, color: Colors.white),
                  ),
                  pinned: true,
                  toolbarHeight: 50,
                  floating: false,
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 300,
                    child: Swiper(
                      autoplay: false,
                      autoplayDelay: 5000,
                      pagination: const SwiperPagination(
                        builder: SwiperPagination.dots,
                      ),
                      loop: true,
                      itemWidth: MediaQuery.of(context).size.width,
                      itemBuilder: (BuildContext context, int index) {
                        return Center(
                          child: Image.network(
                            widget.product.thumbnail[index],
                            fit: BoxFit.fill,
                          ),
                        );
                      },
                      itemCount: widget.product.thumbnail.length,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          width: MediaQuery.of(context).size.width,
                          child: Bold(
                            text: widget.product.name,
                            size: 20,
                          ),
                        ),
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
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        counterText: "",
                                        hintStyle: const TextStyle(
                                            color: Colors.white70),
                                        hintText: widget.product.name),
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
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintStyle: const TextStyle(
                                            color: Colors.white70),
                                        hintText:
                                            widget.product.price.toString()),
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
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintStyle: const TextStyle(
                                            color: Colors.white70),
                                        hintText: widget.product.stockCount
                                            .toString()),
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
                                      bottom:
                                          BorderSide(color: Colors.white12)),
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
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              20,
                                          child: TextField(
                                            onChanged: (value) {
                                              setState(() {
                                                _discount = int.parse(value);
                                              });
                                            },
                                            style: const TextStyle(
                                                color: Colors.white),
                                            keyboardType: TextInputType.number,
                                            keyboardAppearance: Brightness.dark,
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintStyle: const TextStyle(
                                                    color: Colors.blue),
                                                hintText: widget
                                                    .product.discount
                                                    .toString()),
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
                                      bottom:
                                          BorderSide(color: Colors.white12)),
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
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 0,
                                                      horizontal: 10),
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
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                120,
                                            child: ListView.builder(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount: _sizeList.length,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return InkWell(
                                                    onTap: () {
                                                      _sizeList.remove(
                                                          _sizeList[index]);
                                                      setState(() {});
                                                    },
                                                    child: Stack(children: [
                                                      Center(
                                                        child: Container(
                                                          margin:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  vertical: 0,
                                                                  horizontal:
                                                                      10),
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(10),
                                                          constraints:
                                                              const BoxConstraints(
                                                            minWidth: 40,
                                                          ),
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  width: .5,
                                                                  color: Colors
                                                                      .white24),
                                                              color: Colors
                                                                  .white24,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          18)),
                                                          child: Center(
                                                            child: Regular(
                                                                text: productContent
                                                                    .sizeList
                                                                    .firstWhere((element) =>
                                                                        element
                                                                            .id ==
                                                                        _sizeList[
                                                                            index])
                                                                    .size,
                                                                size: 14,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ),
                                                      ),
                                                      Positioned(
                                                          right: 0,
                                                          child:
                                                              GestureDetector(
                                                            child: Container(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(2),
                                                              decoration: BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
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
                                                                CupertinoIcons
                                                                    .clear,
                                                                size: 15,
                                                                color: Colors
                                                                    .white,
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
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 0,
                                                      horizontal: 10),
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
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                120,
                                            child: ListView.builder(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount: _colorList.length,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return InkWell(
                                                    onTap: () {
                                                      _colorList.remove(
                                                          _colorList[index]);
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
                                                                color: Colors
                                                                    .white24),
                                                            color: _colorList[
                                                                index],
                                                            shape: BoxShape
                                                                .circle),
                                                      ),
                                                      Positioned(
                                                          right: 0,
                                                          child:
                                                              GestureDetector(
                                                            child: Container(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(2),
                                                              decoration: BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
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
                                                                CupertinoIcons
                                                                    .clear,
                                                                size: 15,
                                                                color: Colors
                                                                    .white,
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

                        //  submit
                        GetBuilder<ShopController>(builder: (shopContent) {
                          var _idInstance = shopContent.shopList
                              .where((e) => e.user.id == widget.userId)
                              .toList();

                          return GetBuilder<ProductsController>(
                              builder: (productContent) {
                            return GestureDetector(
                              onTap: () {
                                if (!productContent.isLoading) {
                                  if (shopContent.shopList.isNotEmpty) {
                                    sendProduct(_idInstance[0].id);
                                  }
                                }
                              },
                              child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 20),
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                      child: productContent.isLoading
                                          ? const CupertinoActivityIndicator(
                                              color: Colors.white,
                                            )
                                          : const Regular(
                                              text: "Save Product",
                                              size: 16,
                                              color: Colors.white))),
                            );
                          });
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
}
