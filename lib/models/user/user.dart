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
  List<dynamic> favorite;
  List<dynamic> subscriptions;
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
        favorite: List<dynamic>.from(json["favorite"].map((x) => x)),
        subscriptions: List<dynamic>.from(json["subscriptions"].map((x) => x)),
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
        "favorite": List<dynamic>.from(favorite.map((x) => x)),
        "subscriptions": List<dynamic>.from(subscriptions.map((x) => x)),
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
