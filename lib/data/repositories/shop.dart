import 'package:get/get.dart';
import 'package:wasafi_market/constant.dart';
import 'package:wasafi_market/data/api/api_client.dart';

class ShopRepo {
  final ApiClient apiClient;
  ShopRepo({required this.apiClient});

// getting the all shops
  Future<Response> getShops() async {
    return await apiClient.getData(AppConstant.SHOPLIST);
  }

  // getting the shop categories
  Future<Response> getShopCategory() async {
    return await apiClient.getData(AppConstant.SHOPCATEGORIES);
  }

  // getting shop detail
  Future<Response> getShop(id) async {
    const uri = AppConstant.SHOPID;

    return await apiClient.getData("$uri/$id");
  }
}
