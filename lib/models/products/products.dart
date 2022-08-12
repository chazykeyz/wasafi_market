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
    required this.rateValue,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String name;
  Category category;
  SubCategory subCategory;
  Seller seller;
  List<dynamic> thumbnail;
  int price;
  int stockCount;
  int remainedStock;
  bool isAvailable;
  List<dynamic> size;
  List<dynamic> color;
  int discount;
  String description;
  int rateValue;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory ProductsProduct.fromJson(Map<String, dynamic> json) =>
      ProductsProduct(
        id: json["_id"],
        name: json["name"],
        category: Category.fromJson(json["category"]),
        subCategory: SubCategory.fromJson(json["subCategory"]),
        seller: Seller.fromJson(json["seller"]),
        thumbnail: List<dynamic>.from(json["thumbnail"].map((x) => x)),
        price: json["price"],
        stockCount: json["stock_count"],
        remainedStock: json["remained_stock"],
        isAvailable: json["is_available"],
        size: List<dynamic>.from(json["size"].map((x) => x)),
        color: List<dynamic>.from(json["color"].map((x) => x)),
        discount: json["discount"],
        description: json["description"],
        rateValue: json["rate_value"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
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
        "rate_value": rateValue,
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
    required this.id,
    required this.user,
    required this.shopLocation,
    required this.bio,
    required this.link,
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

  String id;
  User user;
  String shopLocation;
  String bio;
  String link;
  List<dynamic> followers;
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
        id: json["_id"],
        user: User.fromJson(json["user"]),
        shopLocation: json["shop_location"],
        bio: json["bio"],
        link: json["link"],
        followers: List<dynamic>.from(json["followers"].map((x) => x)),
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
        "_id": id,
        "user": user.toJson(),
        "shop_location": shopLocation,
        "bio": bio,
        "link": link,
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
    required this.rateValue,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String name;
  String category;
  String subCategory;
  String seller;
  List<dynamic> thumbnail;
  int price;
  int stockCount;
  int remainedStock;
  bool isAvailable;
  List<dynamic> size;
  List<dynamic> color;
  int discount;
  String description;
  int rateValue;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory SellerProduct.fromJson(Map<String, dynamic> json) => SellerProduct(
        id: json["_id"],
        name: json["name"],
        category: json["category"],
        subCategory: json["subCategory"],
        seller: json["seller"],
        thumbnail: List<dynamic>.from(json["thumbnail"].map((x) => x)),
        price: json["price"],
        stockCount: json["stock_count"],
        remainedStock: json["remained_stock"],
        isAvailable: json["is_available"],
        size: List<dynamic>.from(json["size"].map((x) => x)),
        color: List<dynamic>.from(json["color"].map((x) => x)),
        discount: json["discount"],
        description: json["description"],
        rateValue: json["rate_value"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
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
        "rate_value": rateValue,
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
    required this.cart,
    required this.notification,
    required this.wallet,
    required this.order,
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
  List<Cart> cart;
  List<String> notification;
  int wallet;
  List<dynamic> order;

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
    required this.productPrice,
    required this.totalProductPrice,
    required this.color,
    required this.size,
    required this.id,
  });

  dynamic product;
  int quantity;
  int productPrice;
  int totalProductPrice;
  String color;
  String size;
  String id;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        product: json["product"],
        quantity: json["quantity"],
        productPrice: json["product_price"],
        totalProductPrice: json["total_product_price"],
        color: json["color"],
        size: json["size"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "product": product,
        "quantity": quantity,
        "product_price": productPrice,
        "total_product_price": totalProductPrice,
        "color": color,
        "size": size,
        "_id": id,
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
