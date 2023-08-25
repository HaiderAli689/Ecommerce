
import 'package:ecommerce/base/no_data_page.dart';
import 'package:ecommerce/controllers/cart_controller.dart';
import 'package:ecommerce/controllers/popular_product_controler.dart';
import 'package:ecommerce/routes/route_helper.dart';
import 'package:ecommerce/screens/home/main_food_screen.dart';
import 'package:ecommerce/utils/dimensions.dart';
import 'package:ecommerce/widgets/app_icons.dart';
import 'package:ecommerce/widgets/big_texts.dart';
import 'package:ecommerce/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../food/popular_food_details.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            left: Dimensions.width20,
            right: Dimensions.width20,
              top: Dimensions.height20*3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: ()
                {
                  Get.to(() =>PopularFoodDetails());

                },
                child: AppIcons(icon: Icons.arrow_back_ios,
                iconcolor: Colors.white,
                backgroundcolor: Color(0xff89dad0),
                iconSize: Dimensions.icon24,),
              ),
              SizedBox(width: Dimensions.width30*5,),
              GestureDetector(
                onTap: (){
                  Get.toNamed(RouteHelper.getInitial());
                },
                child: AppIcons(icon: Icons.home_outlined,
                iconcolor: Colors.white,
                backgroundcolor: Color(0xff89dad0),
                iconSize: Dimensions.icon24,),
              ),
              AppIcons(icon: Icons.shopping_cart,
              iconcolor: Colors.white,
              backgroundcolor: Color(0xff89dad0),
              iconSize: Dimensions.icon24,),
            ],
          )),

          GetBuilder<CartController>(builder: (_cartController){
            return _cartController.getItems.length>0?Positioned(
                top: Dimensions.height20*5,
                left: Dimensions.width20,
                right: Dimensions.width20,
                bottom: 0,
                child: Container(
                  margin: EdgeInsets.only(top: Dimensions.height15),
                  //color: Colors.red,
                  child: MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: GetBuilder<CartController>(builder: (cartController){
                        var _cartList = cartController.getItems;
                        return ListView.builder(
                            itemCount: 10/*_cartList.length*/,
                            itemBuilder: (_, index){
                              return Container(
                                width: double.maxFinite,
                                height: Dimensions.height20*5,
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap:()
                                      {
                                        Get.toNamed(RouteHelper.getpopularFood(index));
                                        //var productIndex = Get.find<PopularProductController>().
                                        // popularProductList.indexOf(_cartList[index].product!);
                                        /*if(popularIndex>+0)
                                {
                                  Get.toNamed(RouteHelper.getpopularFood(popularIndex));
                                }
                              else
                                {
                                  //var recommendedIndex = Get.find<RecommendedProductController>().
                                  recommendedProductList.indexOf(_cartList[index].product!);
                                  Get.snackbar("History product", "Product review is not availablt to history product");
                                  if(recommendedIndex<0){

                                  }else{
                                   //Get.toNamed(RouteHelper.getRecommendedFood(recommendedIndex, "cartPage"));
                                  }
                                }*/
                                      },
                                      child: Container(
                                        width: Dimensions.width20*5,
                                        height: Dimensions.height20*5,
                                        margin: EdgeInsets.only(bottom: Dimensions.height10),
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage('assets/images/foodimg1.jpg'),
                                                fit: BoxFit.cover),
                                            borderRadius: BorderRadius.circular(Dimensions.radius20),
                                            color: Colors.white
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: Dimensions.width10,),
                                    Expanded(child: Container(
                                      height: Dimensions.height20*5,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          BigText(text: "Bitter Oranger Juice",color: Colors.black54,),
                                          SmallText(text: "Spicy"),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              BigText(text: "\$33.0 ",color: Colors.redAccent,),
                                              Container(
                                                padding: EdgeInsets.only(top: Dimensions.height10, bottom: Dimensions.height10, right: Dimensions.width10,left: Dimensions.width10),
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                                                    color: Colors.white
                                                ),
                                                child: Row(
                                                  children: [
                                                    GestureDetector(
                                                        onTap: ()
                                                        {
                                                          //cartController.addItems(_cartList[index].product!, -1);

                                                        },

                                                        child: Container(
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(Dimensions.radius15-10),
                                                              color: Color(0xff89dad0),
                                                            ),
                                                            child: Icon(Icons.remove,color: Colors.black54,))),
                                                    SizedBox(width: Dimensions.width10/2,),
                                                    BigText(text: "0"/*_cartList[index].quantity.toString()*/),//popularProduct.quantity.toString()),
                                                    SizedBox(width: Dimensions.width10/2,),
                                                    GestureDetector(
                                                        onTap: ()
                                                        {
                                                          //cartController.addItems(_cartList[index].product!, 1);


                                                        },
                                                        child: Container(
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(Dimensions.radius15-10),
                                                              color: Color(0xff89dad0),
                                                            ),
                                                            child: Icon(Icons.add,color: Colors.black54,))),

                                                  ],
                                                ),
                                              ),

                                            ],
                                          )
                                        ],
                                      ),
                                    ))
                                  ],
                                ),
                              );
                            });
                      })
                  ),
                )):NoDataScreen(text: 'Your cart is empty');
          })
        ],
      ),
        bottomNavigationBar: GetBuilder<CartController>(builder: (cartController){
          return Container(
            height: Dimensions.bottomHeightBar,
            padding: EdgeInsets.only(top: Dimensions.height30, bottom: Dimensions.height30,left: Dimensions.width20, right: Dimensions.width20),
            decoration: BoxDecoration(
                color: Color(0xfff7f6f4),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20*2),
                    topRight: Radius.circular(Dimensions.radius20*2)
                )
            ),
            child: cartController.getItems.length>0?Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20, right: Dimensions.width20,left: Dimensions.width20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: Colors.white
                  ),
                  child: Row(
                    children: [

                      SizedBox(width: Dimensions.width10/2,),
                      BigText(text:"\$ "+ cartController.totalAmount.toString()),
                      SizedBox(width: Dimensions.width10/2,),


                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20, right: Dimensions.width20,left: Dimensions.width20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: Color(0xff89dad0)
                  ),
                  child: GestureDetector(
                      onTap: ()
                      {
                        //popularProduct.addItems(product);
                        cartController.addToHistory();
                      },
                      child: BigText(text: "Check out",color: Colors.white,)),
                )
              ],
            ):Container(),
          );
        },)

    );
  }
}
