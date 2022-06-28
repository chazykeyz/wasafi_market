import 'package:get/get.dart';
import 'package:wasafi_market/data/repositories/user.dart';
import 'package:wasafi_market/models/response.dart';
import 'package:wasafi_market/models/user/user.dart';
import 'package:wasafi_market/models/user/username.dart';

class UserController extends GetxController implements GetxService {
  UserRepo userRepo;
  UserController({required this.userRepo});

  bool _isLoading = false;
  List _userList = [];
  bool get isLoading => _isLoading;
  List get userList => _userList;

  Future<void> gettingUser() async {
    _isLoading = true;
    update();
    Response response = await userRepo.gettingUsers();

    if (response.statusCode == 200) {
      _userList = [];
      _userList.addAll([UserModel.fromJson(response.body)]);
      _isLoading = false;
      update();
    } else {
      _userList = [];
      _isLoading = false;
      update();
    }
  }

  Future<ResponseModel> updatingUser(UsernameChange usernameChange) async {
    _isLoading = true;
    update();
    Response response = await userRepo.updatingUser(usernameChange);
    late ResponseModel responseModel;

    if (response.statusCode == 200) {
      _isLoading = false;
      update();
      responseModel = ResponseModel(true, "Username successfull updated!");
    } else {
      _isLoading = false;
      update();
      responseModel = ResponseModel(false, "Username update failed!");
    }
    return responseModel;
  }

  Future<void> readNotification() async {
    await userRepo.readNotification();
  }
}
