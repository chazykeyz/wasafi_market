import 'package:get/get.dart';
import 'package:wasafi_market/data/repositories/products.dart';
import 'package:wasafi_market/models/products.dart';

class ProductsController extends GetxController implements GetxService {
  final ProductRepo productRepo;
  ProductsController({required this.productRepo});

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  List<dynamic> _productList = [];
  List<dynamic> get productList => _productList;

  Future<void> getProducts() async {
    _isLoading = true;
    update();

    Response response = await productRepo.getProductList();

    if (response.statusCode == 200) {
      _productList = [];
      _productList.addAll(Products.fromJson(response.body).data);
      _isLoading = false;
      update();
    } else {
      print("could not get products");
    }
  }
}
