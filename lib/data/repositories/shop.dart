import 'package:get/get.dart';
import 'package:wasafi_market/constant.dart';
import 'package:wasafi_market/data/api/api_client.dart';

class ShopRepo {
  final ApiClient apiClient;
  ShopRepo({required this.apiClient});

// getting the all shops
  Future<Response> getShops() async {
    return await apiClient.getData(AppConstant.SHOP_LIST);
  }

  // getting the shop categories
  Future<Response> getShopCategory() async {
    return await apiClient.getData(AppConstant.SHOP_CATEGORIES);
  }

  // getting shop detail
  Future<Response> getShop(id) async {
    const uri = AppConstant.SHOP_ID;

    return await apiClient.getData("$uri/$id");
  }

  // subscribe shop
  Future<Response> subscribeShop(id) async {
    return await apiClient.updateData('${AppConstant.SUBSCRIBE_SHOP}$id', '');
  }
}
