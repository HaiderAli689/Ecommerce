
import 'dart:ui';

import 'package:ecommerce/controllers/cart_controller.dart';
import 'package:ecommerce/data/repository/popular_product_repo.dart';
import 'package:ecommerce/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/cart_model.dart';

class PopularProductController extends GetxController{
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList ;
  late CartController _cart;

  bool _isLoading =false;
  bool get isLoading => _isLoading;

  int _quantity = 0;
  int get quantity => _quantity;

  int _inCartItems = 0;

  int get inCartItems => _inCartItems+_quantity;

  Future<void> getPopularProductList()async {

    Response response = await popularProductRepo.getPopularProductList();
    if(response.statusCode==200) {
        print("Got Products");
        _popularProductList =[];
        _popularProductList.addAll(Product.fromJson(response.body).products);
        print(_popularProductList);
        _isLoading = true;
        update();
      }
    else{
      print(" Not Got Products");

    }
  }

  void setQuantity(bool isIncrement){
    if(isIncrement)
      {
        print("increment"+quantity.toString());
        _quantity = checkQuantity( _quantity+1);
        print("The number of items"+_quantity.toString());
      }else{
      _quantity =checkQuantity( _quantity-1);
      print("Decrement"+quantity.toString());
    }
    update();
  }

  int checkQuantity(int quantity){
    if((_inCartItems+quantity)<0)
      {
        Get.snackbar("item count", "'you can't reduce more!'",
        backgroundColor: Color(0xff89dad0),
        colorText: Colors.red);

        if(_quantity>0)
          {
            _quantity =_inCartItems;
            return _quantity;
          }
        return 0;

      }else if((_inCartItems+quantity)>20){
      Get.snackbar("item count", "'you can't add more!'",
          backgroundColor: Color(0xff89dad0),
          colorText: Colors.red);
      return 20;
    }else{
      return quantity;
    }
  }

  void initProduct(ProductModel product,CartController cart) {
    _quantity =0;
    _inCartItems= 0;
    _cart=cart;
    var exist =false;
    exist = _cart.existInCart(product);
    //if exist
    //Get Storage from inCartItems3
    print("exist or not"+exist.toString());
    if(exist)
      {
        _inCartItems= _cart.getQuantity(product);
      }
    print("The quantity is in the cart "+_inCartItems.toString());
  }

  void addItems(ProductModel product, ) {
    /*if(quantity>0)
      {*/
        _quantity=0;
        _inCartItems = _cart.getQuantity(product);
        _cart.addItems(product, quantity);
        _cart.items.forEach((key, value) {
          print("The id is"+value.id.toString()+"The quantity is "+value.quantity.toString());
        });

     /* }else
        {
          Get.snackbar("item count", "'you should at least item in the cart!'",
              backgroundColor: Color(0xff89dad0),
              colorText: Colors.red);
        }*/
    update();
  }

  int get totalItems{
    return _cart.totalItems;
  }

  List<CartModel> get getItems{
     return _cart.getItems;
  }
  }