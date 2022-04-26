import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wasafi_market/constant.dart';
import 'package:wasafi_market/controllers/auth_controller.dart';
import 'package:wasafi_market/controllers/verification.dart';
import 'package:wasafi_market/data/api/api_client.dart';
import 'package:wasafi_market/data/repositories/authentication.dart';
import 'package:wasafi_market/data/repositories/verification.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);

  // api_client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstant.BASEURI));

  // REPOSITORIES
  Get.lazyPut(
      () => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() =>
      VerificationRepo(apiClient: Get.find(), sharedPreferences: Get.find()));

  // CONTROLLERS
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  Get.lazyPut(() => VerificationController(verificationRepo: Get.find()));
}
