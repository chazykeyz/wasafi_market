import 'package:get/get_connect.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:wasafi_market/data/repositories/auth.dart';
import 'package:wasafi_market/models/auth/password.dart';
import 'package:wasafi_market/models/response.dart';
import 'package:wasafi_market/models/auth/sign_in.dart';
import 'package:wasafi_market/models/auth/sign_up.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;
  AuthController({required this.authRepo});
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String _user = 'user';
  String get user => _user;

// registration
  Future<ResponseModel> registration(SignUpBody signUpBody) async {
    _isLoading = true;
    update();
    late ResponseModel responseModel;
    Response response = await authRepo.registration(signUpBody);

    if (response.statusCode == 200) {
      authRepo.savePreRegistUserToken(response.body["token"]);
      responseModel = ResponseModel(true, "registration succeed!");
    } else {
      responseModel = ResponseModel(false, response.body["message"]);
    }
    _isLoading = false;
    update();

    return responseModel;
  }

// login
  Future<ResponseModel> login(SignInBody signInBody) async {
    _isLoading = true;
    update();
    late ResponseModel responseModel;
    Response response = await authRepo.login(signInBody);

    if (response.statusCode == 200) {
      authRepo.saveUserToken(
          response.body["accessToken"], response.body["refreshToken"]);
      _user = response.body['User']['username'];
      update();
      responseModel = ResponseModel(true, response.body["accessToken"]);
    } else {
      responseModel = ResponseModel(false, response.statusText!);
    }
    _isLoading = false;
    update();
    return responseModel;
  }

// PASSWORD CHANGE
  Future<ResponseModel> passwordChange(PasswordChange passwordChange) async {
    _isLoading = true;
    update();
    late ResponseModel responseModel;
    Response response = await authRepo.changingPassword(passwordChange);

    if (response.statusCode == 200) {
      responseModel = ResponseModel(true, response.body);
    } else {
      responseModel = ResponseModel(false, response.body);
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  bool logginUser() {
    return authRepo.checkingToken();
  }

  getToken() {
    var token = authRepo.getToken();
    return token;
  }

  bool clearedSharedData() {
    return authRepo.clearedSharedData();
  }
}
