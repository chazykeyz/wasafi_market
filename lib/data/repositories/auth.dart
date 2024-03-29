import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wasafi_market/constant.dart';
import 'package:wasafi_market/data/api/api_client.dart';
import 'package:wasafi_market/models/auth/password.dart';
import 'package:wasafi_market/models/auth/sign_in.dart';
import 'package:wasafi_market/models/auth/sign_up.dart';

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
    return await apiClient.postData(AppConstant.SIGN_IN, signInBody.toJson());
  }

  // checking token
  bool checkingToken() {
    return sharedPreferences.containsKey(AppConstant.TOKEN);
  }

  Future<String> getToken() async {
    return sharedPreferences.getString(AppConstant.TOKEN) ?? "None";
  }

  // loggin out clearing the local storage
  bool clearedSharedData() {
    sharedPreferences.remove(AppConstant.REFRESH_TOKEN);
    sharedPreferences.remove(AppConstant.TOKEN);
    apiClient.token = "";
    apiClient.updateHeader("");
    return true;
  }

  // saving the pre token
  saveAccessToken(String token) async {
    apiClient.token = token;
    apiClient.updateHeader(token);
    sharedPreferences.setString(AppConstant.TOKEN, token);
  }

  saveRefreshToken(String refresh) async {
    sharedPreferences.setString(AppConstant.REFRESH_TOKEN, refresh);
  }

// save the main tokens
  savePreRegistUserToken(String token) async {
    apiClient.token = token;
    apiClient.updateHeader(token);
    await sharedPreferences.setString(AppConstant.TOKEN, token);
  }

  // changing password
  Future<Response> changingPassword(PasswordChange passwordChange) {
    return apiClient.postData(
        AppConstant.PASSWORD_CHANGE, passwordChange.toJson());
  }
}
