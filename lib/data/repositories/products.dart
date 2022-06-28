import 'package:get/get.dart';
import 'package:wasafi_market/constant.dart';
import 'package:wasafi_market/data/api/api_client.dart';

class ProductRepo {
  final ApiClient apiClient;
  ProductRepo({required this.apiClient});

  Future<Response> getProductList() async {
    return await apiClient.getData(AppConstant.PRODUCTLIST);
  }

  Future<Response> searchProductList(category) async {
    const uri = AppConstant.PRODUCT_SEARCH;

    return await apiClient.getData('$uri/$category');
  }

  Future<Response> trendingProductList() async {
    return await apiClient.getData(AppConstant.TRENDINGPRODUCTS);
  }
}
