// ignore_for_file: constant_identifier_names

class AppConstant {
  static const String APPNAME = "WASAFI MARKET";
  static const String APPVERSION = "1";

  static const String MAP_KEY =
      "pk.eyJ1IjoiY2hhenlrZXl6IiwiYSI6ImNsMjRsOXY5YzA5OXEzZHFpaDFuZHBheXEifQ.IrMMd7lfJiqEfAgzIGovDQ";
  static const String BASEURI = "http://192.168.100.54:3000/";
  static const String SIGNUP = "api/auth/register/";
  static const String VERIFY = "api/auth/verify/";
  static const String GET_REFRESH_TOKEN = "api/auth/jwt-refresh-token/";
  static const String EXPIRATION_CHECK = "api/auth/checking-token/";
  static const String TOKEN = "";
  static const String REFRESH_TOKEN = "";
  static const String SIGN_IN = "api/auth/login/";
  static const String PASSWORD_CHANGE = "api/auth/password-change/";

  // products
  // product main
  static const String PRODUCT_MAIN = "api/products";
  // all products
  static const String PRODUCT_LIST = "api/products/all";
  // product category
  static const String PRODUCT_CATEGORY = "api/product-category/all";
  // searchong products
  static const String PRODUCT_SEARCH = "api/products/search";
  // trending products
  static const String TRENDING_PRODUCTS = "api/products/trending";
  // sizes
  static const String SIZE_LIST = "api/size/all";

  // shops
  static const String SHOP_LIST = "api/shop/all";
  static const String SHOP_CATEGORIES = "api/shop/shop-category/all";
  static const String SHOP_ID = "api/shop";
  static const String SUBSCRIBE_SHOP = "api/shop/followers/";

  // cart
  static const String ADDING_TO_CART = "api/cart/add-to-cart";
  static const String REMOVE_FROM_CART = "api/cart/remove-from-cart";
  static const String REMOVE_WHOLE_ITEM_FROM_CART =
      "api/cart/delete-whole-item-from-cart";
  static const String DELETE_CART = "api/cart/delete-cart";
  // users
  static const String SINGLE_USER = "api/users/me";
  static const String SINGLE_UPDATE_USER = "api/users/update";
  static const String UPDATE_USER_FAVORITE = "api/users/update-favorite";
  // notification
  static const String READ_NOTIFICATION = "api/notifications/read";
}
