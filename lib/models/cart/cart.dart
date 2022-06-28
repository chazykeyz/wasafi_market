class CartModel {
  String product;
  CartModel({required this.product});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["product"] = product;
    return data;
  }
}
