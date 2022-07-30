import 'package:get/get.dart';
import 'package:wasafi_market/data/repositories/products.dart';
import 'package:wasafi_market/models/products/add_product.dart';
import 'package:wasafi_market/models/products/product_single.dart';
import 'package:wasafi_market/models/products/products.dart';
import 'package:wasafi_market/models/products/size.dart';
import 'package:wasafi_market/models/response.dart';

class ProductsController extends GetxController implements GetxService {
  final ProductRepo productRepo;
  ProductsController({required this.productRepo});
// booleans
  bool _isLoading = true;
  bool get isLoading => _isLoading;
  // lists of items fetched
  List<dynamic> _productList = [].obs;
  List<dynamic> _trendingList = [].obs;
  List<dynamic> _searchedProductList = [].obs;
  List<dynamic> _productDetail = [].obs;
  List _sizeList = [].obs;
  // publicing the privating variables
  List<dynamic> get productList => _productList;
  List<dynamic> get searchedProductList => _searchedProductList;
  List<dynamic> get trendingList => _trendingList;
  List<dynamic> get productDetail => _productDetail;
  List<dynamic> get sizeList => _sizeList;

  Future<void> getProducts() async {
    _isLoading = false;
    Response response = await productRepo.getProductList();

    if (response.statusCode == 200) {
      _productList = [].obs;
      _productList.addAll(Products.fromJson(response.body).products);
      _isLoading = false;
      update();
    } else {
      _productList = [].obs;
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

  // product details get
  Future<void> getProductDetail(id) async {
    Response response = await productRepo.fetchProductDetails(id);
    if (response.statusCode == 200) {
      _productDetail = [];
      _productDetail.addAll([ProductSingle.fromJson(response.body)]);
      update();
    } else {
      _productDetail = [];
      update();
    }
  }

// fetch sizes
  Future<void> getSizes() async {
    Response response = await productRepo.fetchSizes();

    if (response.statusCode == 200) {
      _sizeList = [].obs;
      for (var item in response.body) {
        _sizeList.add(Sizes.fromJson(item));
      }
    } else {
      _sizeList = [].obs;
    }
  }

// posting products
  Future<ResponseModel> postProducts(ProductAdd productAdd) async {
    List<MultipartFile> _document = [];
    Map<String, Object> _formBody = {};
// image
    for (int i = 0; i < productAdd.thumbnail.length; i++) {
      String fileName = productAdd.thumbnail[i].path.split("/").last;
      _document
          .add(MultipartFile(productAdd.thumbnail[i].path, filename: fileName));
    }
    // size
    for (int i = 0; i < productAdd.size.length; i++) {
      _formBody.addAll({"size[$i]": productAdd.size[i]});
    }
    // color
    for (int i = 0; i < productAdd.color.length; i++) {
      _formBody.addAll({
        "color[$i]": productAdd.color[i],
      });
    }

    // merging with all data
    _formBody.addAll({
      "discount": productAdd.discount,
      "name": productAdd.name,
      "category": productAdd.category,
      "subCategory": productAdd.subCategory,
      "seller": productAdd.seller,
      "thumbnail": _document,
      "price": productAdd.price,
      "stockCount": productAdd.stockCount,
      "description": productAdd.description
    });
    FormData formData = FormData(_formBody);

    Response response = await productRepo.postProduct(formData);
    late ResponseModel responseModel;

    if (response.statusCode == 200) {
      responseModel = ResponseModel(true, "Product posted successfully!");
    } else {
      responseModel = ResponseModel(false, "Product post failed!");
    }
    return responseModel;
  }
}
