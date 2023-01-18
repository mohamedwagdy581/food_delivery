import 'dart:convert';

import 'package:food_delivery/models/cart_model.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepo
{
  final SharedPreferences sharedPreferences;

  CartRepo({required this.sharedPreferences});

  List<String> cart =[];
  List<String> cartHistory =[];
  void addToCartList(List<CartModel> cartList)
  {
    sharedPreferences.remove(AppConstants.CART_LIST);
    cart =[];
    cartList.forEach((element)
    {
      return cart.add(jsonEncode(element));
    });
    cartList.forEach((element)=>cart.add(jsonEncode(element)));
    sharedPreferences.setStringList(AppConstants.CART_LIST, cart);
    getCartList();
  }

  List<CartModel> getCartList()
  {
    List<String> carts = [];
    if(sharedPreferences.containsKey(AppConstants.CART_LIST))
    {
      carts = sharedPreferences.getStringList(AppConstants.CART_LIST)!;
      //print("inside getCartList  $carts");
    }
    List<CartModel> cartList = [];

    carts.forEach((element)
    {
      cartList.add(CartModel.fromJson(jsonDecode(element)));
    });

    //carts.forEach((element) => CartModel.fromJson(jsonDecode(element)));

    return cartList;
  }

  void addToCartHistoryList()
  {
    if(sharedPreferences.containsKey(AppConstants.CART_HISTORY_LIST))
    {
      cartHistory = sharedPreferences.getStringList(AppConstants.CART_HISTORY_LIST)!;
    }
    for(int i = 0; i < cart.length; i++)
    {
      print("History List${cart[i]}");
      cartHistory.add(cart[i]);
    }
    removeCart();
    sharedPreferences.setStringList(AppConstants.CART_HISTORY_LIST, cartHistory);
  }

  List<CartModel> getCartHistoryList()
  {
    if(sharedPreferences.containsKey(AppConstants.CART_HISTORY_LIST))
    {
      cartHistory = [];
      cartHistory = sharedPreferences.getStringList(AppConstants.CART_HISTORY_LIST)!;
    }
    List<CartModel> cartHistoryList = [];
    cartHistory.forEach((element) => cartHistoryList.add(CartModel.fromJson(jsonDecode(element))));
    return cartHistoryList;
  }

  void removeCart()
  {
    cart = [];
    sharedPreferences.remove(AppConstants.CART_LIST);
  }
}