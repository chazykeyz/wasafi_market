import 'package:get/get_connect.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wasafi_market/constant.dart';
import 'package:wasafi_market/data/api/api_client.dart';
import 'package:wasafi_market/models/user/username.dart';

class UserRepo {
  ApiClient apiClient;
  SharedPreferences sharedPreferences;
  UserRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> gettingUsers() async {
    return await apiClient.getData(AppConstant.SINGLEUSER);
  }

  Future<Response> updatingUser(UsernameChange usernameChange) async {
    return await apiClient.updateData(
        AppConstant.SINGLEUPDATEUSER, usernameChange.toJson());
  }

  Future<Response> readNotification() async {
    return await apiClient.postData(AppConstant.READNOTIFICATION, "");
  }
}
