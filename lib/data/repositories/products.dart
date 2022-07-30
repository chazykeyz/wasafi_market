import 'package:get/get.dart';
import 'package:wasafi_market/constant.dart';
import 'package:wasafi_market/data/api/api_client.dart';

class ProductRepo {
  final ApiClient apiClient;
  ProductRepo({required this.apiClient});

  Future<Response> getProductList() async {
    return await apiClient.getData(AppConstant.PRODUCT_LIST);
  }

  Future<Response> searchProductList(category) async {
    const uri = AppConstant.PRODUCT_SEARCH;

    return await apiClient.getData('$uri/$category');
  }

  Future<Response> trendingProductList() async {
    return await apiClient.getData(AppConstant.TRENDING_PRODUCTS);
  }

  Future<Response> fetchProductDetails(id) async {
    return await apiClient.getData('${AppConstant.PRODUCT_MAIN}/$id');
  }

  Future<Response> postProduct(productAdd) async {
    return await apiClient.formDataSend(AppConstant.PRODUCT_MAIN, productAdd);
  }

  Future<Response> fetchSizes() async {
    return await apiClient.getData(AppConstant.SIZE_LIST);
  }
}
