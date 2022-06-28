import 'package:get/get_connect.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:wasafi_market/data/repositories/product_category.dart';
import 'package:wasafi_market/models/products/product_category.dart';

class ProductCategoryController extends GetxController {
  final ProductCategoryRepo productCategoryRepo;
  ProductCategoryController({required this.productCategoryRepo});

  bool _isLoading = false;
  List<dynamic> _productCategoryList = [];

  bool get isLoading => _isLoading;
  List<dynamic> get productCategoryList => _productCategoryList;

  Future<void> getProductCategory() async {
    _isLoading = true;
    update();

    Response response = await productCategoryRepo.productCategoryFetch();

    if (response.statusCode == 200) {
      _productCategoryList = [];
      _productCategoryList
          .addAll(ProductCategory.fromJson(response.body).categories);
      _isLoading = false;
      update();
    } else {
      _productCategoryList = [];
      _isLoading = false;
      update();
    }
  }
}
