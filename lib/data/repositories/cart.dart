import 'package:get/get_connect.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wasafi_market/constant.dart';
import 'package:wasafi_market/data/api/api_client.dart';
import 'package:wasafi_market/models/cart/cart.dart';

class CartRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  CartRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> postCart(CartModel cartModel) async {
    return apiClient.postData(AppConstant.ADDING_TO_CART, cartModel.toJson());
  }

  Future<Response> cartItemRemove(id) async {
    var url = AppConstant.REMOVE_FROM_CART;

    return await apiClient.postData('$url/$id', '');
  }

  Future<Response> removeWholeItemFromCart(id) async {
    var url = AppConstant.REMOVE_WHOLE_ITEM_FROM_CART;
    return await apiClient.postData('$url/$id', '');
  }

  Future<Response> deleteCart() async {
    return await apiClient.postData(AppConstant.DELETE_CART, '');
  }
}
