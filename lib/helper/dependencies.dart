import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wasafi_market/constant.dart';
import 'package:wasafi_market/controllers/auth.dart';
import 'package:wasafi_market/controllers/cart.dart';
import 'package:wasafi_market/controllers/order.dart';
import 'package:wasafi_market/controllers/product_category.dart';
import 'package:wasafi_market/controllers/products.dart';
import 'package:wasafi_market/controllers/shop.dart';
import 'package:wasafi_market/controllers/user.dart';
import 'package:wasafi_market/controllers/verification.dart';
import 'package:wasafi_market/data/api/api_client.dart';
import 'package:wasafi_market/data/repositories/auth.dart';
import 'package:wasafi_market/data/repositories/cart.dart';
import 'package:wasafi_market/data/repositories/product_category.dart';
import 'package:wasafi_market/data/repositories/products.dart';
import 'package:wasafi_market/data/repositories/shop.dart';
import 'package:wasafi_market/data/repositories/user.dart';
import 'package:wasafi_market/data/repositories/verification.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);

  // api_client
  Get.lazyPut(() => ApiClient(
      appBaseUrl: AppConstant.BASEURI, sharedPreferences: Get.find()));

  // REPOSITORIES
  Get.lazyPut(
      () => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() =>
      VerificationRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => ProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => ProductCategoryRepo(apiClient: Get.find()));
  Get.lazyPut(() => ShopRepo(apiClient: Get.find()));
  Get.lazyPut(
      () => CartRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(
      () => UserRepo(apiClient: Get.find(), sharedPreferences: Get.find()));

  // CONTROLLERS
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  Get.lazyPut(() => VerificationController(verificationRepo: Get.find()));
  Get.lazyPut(() => ProductsController(productRepo: Get.find()));
  Get.lazyPut(() => ProductCategoryController(productCategoryRepo: Get.find()));
  Get.lazyPut(() => ShopController(shopRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
  Get.lazyPut(() => UserController(userRepo: Get.find()));
  Get.lazyPut(() => OrderController());
}
