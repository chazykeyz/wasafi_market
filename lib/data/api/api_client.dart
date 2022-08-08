import 'package:get/get_connect.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wasafi_market/constant.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appBaseUrl;
  final SharedPreferences sharedPreferences;
  late Map<String, String> _mainHeaders;

  ApiClient({
    required this.sharedPreferences,
    required this.appBaseUrl,
  }) {
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 30);
    token = (sharedPreferences.getString(AppConstant.TOKEN) ?? "");
    _mainHeaders = {"Content-Type": "application/json", "auth-token": token};
  }

  // update header
  void updateHeader(String token) {
    _mainHeaders = {"Content-Type": "application/json", "auth-token": token};
  }

// fetching grefresh token
  Future refreshToken() async {
    var _headers = {
      "auth-token":
          sharedPreferences.getString(AppConstant.REFRESH_TOKEN).toString()
    };

    Response response =
        await post(AppConstant.GET_REFRESH_TOKEN, '', headers: _headers);

    if (response.statusCode == 200) {
      saveAccessToken(response.body["accessToken"]);
      saveRefreshToken(response.body["refreshToken"]);
    } else {
      sharedPreferences.remove(AppConstant.REFRESH_TOKEN);
      sharedPreferences.remove(AppConstant.TOKEN);
      token = "";
      updateHeader("");
    }
  }

  // saving the pre token
  saveAccessToken(String token) async {
    token = token;
    updateHeader(token);
    sharedPreferences.setString(AppConstant.TOKEN, token);
  }

  saveRefreshToken(String refresh) async {
    sharedPreferences.setString(AppConstant.REFRESH_TOKEN, refresh);
  }

// checking token expeiration
  Future<bool> checkingExpiration() async {
    Response response =
        await post(AppConstant.EXPIRATION_CHECK, "", headers: _mainHeaders);

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

// the getting function
  Future<Response> getData(String uri) async {
    if (token != "") {
      checkingExpiration().then((value) {
        if (value == false) {
          refreshToken();
        }
      });
    }
    try {
      Response response = await get(uri, headers: _mainHeaders);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

//  putting data function
  Future<Response> postData(String uri, dynamic body) async {
    if (token != "") {
      checkingExpiration().then((value) {
        if (value == false) {
          refreshToken();
        }
      });
    }
    try {
      Response response = await post(uri, body, headers: _mainHeaders);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  // deleting data function
  Future<Response> deletePost(String uri) async {
    if (token != "") {
      checkingExpiration().then((value) {
        if (value == false) {
          refreshToken();
        }
      });
    }
    try {
      Response response = await delete(uri, headers: _mainHeaders);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  // updating data function
  Future<Response> updateData(String uri, dynamic body) async {
    if (token != "") {
      checkingExpiration().then((value) {
        if (value == false) {
          refreshToken();
        }
      });
    }
    try {
      Response response = await put(uri, body, headers: _mainHeaders);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

// patching data
  // updating data function
  Future<Response> patchingData(String uri, dynamic body) async {
    if (token != "") {
      checkingExpiration().then((value) {
        if (value == false) {
          refreshToken();
        }
      });
    }
    try {
      Response response = await patch(uri, body, headers: _mainHeaders);

      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  // the formdata puting
  Future<Response> formDataSend(String uri, dynamic body) async {
    var _headers = {"auth-token": token};
    if (token != "") {
      checkingExpiration().then((value) {
        if (value == false) {
          refreshToken();
        }
      });
    }

    try {
      Response response = await post(uri, body,
          contentType: "multipart/form-data", headers: _headers);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
