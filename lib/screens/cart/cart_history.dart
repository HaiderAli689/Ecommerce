

import 'dart:convert';

import 'package:ecommerce/base/no_data_page.dart';
import 'package:ecommerce/controllers/cart_controller.dart';
import 'package:ecommerce/models/cart_model.dart';
import 'package:ecommerce/routes/route_helper.dart';
import 'package:ecommerce/utils/app_contants.dart';
import 'package:ecommerce/utils/dimensions.dart';
import 'package:ecommerce/widgets/app_icons.dart';
import 'package:ecommerce/widgets/big_texts.dart';
import 'package:ecommerce/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

class CartHistoryScreen extends StatefulWidget {
  const CartHistoryScreen({Key? key}) : super(key: key);

  @override
  State<CartHistoryScreen> createState() => _CartHistoryScreenState();
}

class _CartHistoryScreenState extends State<CartHistoryScreen> {
  @override
  Widget build(BuildContext context) {

    var getCartHistoryList = Get.find<CartController>().
    getCartHistoryList().reversed.toList();
    Map<String, int> cartItemsPerOrder = Map();
    for(int i =0; i<getCartHistoryList.length; i++){
      if(cartItemsPerOrder.containsKey(getCartHistoryList[i].time)){
        cartItemsPerOrder.update(getCartHistoryList[i].time!, (value) => ++value);
      }else{
        cartItemsPerOrder.putIfAbsent(getCartHistoryList[i].time!,() =>1);
      }
    }

    List<int> cartItemsPerOrderToList(){
      return cartItemsPerOrder.entries.map((e) => e.value).toList();
    }
    List<String> cartOrderTimeToList(){
      return cartItemsPerOrder.entries.map((e) => e.key).toList();
    }

    List<int> itemsPerOrder = cartItemsPerOrderToList();

    var listCounter = 0;

   /* Widget timeWidget(int index){
      var outputDate = DateTime.now().toString();

      if(index<getCartHistoryList.length) {
        DateTime parseDate = DateFormat("yyyy-MM-dd HH:mm:ss").parse(
            getCartHistoryList[listCounter].time!);
        var inputDate = DateTime.parse(parseDate.toString());
        var outputFormat = DateFormat("MM/dd/yyyy  hh:mm a");
        outputDate = outputFormat.format(inputDate);
      }
        return BigText(text: outputDate);
    }*/

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: Dimensions.height20*5,
            color: Color(0xff89dad0),
            width: double.maxFinite,
            padding: EdgeInsets.only(top: Dimensions.height45),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BigText(text: "Cart History", color: Colors.white,),
                AppIcons(icon: Icons.shopping_cart_outlined,iconcolor: Color(0xff89dad0),)
              ],
            ),
          ),
          GetBuilder<CartController>(builder: (_cartController){
            return _cartController.getCartHistoryList().length>0?Expanded(
              child: Container(

                  margin: EdgeInsets.only(
                    top: Dimensions.height20,
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                  ),
                  child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: ListView(

                      children: [
                        for(int i =0; i<3/*cartItemsPerOrder.length*/; i++)
                          Container(
                            height: Dimensions.height30*4,
                            margin: EdgeInsets.only(bottom: Dimensions.height20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //BigText(text: '12/2/2023' /*getCartHistoryList[listCounter].time!*/),
                                //timeWidget(listCounter),
                                SizedBox(height: Dimensions.height10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Wrap(
                                        direction: Axis.horizontal,
                                        children: List.generate(2/*(itemsPerOrder[i]*/, (index) {
                                          if(listCounter<getCartHistoryList.length){
                                            listCounter++;
                                          }
                                          return index<2?Container(
                                              child: Container(
                                                height: Dimensions.height20*4,
                                                width: Dimensions.width20*4,
                                                margin: EdgeInsets.only(right: Dimensions.width10/2),
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(Dimensions.radius15/2),
                                                  image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image:  AssetImage('assets/images/foodimg1.jpg')
                                                    /*NetworkImage(AppCpnstant.BASE_URL+AppCpnstant.UPLOAD_URL+getCartHistoryList[listCounter-1].img!)*/),

                                                ),
                                              )
                                          ):Container(

                                          );
                                        })
                                    ),
                                    GestureDetector(
                                      onTap: ()
                                      {
                                        /*var orderTime = cartOrderTimeToList();
                                  print("Tested"+orderTime[i].toString());

                                  Map<int, CartModel> moreOrder ={};
                                  for(int j=0; j<getCartHistoryList.length; j++){
                                    if(getCartHistoryList[j].time==orderTime[i]){
                                      //print("My order is "+orderTime[i] );
                                      //print("My cart or product id is "+getCartHistoryList[j].id.toString() );
                                      //print("Product info is "+jsonEncode(getCartHistoryList[j]));
                                      moreOrder.putIfAbsent(getCartHistoryList[j].id!, () =>
                                      CartModel.fromJson(jsonDecode(jsonEncode(getCartHistoryList[j]))));
                                    }
                                  }*/

                                        // Get.find<CartController>().setItems = moreOrder;
                                        //Get.find<CartController>().addToCartList();

                                        Get.toNamed(RouteHelper.getCartPage());
                                      },
                                      child: Container(
                                          height: Dimensions.height20*4,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              SmallText(text: "Total",color: Color(0xff5c524f),),
                                              BigText(text: "# of Items" /*itemsPerOrder[i].toString()*/, color: Color(0xff5c524f),),
                                              Container(
                                                padding: EdgeInsets.symmetric(horizontal: Dimensions.width10,vertical: Dimensions.height10/2),
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(Dimensions.radius15/3),
                                                    border: Border.all(width: 1,color: Color(0xff89dad0))
                                                ),
                                                child: SmallText(text: "one more",color: Color(0xff89dad0),),
                                              ),

                                            ],
                                          )
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                      ],
                    ),)
              ),
            ):Container(
                height: MediaQuery.of(context).size.height/1.5,
                child: Center(
                    child: NoDataScreen(text: "You didn't buy anything buy far!", imgPath: "assets/images/empty.jpg",)));
          })
        ],
      ),
    );
  }
}
