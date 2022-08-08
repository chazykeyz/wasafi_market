class CartModel {
  String product;
  int productPrice;
  String color;
  String size;

  CartModel(
      {required this.product,
      required this.productPrice,
      required this.color,
      required this.size});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["product"] = product;
    data["product_price"] = productPrice;
    data["color"] = color;
    data["size"] = size;
    return data;
  }
}
