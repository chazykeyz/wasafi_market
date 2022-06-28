import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.order,
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
  });

  final List<dynamic> order;
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
  final List<Notification> notification;
  final int wallet;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        order: List<dynamic>.from(json["order"].map((x) => x)),
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
      );

  Map<String, dynamic> toJson() => {
        "order": List<dynamic>.from(order.map((x) => x)),
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
      };
}

class Cart {
  Cart({
    required this.product,
    required this.quantity,
    required this.id,
  });

  final Product product;
  final int quantity;
  final String id;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        product: Product.fromJson(json["product"]),
        quantity: json["quantity"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "product": product.toJson(),
        "quantity": quantity,
        "_id": id,
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
  final List<String> color;
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
        color: List<String>.from(json["color"].map((x) => x)),
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

  final String id;
  final String user;
  final String content;
  final bool isRead;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

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
