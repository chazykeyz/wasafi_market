import 'package:get/get.dart';
import 'package:wasafi_market/data/repositories/verification.dart';
import 'package:wasafi_market/models/response.dart';
import 'package:wasafi_market/models/verification.dart';

class VerificationController extends GetxController implements GetxService {
  final VerificationRepo verificationRepo;
  VerificationController({required this.verificationRepo});
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<ResponseModel> verification(
      VerificationModel verificationModel) async {
    _isLoading = true;
    update();
    late ResponseModel responseModel;
    Response response = await verificationRepo.verify(verificationModel);

    if (response.statusCode == 200) {
      verificationRepo.saveVerifiedUserToken(
          response.body["accessToken"], response.body["refreshToken"]);
      responseModel = ResponseModel(true, response.body["accessToken"]);
    } else {
      responseModel = ResponseModel(false, response.statusText!);
    }
    _isLoading = false;
    update();

    return responseModel;
  }
}
