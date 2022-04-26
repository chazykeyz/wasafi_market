import 'package:get/get_connect.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:wasafi_market/data/repositories/authentication.dart';
import 'package:wasafi_market/models/response.dart';
import 'package:wasafi_market/models/sign_up.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;
  AuthController({required this.authRepo});
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<ResponseModel> registration(SignUpBody signUpBody) async {
    _isLoading = true;
    update();
    late ResponseModel responseModel;
    Response response = await authRepo.registration(signUpBody);

    if (response.statusCode == 200) {
      authRepo.savePreRegistUserToken(response.body["token"]);
      responseModel = ResponseModel(true, response.body["token"]);
    } else {
      responseModel = ResponseModel(false, response.statusText!);
    }

    _isLoading = false;
    update();

    return responseModel;
  }
}
