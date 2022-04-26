import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wasafi_market/constant.dart';
import 'package:wasafi_market/data/api/api_client.dart';
import 'package:wasafi_market/models/sign_up.dart';

class AuthRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  AuthRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> registration(SignUpBody signUpBody) {
    return apiClient.postData(AppConstant.SIGNUP, signUpBody.toJson());
  }

  savePreRegistUserToken(String token) async {
    apiClient.token = token;
    apiClient.updateHeader(token);
    print(token);
    return await sharedPreferences.setString(AppConstant.TOKEN, token);
  }
}
