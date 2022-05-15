import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wasafi_market/constant.dart';
import 'package:wasafi_market/data/api/api_client.dart';
import 'package:wasafi_market/models/sign_in.dart';
import 'package:wasafi_market/models/sign_up.dart';

class AuthRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  AuthRepo({required this.apiClient, required this.sharedPreferences});

// registration
  Future<Response> registration(SignUpBody signUpBody) {
    return apiClient.postData(AppConstant.SIGNUP, signUpBody.toJson());
  }

// login
  Future<Response> login(SignInBody signInBody) async {
    return await apiClient.postData(AppConstant.SIGNIN, signInBody.toJson());
  }

  // saving the pre token
  saveUserToken(String token, String refresh) async {
    apiClient.token = token;
    apiClient.updateHeader(token);
    await sharedPreferences.setString(AppConstant.REFRESH_TOKEN, refresh);
    await sharedPreferences.setString(AppConstant.TOKEN, token);
  }

// save the main tokens
  savePreRegistUserToken(String token) async {
    apiClient.token = token;
    apiClient.updateHeader(token);
    await sharedPreferences.setString(AppConstant.TOKEN, token);
  }
}
