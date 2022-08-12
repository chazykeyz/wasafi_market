import 'package:get/get.dart';
import 'package:wasafi_market/data/repositories/shop.dart';
import 'package:wasafi_market/models/response.dart';
import 'package:wasafi_market/models/shop/category.dart';
import 'package:wasafi_market/models/shop/shop_details.dart';
import 'package:wasafi_market/models/shop/shops.dart';

class ShopController extends GetxController implements GetxService {
  final ShopRepo shopRepo;
  ShopController({required this.shopRepo});

  bool _isLoading = false;
  bool _subLoading = false;
  List<dynamic> _shopList = [];
  List<dynamic> _shopCategoryList = [];
  List<dynamic> shopDetails = [];

  bool get isloading => _isLoading;
  bool get subLoading => _subLoading;
  List<dynamic> get shopList => _shopList;
  List<dynamic> get shopCategoryList => _shopCategoryList;

// getting the shops
  Future<void> getShops() async {
    _isLoading = true;
    // update();
    Response response = await shopRepo.getShops();

    if (response.statusCode == 200) {
      _shopList = [];
      _shopList.addAll(Shops.fromJson(response.body).shops);
      _isLoading = false;
      update();
    } else {
      _shopList = [];
      _isLoading = false;
      update();
    }
  }

// getting shop categories
  Future<void> getShopCategory() async {
    _isLoading = true;

    Response response = await shopRepo.getShopCategory();
    if (response.statusCode == 200) {
      _shopCategoryList = [];
      _shopCategoryList
          .addAll(ShopCategories.fromJson(response.body).categories);
      _isLoading = false;
      update();
    } else {
      _shopCategoryList = [];
      _isLoading = false;
      update();
    }
  }

  // getting the shop deatil
  Future<void> getShop(id) async {
    shopDetails = [];
    update();
    Response response = await shopRepo.getShop(id);
    if (response.statusCode == 200) {
      shopDetails = [];
      update();
      shopDetails.addAll([ShopDetail.fromJson(response.body)]);
      update();
    } else {
      shopDetails = [];
      _isLoading = false;
      update();
    }
  }

  // subscribe
  Future<void> subscribeShop(id) async {
    _subLoading = true;
    update();
    Response response = await shopRepo.subscribeShop(id);
    if (response.statusCode == 200) {
      _subLoading = false;
      update();
    } else {
      _subLoading = false;
      update();
    }
  }

  //shop update
  Future<ResponseModel> updateShop(id, shopUpdate) async {
    late ResponseModel responseModel;
    Response response = await shopRepo.updateShop(id, shopUpdate);

    if (response.statusCode == 200) {
      responseModel = ResponseModel(true, "Changes Successful updated!");
    } else {
      responseModel = ResponseModel(false, "Changes Failed to updated!");
    }
    return responseModel;
  }
}
