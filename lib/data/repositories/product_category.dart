import 'package:get/get_connect.dart';
import 'package:wasafi_market/constant.dart';
import 'package:wasafi_market/data/api/api_client.dart';

class ProductCategoryRepo {
  final ApiClient apiClient;

  ProductCategoryRepo({required this.apiClient});
  // product category
  Future<Response> productCategoryFetch() {
    return apiClient.getData(AppConstant.PRODUCT_CATEGORY);
  }
}
