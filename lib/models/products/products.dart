import 'dart:convert';

Products productsFromJson(String str) => Products.fromJson(json.decode(str));

String productsToJson(Products data) => json.encode(data.toJson());

class Products {
  Products({
    required this.page,
    required this.count,
    required this.products,
  });

  int page;
  int count;
  List<ProductsProduct> products;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        page: json["page"],
        count: json["count"],
        products: List<ProductsProduct>.from(
            json["products"].map((x) => ProductsProduct.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "count": count,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class ProductsProduct {
  ProductsProduct({
    required this.rateValue,
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
  });

  int rateValue;
  String id;
  String name;
  Category category;
  SubCategory subCategory;
  Seller seller;
  List<String> thumbnail;
  int price;
  int stockCount;
  int remainedStock;
  bool isAvailable;
  List<dynamic> size;
  List<String> color;
  int discount;
  String description;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory ProductsProduct.fromJson(Map<String, dynamic> json) =>
      ProductsProduct(
        rateValue: json["rate_value"],
        id: json["_id"],
        name: json["name"],
        category: Category.fromJson(json["category"]),
        subCategory: SubCategory.fromJson(json["subCategory"]),
        seller: Seller.fromJson(json["seller"]),
        thumbnail: List<String>.from(json["thumbnail"].map((x) => x)),
        price: json["price"],
        stockCount: json["stock_count"],
        remainedStock: json["remained_stock"],
        isAvailable: json["is_available"],
        size: List<dynamic>.from(json["size"].map((x) => x)),
        color: List<String>.from(json["color"].map((x) => x)),
        discount: json["discount"],
        description: json["description"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "rate_value": rateValue,
        "_id": id,
        "name": name,
        "category": category.toJson(),
        "subCategory": subCategory.toJson(),
        "seller": seller.toJson(),
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
      };
}

class Category {
  Category({
    required this.id,
    required this.name,
    required this.subCategories,
    required this.v,
    required this.thumbnail,
  });

  String id;
  String name;
  List<String> subCategories;
  int v;
  String thumbnail;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["_id"],
        name: json["name"],
        subCategories: List<String>.from(json["subCategories"].map((x) => x)),
        v: json["__v"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "subCategories": List<dynamic>.from(subCategories.map((x) => x)),
        "__v": v,
        "thumbnail": thumbnail,
      };
}

class Seller {
  Seller({
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

  String bio;
  String link;
  String id;
  User user;
  String shopLocation;
  List<String> followers;
  String shopName;
  bool isVerified;
  String profilePicture;
  List<dynamic> shopThumbnails;
  String shopCategory;
  int income;
  int rateValue;
  List<dynamic> orders;
  List<SellerProduct> products;
  bool isActive;
  int v;

  factory Seller.fromJson(Map<String, dynamic> json) => Seller(
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
        shopCategory: json["shop_category"],
        income: json["income"],
        rateValue: json["rate_value"],
        orders: List<dynamic>.from(json["orders"].map((x) => x)),
        products: List<SellerProduct>.from(
            json["products"].map((x) => SellerProduct.fromJson(x))),
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
        "shop_category": shopCategory,
        "income": income,
        "rate_value": rateValue,
        "orders": List<dynamic>.from(orders.map((x) => x)),
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "isActive": isActive,
        "__v": v,
      };
}

class SellerProduct {
  SellerProduct({
    required this.rateValue,
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
  });

  int rateValue;
  String id;
  String name;
  String category;
  String subCategory;
  String seller;
  List<String> thumbnail;
  int price;
  int stockCount;
  int remainedStock;
  bool isAvailable;
  List<dynamic> size;
  List<String> color;
  int discount;
  String description;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory SellerProduct.fromJson(Map<String, dynamic> json) => SellerProduct(
        rateValue: json["rate_value"],
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
        color: List<String>.from(json["color"].map((x) => x)),
        discount: json["discount"],
        description: json["description"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "rate_value": rateValue,
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
  });

  String id;
  String username;
  int mobileNumber;
  String password;
  bool isActive;
  bool isFullRegistered;
  List<dynamic> searches;
  List<dynamic> favorite;
  List<dynamic> subscriptions;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

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
      };
}

class SubCategory {
  SubCategory({
    required this.id,
    required this.name,
    required this.v,
  });

  String id;
  String name;
  int v;

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
        id: json["_id"],
        name: json["name"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "__v": v,
      };
}
