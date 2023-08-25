

import 'package:ecommerce/controllers/popular_product_controler.dart';
import 'package:ecommerce/routes/route_helper.dart';
import 'package:ecommerce/screens/cart/cart_screen.dart';
import 'package:ecommerce/utils/dimensions.dart';
import 'package:ecommerce/widgets/app_icons.dart';
import 'package:ecommerce/widgets/big_texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controllers/recommended_product_controller.dart';
import '../../widgets/expandable_text.dart';

class RecommmendedFoodDetails extends StatelessWidget {
 // final int pageId;
  //final String? page;
  const RecommmendedFoodDetails({Key? key,/*required this.page*/ /*required this.pageId*/}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //var product = Get.find<RecommendedProductController>().recommendedProductList[pageId];
    //Get.find<PopularProductController>().initProduct(product,Get.find<CartController>());
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 80,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap:()
                     {
                       /*if(page=="cartpage")
                       {
                         Get.toNamed(RouteHelper.getCartPage());
                       }
                       else{
                         Get.toNamed(RouteHelper.getInitial());

                       }*/
                       Get.toNamed(RouteHelper.getInitial());

                     },
                    child: AppIcons(icon: Icons.clear)),
                GestureDetector(
                  onTap: ()
                    {
                      Get.toNamed(RouteHelper.getCartPage());
                    },
                    child: AppIcons(icon: Icons.shopping_cart_outlined)),
                /*GetBuilder<PopularProductController>(builder: (controller){
                return Stack(
                  children: [
                    AppIcons(icon: Icons.shopping_cart_outlined),
                    Get.find<PopularProductController>().totalItems>=1?
                    Positioned(
                      right :0, top : 0,
                        child: AppIcons(icon: Icons.circle,
                         size: 24,
                iconcolor: Colors.transparent,
                backgroundcolor: Color(0xff89dad0),)):Container(),

                    AppIcons(icon: Icons.shopping_cart_outlined),
                    Get.find<PopularProductController>().totalItems>=1?
                    Positioned(
                      right :0, top : 0,
                        child: BigText(text: Get.find<PopularProductController>().totalItems.toString(),
                        size: 12,
                        ),):Container(),
                  ],
                );
              })*/

              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                padding: EdgeInsets.only(top: 5, bottom: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimensions.radius30),
                    topLeft: Radius.circular(Dimensions.radius30),
                  )
                ),
                child: Center(
                    child: BigText(size: Dimensions.font26,text: "Biryani")),
            width: double.maxFinite,),
            ),
            pinned: true,
            backgroundColor: Color(0xff89dad0),
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset('assets/images/Biryani.jpg',
              width: double.maxFinite,
              fit: BoxFit.cover,),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                    child: ExpandableTExtWidget(text: "The most famous biryani dish originated among the Muslims and was first introduced in the subcontinent in the royal kitchens. However, the actual biryani originated in Persia and then transferred to the Mughals. That is why we can say that biryani is a regal and elite dish mainly made on different auspicious occasions. The most famous biryani dish originated among the Muslims and was first introduced in the subcontinent in the royal kitchens. However, the actual biryani originated in Persia and then transferred to the Mughals. That is why we can say that biryani is a regal and elite dish mainly made on different auspicious occasions. The most famous biryani dish originated among the Muslims and was first introduced in the subcontinent in the royal kitchens. However, the actual biryani originated in Persia and then transferred to the Mughals. That is why we can say that biryani is a regal and elite dish mainly made on different auspicious occasions. The most famous biryani dish originated among the Muslims and was first introduced in the subcontinent in the royal kitchens. However, the actual biryani originated in Persia and then transferred to the Mughals. That is why we can say that biryani is a regal and elite dish mainly made on different auspicious occasions. The most famous biryani dish originated among the Muslims and was first introduced in the subcontinent in the royal kitchens. However, the actual biryani originated in Persia and then transferred to the Mughals. That is why we can say that biryani is a regal and elite dish mainly made on different auspicious occasions. The most famous biryani dish originated among the Muslims and was first introduced in the subcontinent in the royal kitchens. However, the actual biryani originated in Persia and then transferred to the Mughals. That is why we can say that biryani is a regal and elite dish mainly made on different auspicious occasions. The most famous biryani dish originated among the Muslims and was first introduced in the subcontinent in the royal kitchens. However, the actual biryani originated in Persia and then transferred to the Mughals. That is why we can say that biryani is a regal and elite dish mainly made on different auspicious occasions. The most famous biryani dish originated among the Muslims and was first introduced in the subcontinent in the royal kitchens. However, the actual biryani originated in Persia and then transferred to the Mughals. That is why we can say that biryani is a regal and elite dish mainly made on different auspicious occasions."),
                margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
                ),

              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(builder: (controller){
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.only(
                left: Dimensions.width20*2.5,
                right: Dimensions.width20*2.5,
                top: Dimensions.height10,
                bottom: Dimensions.height10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: ()
                    {
                      controller.setQuantity(false);
                    },
                    child: AppIcons(icon: Icons.remove,
                      iconSize: Dimensions.icon24,
                      backgroundcolor: Color(0xff89dad0),
                      iconcolor: Colors.white,),
                  ),
                  BigText(text: " \$12.88 " + " X " + " ${controller.inCartItems} ",color: Color(0xff332d2b),size: Dimensions.font26,),
                  GestureDetector(
                    onTap: ()
                    {
                      controller.setQuantity(true);
                    },
                    child: AppIcons(icon: Icons.add,
                      iconSize: Dimensions.icon24,
                      backgroundcolor: Color(0xff89dad0),
                      iconcolor: Colors.white,),
                  )
                ],
              ),
            ),

            Container(
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
                    child: Icon(Icons.favorite,color: Color(0xFF89dad0),),
                  ),
                  GestureDetector(
                    onTap: ()
                    {
                      //controller.addItems(product);
                    },
                    child: Container(
                      padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20, right: Dimensions.width20,left: Dimensions.width20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimensions.radius20),
                          color: Color(0xff89dad0)
                      ),
                      child: BigText(text: "\$10 | Add to cart",color: Colors.white,),
                    ),
                  )
                ],
              ),
            ),

          ],
        );
      })
    );
  }
}
