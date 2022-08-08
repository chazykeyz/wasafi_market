class ProductEdit {
  ProductEdit(this.size, this.color, this.discount, this.name, this.price,
      this.stockCount, this.description, this.seller);

  String name;
  String seller;
  int price;
  int stockCount;
  List<dynamic> size;
  List<String> color;
  int discount;
  String description;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["name"] = name;
    data["price"] = price;
    data["seller"] = seller;
    data["stockCount"] = stockCount;
    data["size"] = size;
    data["color"] = color;
    data["discount"] = discount;
    data["description"] = description;
    return data;
  }
}
