
import 'dart:convert';

import 'package:ecommerce/utils/app_contants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/cart_model.dart';

class CartRepo{

  final SharedPreferences sharedPrefernces;
  CartRepo({required this.sharedPrefernces});

  List<String> cart = [];
  List<String> cartHistory = [];
  void addToCartList(List<CartModel> cartLsit) {
   // sharedPrefernces.remove(AppCpnstant.CART_LIST);
    //sharedPrefernces.remove(AppCpnstant.CART_HISTORY_LIST);
    cart =[];
    var time = DateTime.now().toString();
    //Convert objects to string because sharedpreferences only accept string.

    cartLsit.forEach((element){
      element.time = time;
      return cart.add(jsonEncode(element));});
    
    sharedPrefernces.setStringList("cart-list" /*AppCpnstant.CART_LIST*/ , cart);
    print(sharedPrefernces.getStringList("cart-list"/*AppCpnstant.CART_LIST*/ ));
    //getCartList();
  }


  List<CartModel> getCartList(){

    List<String> carts = [];
    if(sharedPrefernces.containsKey("cart-list" /*AppCpnstant.CART_LIST*/)){

      carts = sharedPrefernces.getStringList("cart-list"/*AppCpnstant.CART_LIST*/)!;
      print("inside getCartList "+carts.toString());
    }

      List<CartModel> cartList = [];
    carts.forEach((element) {
      cartList.add(CartModel.fromJson(jsonDecode(element)));
    });
    return cartList;
  }

  List<CartModel> getCartHistoryList() {
    if (sharedPrefernces.containsKey(AppCpnstant.CART_HISTORY_LIST)) {
      cartHistory = [];
      cartHistory =
      sharedPrefernces.getStringList(AppCpnstant.CART_HISTORY_LIST)!;
    }
    List<CartModel> cartListHistory =[];
    cartHistory.forEach((element) => cartListHistory.add(CartModel.fromJson(jsonDecode(element))));
    return cartListHistory;
  }
  void addToCartHistoryList(){

    if(sharedPrefernces.containsKey(AppCpnstant.CART_HISTORY_LIST)){
      cartHistory = sharedPrefernces.getStringList(AppCpnstant.CART_HISTORY_LIST)!;
    }

    for(int i=0; i<cart.length; i++){
      print("cart histor"+cart[i]);
      cartHistory.add(cart[i]);
    }
    removeToCart();
    sharedPrefernces.setStringList(AppCpnstant.CART_HISTORY_LIST, cartHistory);
    print("Length of history list is "+getCartHistoryList().length.toString());
  }

  void removeToCart(){
    cart =[];
    sharedPrefernces.remove(AppCpnstant.CART_LIST);

  }
}