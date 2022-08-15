import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
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
  List<Favorite> favorite;
  List<Subscription> subscriptions;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  List<Cart> cart;
  List<Notification> notification;
  int wallet;
  List<dynamic> order;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["_id"],
        username: json["username"],
        mobileNumber: json["mobile_number"],
        password: json["password"],
        isActive: json["isActive"],
        isFullRegistered: json["is_full_registered"],
        searches: List<dynamic>.from(json["searches"].map((x) => x)),
        favorite: List<Favorite>.from(
            json["favorite"].map((x) => Favorite.fromJson(x))),
        subscriptions: List<Subscription>.from(
            json["subscriptions"].map((x) => Subscription.fromJson(x))),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        cart: List<Cart>.from(json["cart"].map((x) => Cart.fromJson(x))),
        notification: List<Notification>.from(
            json["notification"].map((x) => Notification.fromJson(x))),
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
        "favorite": List<dynamic>.from(favorite.map((x) => x.toJson())),
        "subscriptions":
            List<dynamic>.from(subscriptions.map((x) => x.toJson())),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "cart": List<dynamic>.from(cart.map((x) => x.toJson())),
        "notification": List<dynamic>.from(notification.map((x) => x.toJson())),
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

  Favorite product;
  int quantity;
  int productPrice;
  int totalProductPrice;
  String color;
  String size;
  String id;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        product: Favorite.fromJson(json["product"]),
        quantity: json["quantity"],
        productPrice: json["product_price"],
        totalProductPrice: json["total_product_price"],
        color: json["color"],
        size: json["size"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "product": product.toJson(),
        "quantity": quantity,
        "product_price": productPrice,
        "total_product_price": totalProductPrice,
        "color": color,
        "size": size,
        "_id": id,
      };
}

class Favorite {
  Favorite({
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
  Subscription seller;
  List<String> thumbnail;
  int price;
  int stockCount;
  int remainedStock;
  bool isAvailable;
  List<String> size;
  List<String> color;
  int discount;
  String description;
  int rateValue;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Favorite.fromJson(Map<String, dynamic> json) => Favorite(
        id: json["_id"],
        name: json["name"],
        category: json["category"],
        subCategory: json["subCategory"],
        seller: Subscription.fromJson(json["seller"]),
        thumbnail: List<String>.from(json["thumbnail"].map((x) => x)),
        price: json["price"],
        stockCount: json["stock_count"],
        remainedStock: json["remained_stock"],
        isAvailable: json["is_available"],
        size: List<String>.from(json["size"].map((x) => x)),
        color: List<String>.from(json["color"].map((x) => x)),
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

class Notification {
  Notification({
    required this.id,
    required this.user,
    required this.content,
    required this.isRead,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String user;
  String content;
  bool isRead;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
        id: json["_id"],
        user: json["user"],
        content: json["content"],
        isRead: json["isRead"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "user": user,
        "content": content,
        "isRead": isRead,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}

class Subscription {
  Subscription({
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
  String user;
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
  List<dynamic> products;
  bool isActive;
  int v;

  factory Subscription.fromJson(Map<String, dynamic> json) => Subscription(
        bio: json["bio"],
        link: json["link"],
        id: json["_id"],
        user: json["user"],
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
        products: List<dynamic>.from(json["products"].map((x) => x)),
        isActive: json["isActive"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "bio": bio,
        "link": link,
        "_id": id,
        "user": user,
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
        "products": List<dynamic>.from(products.map((x) => x)),
        "isActive": isActive,
        "__v": v,
      };
}

class FavoriteModel {
  FavoriteModel({required this.favorite});
  List<String> favorite;

  Map<String, dynamic> toJson() => {"favorite": favorite};
}
