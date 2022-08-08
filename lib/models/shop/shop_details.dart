import 'dart:convert';

import 'package:flutter/material.dart';

ShopDetail shopDetailFromJson(String str) =>
    ShopDetail.fromJson(json.decode(str));

String shopDetailToJson(ShopDetail data) => json.encode(data.toJson());

class ShopDetail {
  ShopDetail({
    required this.bio,
    required this.link,
    required this.id,
    required this.user,
    required this.shopLocation,
    required this.followers,
    required this.shopName,
    required this.isVerified,
    required this.profilePicture,
    required this.shopThumbnails,
    required this.shopCategory,
    required this.income,
    required this.rateValue,
    required this.orders,
    required this.products,
    required this.isActive,
    required this.v,
  });

  final String bio;
  final String link;
  final String id;
  final User user;
  final String shopLocation;
  final List<String> followers;
  final String shopName;
  final bool isVerified;
  final String profilePicture;
  final List<dynamic> shopThumbnails;
  final ShopCategory shopCategory;
  final int income;
  final int rateValue;
  final List<dynamic> orders;
  final List<Product> products;
  final bool isActive;
  final int v;

  factory ShopDetail.fromJson(Map<String, dynamic> json) => ShopDetail(
        bio: json["bio"],
        link: json["link"],
        id: json["_id"],
        user: User.fromJson(json["user"]),
        shopLocation: json["shop_location"],
        followers: List<String>.from(json["followers"].map((x) => x)),
        shopName: json["shop_name"],
        isVerified: json["is_verified"],
        profilePicture: json["profilePicture"],
        shopThumbnails:
            List<dynamic>.from(json["shop_thumbnails"].map((x) => x)),
        shopCategory: ShopCategory.fromJson(json["shop_category"]),
        income: json["income"],
        rateValue: json["rate_value"],
        orders: List<dynamic>.from(json["orders"].map((x) => x)),
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
        isActive: json["isActive"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "bio": bio,
        "link": link,
        "_id": id,
        "user": user.toJson(),
        "shop_location": shopLocation,
        "followers": List<dynamic>.from(followers.map((x) => x)),
        "shop_name": shopName,
        "is_verified": isVerified,
        "profilePicture": profilePicture,
        "shop_thumbnails": List<dynamic>.from(shopThumbnails.map((x) => x)),
        "shop_category": shopCategory.toJson(),
        "income": income,
        "rate_value": rateValue,
        "orders": List<dynamic>.from(orders.map((x) => x)),
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "isActive": isActive,
        "__v": v,
      };
}

class Product {
  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.subCategory,
    required this.seller,
    required this.thumbnail,
    required this.price,
    required this.stockCount,
    required this.remainedStock,
    required this.isAvailable,
    required this.size,
    required this.color,
    required this.discount,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.rateValue,
  });

  final String id;
  final String name;
  final String category;
  final String subCategory;
  final String seller;
  final List<String> thumbnail;
  final int price;
  final int stockCount;
  final int remainedStock;
  final bool isAvailable;
  final List<dynamic> size;
  final List<Color> color;
  final int discount;
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;
  final int rateValue;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["_id"],
        name: json["name"],
        category: json["category"],
        subCategory: json["subCategory"],
        seller: json["seller"],
        thumbnail: List<String>.from(json["thumbnail"].map((x) => x)),
        price: json["price"],
        stockCount: json["stock_count"],
        remainedStock: json["remained_stock"],
        isAvailable: json["is_available"],
        size: List<dynamic>.from(json["size"].map((x) => x)),
        color: List<Color>.from(json["color"].map((x) {
          String valueString =
              x.split('(0x')[1].split(')')[0]; // kind of hacky..
          int value = int.parse(valueString, radix: 16);
          Color otherColor = Color(value);
          return otherColor;
        })),
        discount: json["discount"],
        description: json["description"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        rateValue: json["rate_value"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "category": category,
        "subCategory": subCategory,
        "seller": seller,
        "thumbnail": List<dynamic>.from(thumbnail.map((x) => x)),
        "price": price,
        "stock_count": stockCount,
        "remained_stock": remainedStock,
        "is_available": isAvailable,
        "size": List<dynamic>.from(size.map((x) => x)),
        "color": List<dynamic>.from(color.map((x) => x)),
        "discount": discount,
        "description": description,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "rate_value": rateValue,
      };
}

class ShopCategory {
  ShopCategory({
    required this.id,
    required this.name,
    required this.details,
    required this.v,
    required this.shops,
  });

  final String id;
  final String name;
  final String details;
  final int v;
  final List<String> shops;

  factory ShopCategory.fromJson(Map<String, dynamic> json) => ShopCategory(
        id: json["_id"],
        name: json["name"],
        details: json["details"],
        v: json["__v"],
        shops: List<String>.from(json["shops"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "details": details,
        "__v": v,
        "shops": List<dynamic>.from(shops.map((x) => x)),
      };
}

class User {
  User({
    required this.id,
    required this.username,
    required this.mobileNumber,
    required this.password,
    required this.isActive,
    required this.isFullRegistered,
    required this.searches,
    required this.favorite,
    required this.subscriptions,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.cart,
    required this.notification,
    required this.wallet,
    required this.order,
  });

  final String id;
  final String username;
  final int mobileNumber;
  final String password;
  final bool isActive;
  final bool isFullRegistered;
  final List<dynamic> searches;
  final List<dynamic> favorite;
  final List<dynamic> subscriptions;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;
  final List<Cart> cart;
  final List<String> notification;
  final int wallet;
  final List<dynamic> order;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        username: json["username"],
        mobileNumber: json["mobile_number"],
        password: json["password"],
        isActive: json["isActive"],
        isFullRegistered: json["is_full_registered"],
        searches: List<dynamic>.from(json["searches"].map((x) => x)),
        favorite: List<dynamic>.from(json["favorite"].map((x) => x)),
        subscriptions: List<dynamic>.from(json["subscriptions"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        cart: List<Cart>.from(json["cart"].map((x) => Cart.fromJson(x))),
        notification: List<String>.from(json["notification"].map((x) => x)),
        wallet: json["wallet"],
        order: List<dynamic>.from(json["order"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "username": username,
        "mobile_number": mobileNumber,
        "password": password,
        "isActive": isActive,
        "is_full_registered": isFullRegistered,
        "searches": List<dynamic>.from(searches.map((x) => x)),
        "favorite": List<dynamic>.from(favorite.map((x) => x)),
        "subscriptions": List<dynamic>.from(subscriptions.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "cart": List<dynamic>.from(cart.map((x) => x.toJson())),
        "notification": List<dynamic>.from(notification.map((x) => x)),
        "wallet": wallet,
        "order": List<dynamic>.from(order.map((x) => x)),
      };
}

class Cart {
  Cart({
    required this.product,
    required this.quantity,
    required this.id,
  });

  final String product;
  final int quantity;
  final String id;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        product: json["product"],
        quantity: json["quantity"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "product": product,
        "quantity": quantity,
        "_id": id,
      };
}
