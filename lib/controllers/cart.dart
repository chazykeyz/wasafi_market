import 'package:get/get_connect.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:wasafi_market/data/repositories/cart.dart';
import 'package:wasafi_market/models/cart/cart.dart';
import 'package:wasafi_market/models/response.dart';

class CartController extends GetxController implements GetxService {
  final CartRepo cartRepo;
  CartController({required this.cartRepo});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<ResponseModel> cartPost(CartModel cartModel) async {
    _isLoading = true;
    update();
    Response response = await cartRepo.postCart(cartModel);

    late ResponseModel responseModel;

    if (response.statusCode == 200) {
      responseModel = ResponseModel(true, "Item added to cart successful!");
    } else {
      responseModel =
          ResponseModel(false, "There is a problem while adding to cart...");
    }
    _isLoading = false;
    update();

    return responseModel;
  }

  // remove from cart
  Future<ResponseModel> cartItemRemove(id) async {
    Response response = await cartRepo.cartItemRemove(id);

    late ResponseModel responseModel;

    if (response.statusCode == 200) {
      responseModel = ResponseModel(true, "item removed");
    } else {
      responseModel = ResponseModel(false, "item failed to be removed");
    }
    _isLoading = false;
    update();

    return responseModel;
  }
}
