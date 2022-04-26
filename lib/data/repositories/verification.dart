import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wasafi_market/constant.dart';
import 'package:wasafi_market/data/api/api_client.dart';
import 'package:wasafi_market/models/verification.dart';

class VerificationRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  VerificationRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> verify(VerificationModel verificationModel) {
    return apiClient.postData(AppConstant.VERIFY, verificationModel.toJson());
  }

  saveVerifiedUserToken(String token, String refresh) async {
    apiClient.token = token;
    apiClient.updateHeader(token);
    print("success done and verified...");
    print(token);
    print(refresh);
    await sharedPreferences.setString(AppConstant.REFRESH_TOKEN, refresh);
    return await sharedPreferences.setString(AppConstant.TOKEN, token);
  }
}
