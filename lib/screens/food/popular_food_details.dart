

import 'package:ecommerce/controllers/cart_controller.dart';
import 'package:ecommerce/controllers/popular_product_controler.dart';
import 'package:ecommerce/routes/route_helper.dart';
import 'package:ecommerce/screens/cart/cart_screen.dart';
import 'package:ecommerce/utils/dimensions.dart';
import 'package:ecommerce/widgets/app_icons.dart';
import 'package:ecommerce/widgets/big_texts.dart';
import 'package:ecommerce/widgets/expandable_text.dart';
import 'package:ecommerce/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../widgets/app_column.dart';
import '../../widgets/icons_and_text.dart';
import '../home/food_page_body.dart';
import '../home/main_food_screen.dart';

class PopularFoodDetails extends StatelessWidget {
  //int pageId;
  //final String? page;
  const PopularFoodDetails({Key? key, /*required this.page*/ /*required this.pageId*/}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //var product = Get.find<PopularProductController>().popularProductList[/*pageId*/];
    //print("page is id "+pageId.toString());
    //print("product name is "+product.name.toString());
    //Get.find<PopularProductController>().initProduct(product,Get.find<CartController>());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [

          //Background Image
          Positioned(
            left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.popularFoodImages,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                      image: AssetImage('assets/images/Biryani.jpg'),)
                ),
              )),

          //Icons widget
          Positioned(
            top: Dimensions.height45,
            left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: ()
              {
               /* if(page=="cartpage")
                  {
                    Get.toNamed(RouteHelper.getCartPage());
                  }
                else{
                  Get.toNamed(RouteHelper.getInitial());

                }*/
                Get.toNamed(RouteHelper.getInitial());
              },
                  child: AppIcons(icon: Icons.arrow_back_ios)),
              GestureDetector(
                onTap: ()
                  {
                    Get.toNamed(RouteHelper.getCartPage());

                  },
                  child: AppIcons(icon: Icons.shopping_cart_outlined)),

              /*GetBuilder<PopularProductController>(builder: (controller){
                return Stack(
                  children: [
                   GestureDetector(
                onTap: ()
                  {
                  if(controller.totalItems>=1)
                    Get.toNamed(RouteHelper.getCartPage());

                  },
                    child: AppIcons(icon: Icons.shopping_cart_outlined)),
                    controller.totalItems>=1?
                    Positioned(
                      right :0, top : 0,
                        child: AppIcons(icon: Icons.circle,
                         size: 24,
                iconcolor: Colors.transparent,
                backgroundcolor: Color(0xff89dad0),)):Container(),

                    AppIcons(icon: Icons.shopping_cart_outlined),
                    Get.find<PopularProductController>().totalItems>=1?
                    Positioned(
                      right :3, top : 3,
                        child: BigText(text: Get.find<PopularProductController>().totalItems.toString(),
                        size: 12,
                        ),):Container(),
                  ],
                );
              })*/
            ],
          )),

          //Introduction of food
          Positioned(
            left: 0,
              right: 0,
              bottom: 0,
              top: Dimensions.popularFoodImages-20,
              child: Container(
                padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, top: Dimensions.height20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(Dimensions.radius20),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(text: "Biryani",),
                    SizedBox(height: Dimensions.height20,),
                    BigText(text: "Introduce"),
                    SizedBox(height: Dimensions.height20,),
                    Expanded(
                        child: SingleChildScrollView(
                            child: ExpandableTExtWidget(text: "The most famous biryani dish originated among the Muslims and was first introduced in the subcontinent in the royal kitchens. However, the actual biryani originated in Persia and then transferred to the Mughals. That is why we can say that biryani is a regal and elite dish mainly made on different auspicious occasions.")))

                  ],
                ),
          )),

          //Expanadble Widget

        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(builder: (popularProduct){
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
          child: Row(
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
                    GestureDetector(
                        onTap: ()
                    {
                      popularProduct.setQuantity(false);
                    },

                        child: Icon(Icons.remove,color: Color(0xffa9a29f),)),
                    SizedBox(width: Dimensions.width10/2,),
                    BigText(text: popularProduct.quantity.toString()),
                    SizedBox(width: Dimensions.width10/2,),
                    GestureDetector(
                        onTap: ()
                        {
                          popularProduct.setQuantity(true);
                        },
                        child: Icon(Icons.add,color: Color(0xffa9a29f),)),

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
                    },
                    child: BigText(text: "\$10 | Add to cart",color: Colors.white,)),
              )
            ],
          ),
        );
      },)
    );
  }
}
