// ignore_for_file: constant_identifier_names

class AppConstant {
  static const String APPNAME = "WASAFI MARKET";
  static const String APPVERSION = "1";

  static const String BASEURI = "http://192.168.100.93:3000/";
  static const String SIGNUP = "api/auth/register/";
  static const String VERIFY = "api/auth/verify/";
  static const String GETREFRESHTOKEN = "api/auth/jwt-refresh-token/";
  static const String EXPIRATIONCHECK = "api/auth/checking-token/";
  static const String TOKEN = "hapa";
  static const String REFRESH_TOKEN = "";
  static const String SIGNIN = "api/auth/login/";
  static const String PASSWORDCHANGE = "api/auth/password-change/";

  // products
  static const String PRODUCTLIST = "api/products/all";
  // product category
  static const String PRODUCT_CATEGORY = "api/product-category/all";
  // searchong products
  static const String PRODUCT_SEARCH = "api/products/search";
  // trending products
  static const String TRENDINGPRODUCTS = "api/products/trending";

  // shops
  static const String SHOPLIST = "api/shop/all";
  static const String SHOPCATEGORIES = "api/shop/shop-category/all";
  static const String SHOPID = "api/shop";

  // cart
  static const String ADDING_TO_CART = "api/cart/add-to-cart";
  static const String REMOVE_FROM_CART = "api/cart/remove-from-cart";
  static const String REMOVE_WHOLE_ITEM_FROM_CART =
      "api/cart/delete-whole-item-from-cart";
  // users
  static const String SINGLEUSER = "api/users/me";
  static const String SINGLEUPDATEUSER = "api/users/update";
  // notification
  static const String READNOTIFICATION = "api/notifications/read";
}
