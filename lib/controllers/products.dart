import 'package:get/get.dart';
import 'package:wasafi_market/data/repositories/products.dart';
import 'package:wasafi_market/models/products/products.dart';

class ProductsController extends GetxController implements GetxService {
  final ProductRepo productRepo;
  ProductsController({required this.productRepo});

  bool _isLoading = true;
  bool get isLoading => _isLoading;
  List<dynamic> _productList = [];
  List<dynamic> _trendingList = [];
  List<dynamic> _searchedProductList = [];
  List<dynamic> get productList => _productList;
  List<dynamic> get searchedProductList => _searchedProductList;
  List<dynamic> get trendingList => _trendingList;

  Future<void> getProducts() async {
    _isLoading = false;
    update();
    Response response = await productRepo.getProductList();

    if (response.statusCode == 200) {
      _productList = [];
      _productList.addAll(Products.fromJson(response.body).products);
      _isLoading = false;
      update();
    } else {
      _productList = [];
      _isLoading = false;
      update();
    }
  }

  // searching products
  Future<void> searchProducts(category) async {
    _isLoading = true;
    update();
    Response response = await productRepo.searchProductList(category);

    if (response.statusCode == 200) {
      _searchedProductList = [];
      _searchedProductList.addAll(Products.fromJson(response.body).products);
      _isLoading = false;
      update();
    } else {
      _searchedProductList = [];
      _isLoading = false;
      update();
    }
  }

// trending products
  Future<void> trendingProductList() async {
    _isLoading = true;
    update();
    Response response = await productRepo.trendingProductList();

    if (response.statusCode == 200) {
      _trendingList = [];
      _trendingList.addAll(Products.fromJson(response.body).products);
      _isLoading = false;
      update();
    } else {
      _trendingList = [];
      _isLoading = false;
      update();
    }
  }
}
